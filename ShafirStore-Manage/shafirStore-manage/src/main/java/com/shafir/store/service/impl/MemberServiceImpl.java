package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.entity.Member;
import com.shafir.store.entity.MemberLevel;
import com.shafir.store.entity.MemberPointsRecord;
import com.shafir.store.repository.MemberLevelRepository;
import com.shafir.store.repository.MemberPointsRecordRepository;
import com.shafir.store.repository.MemberRepository;
import com.shafir.store.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final MemberLevelRepository memberLevelRepository;
    private final MemberPointsRecordRepository memberPointsRecordRepository;

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
            member.setTotalConsume(java.math.BigDecimal.ZERO);
        }
        if (member.getLevel() == null) {
            member.setLevel(1);
        }
        if (member.getRegisterTime() == null) {
            member.setRegisterTime(LocalDateTime.now());
        }

        return memberRepository.insert(member) > 0;
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
    @Transactional
    public boolean updatePoints(Long id, Integer points, Integer type, Long orderId, String remark) {
        Member member = memberRepository.selectById(id);
        if (member == null) {
            throw new BusinessException("会员不存在");
        }

        int newBalance;
        if (type == 1) {
            newBalance = member.getPoints() + points;
        } else if (type == 2) {
            if (member.getPoints() < points) {
                throw new BusinessException("积分余额不足");
            }
            newBalance = member.getPoints() - points;
        } else {
            throw new BusinessException("积分操作类型错误");
        }

        Member updateMember = new Member();
        updateMember.setId(id);
        updateMember.setPoints(newBalance);
        memberRepository.updateById(updateMember);

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

    private void enrichMemberInfo(Member member) {
        if (member.getLevel() != null) {
            MemberLevel level = memberLevelRepository.selectById(member.getLevel());
            if (level != null) {
                member.setLevelName(level.getName());
            }
        }
    }
}