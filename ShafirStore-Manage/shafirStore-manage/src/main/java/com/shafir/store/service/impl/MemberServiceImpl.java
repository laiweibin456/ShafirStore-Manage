package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.entity.Member;
import com.shafir.store.entity.MemberLevel;
import com.shafir.store.entity.MemberPointsRecord;
import com.shafir.store.entity.MemberStoreRel;
import com.shafir.store.repository.MemberLevelRepository;
import com.shafir.store.repository.MemberPointsRecordRepository;
import com.shafir.store.repository.MemberRepository;
import com.shafir.store.repository.MemberStoreRelRepository;
import com.shafir.store.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final MemberLevelRepository memberLevelRepository;
    private final MemberPointsRecordRepository memberPointsRecordRepository;
    private final MemberStoreRelRepository memberStoreRelRepository;

    @Override
    public Member getById(Long id) {
        Member member = memberRepository.selectById(id);
        if (member != null) {
            enrichMemberInfo(member);
        }
        return member;
    }

    @Override
    public Member getByPhone(String phone) {
        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Member::getPhone, phone);
        Member member = memberRepository.selectOne(wrapper);
        if (member != null) {
            enrichMemberInfo(member);
        }
        return member;
    }

    @Override
    public IPage<Member> selectPage(Integer pageNum, Integer pageSize, String keyword, Integer level, Integer status) {
        Page<Member> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();

        if (StringUtils.hasText(keyword)) {
            wrapper.and(w -> w.like(Member::getName, keyword).or().like(Member::getPhone, keyword));
        }
        if (level != null) {
            wrapper.eq(Member::getLevel, level);
        }
        if (status != null) {
            wrapper.eq(Member::getStatus, status);
        }

        wrapper.orderByDesc(Member::getRegisterTime);
        IPage<Member> resultPage = memberRepository.selectPage(page, wrapper);

        for (Member member : resultPage.getRecords()) {
            enrichMemberInfo(member);
        }

        return resultPage;
    }

    @Override
    public List<Member> getAllMembers() {
        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Member::getStatus, 1);
        wrapper.orderByAsc(Member::getName);
        List<Member> members = memberRepository.selectList(wrapper);
        for (Member member : members) {
            enrichMemberInfo(member);
        }
        return members;
    }

    @Override
    @Transactional
    public boolean addMember(Member member) {
        if (member.getPhone() == null || member.getPhone().isEmpty()) {
            throw new BusinessException("手机号不能为空");
        }

        LambdaQueryWrapper<Member> phoneWrapper = new LambdaQueryWrapper<>();
        phoneWrapper.eq(Member::getPhone, member.getPhone());
        if (memberRepository.selectCount(phoneWrapper) > 0) {
            throw new BusinessException("手机号已被注册");
        }

        if (member.getStatus() == null) {
            member.setStatus(1);
        }
        if (member.getPoints() == null) {
            member.setPoints(0);
        }
        if (member.getTotalConsume() == null) {
            member.setTotalConsume(BigDecimal.ZERO);
        }
        if (member.getLevel() == null) {
            member.setLevel(1);
        }
        if (member.getRegisterTime() == null) {
            member.setRegisterTime(LocalDateTime.now());
        }

        boolean inserted = memberRepository.insert(member) > 0;

        if (inserted) {
            Long storeId = StoreContext.getCurrentStoreId();
            if (storeId != null) {
                getOrCreateMemberStoreRel(member.getId(), storeId);
            }
        }

        return inserted;
    }

    @Override
    @Transactional
    public boolean updateMember(Member member) {
        Member existingMember = memberRepository.selectById(member.getId());
        if (existingMember == null) {
            throw new BusinessException("会员不存在");
        }

        if (member.getPhone() != null && !member.getPhone().equals(existingMember.getPhone())) {
            LambdaQueryWrapper<Member> phoneWrapper = new LambdaQueryWrapper<>();
            phoneWrapper.eq(Member::getPhone, member.getPhone());
            phoneWrapper.ne(Member::getId, member.getId());
            if (memberRepository.selectCount(phoneWrapper) > 0) {
                throw new BusinessException("手机号已被其他会员使用");
            }
        }

        return memberRepository.updateById(member) > 0;
    }

    @Override
    @Transactional
    public boolean updateStatus(Long id, Integer status) {
        Member member = new Member();
        member.setId(id);
        member.setStatus(status);
        return memberRepository.updateById(member) > 0;
    }

    @Override
    @Transactional
    public boolean deleteMember(Long id) {
        return memberRepository.deleteById(id) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updatePoints(Long id, Integer points, Integer type, Long orderId, String remark) {
        Member member = memberRepository.selectById(id);
        if (member == null) {
            throw new BusinessException("会员不存在");
        }

        Long storeId = StoreContext.getCurrentStoreId();
        if (storeId == null) {
            throw new BusinessException("未指定当前店铺");
        }

        MemberStoreRel rel = getOrCreateMemberStoreRel(id, storeId);

        int newBalance;
        if (type == 1) {
            newBalance = rel.getPoints() + points;
        } else if (type == 2) {
            if (rel.getPoints() < points) {
                throw new BusinessException("积分余额不足");
            }
            newBalance = rel.getPoints() - points;
        } else {
            throw new BusinessException("积分操作类型错误");
        }

        rel.setPoints(newBalance);
        rel.setUpdateTime(LocalDateTime.now());
        memberStoreRelRepository.updateById(rel);

        MemberPointsRecord record = new MemberPointsRecord();
        record.setMemberId(id);
        record.setType(type);
        record.setPoints(points);
        record.setBalance(newBalance);
        record.setOrderId(orderId);
        record.setRemark(remark);
        record.setCreateTime(LocalDateTime.now());
        memberPointsRecordRepository.insert(record);

        return true;
    }

    @Override
    public int getMemberCount() {
        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Member::getStatus, 1);
        return memberRepository.selectCount(wrapper).intValue();
    }

    @Override
    public List<Member> getTopMembers(Integer limit) {
        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Member::getStatus, 1);
        wrapper.orderByDesc(Member::getTotalConsume);
        wrapper.last("LIMIT " + limit);
        List<Member> members = memberRepository.selectList(wrapper);
        for (Member member : members) {
            enrichMemberInfo(member);
        }
        return members;
    }

    private MemberStoreRel getOrCreateMemberStoreRel(Long memberId, Long storeId) {
        MemberStoreRel rel = memberStoreRelRepository.findByMemberIdAndStoreId(memberId, storeId);
        if (rel == null) {
            rel = new MemberStoreRel();
            rel.setMemberId(memberId);
            rel.setStoreId(storeId);
            rel.setTotalConsume(BigDecimal.ZERO);
            rel.setPoints(0);
            rel.setLevel(1);
            rel.setStatus(1);
            rel.setCreateTime(LocalDateTime.now());
            rel.setUpdateTime(LocalDateTime.now());
            memberStoreRelRepository.insert(rel);
        }
        return rel;
    }

    private void enrichMemberInfo(Member member) {
        if (member.getLevel() != null) {
            MemberLevel level = memberLevelRepository.selectById(member.getLevel());
            if (level != null) {
                member.setLevelName(level.getName());
            }
        }

        Long storeId = StoreContext.getCurrentStoreId();
        if (storeId != null) {
            MemberStoreRel rel = memberStoreRelRepository.findByMemberIdAndStoreId(member.getId(), storeId);
            if (rel != null) {
                member.setPoints(rel.getPoints());
                member.setTotalConsume(rel.getTotalConsume());
                member.setLevel(rel.getLevel());
                MemberLevel level = memberLevelRepository.selectById(rel.getLevel());
                if (level != null) {
                    member.setLevelName(level.getName());
                }
            }
        }
    }
}
