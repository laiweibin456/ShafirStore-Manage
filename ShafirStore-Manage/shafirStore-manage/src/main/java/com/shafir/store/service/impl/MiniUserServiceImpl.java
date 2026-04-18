package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.common.utils.JwtUtil;
import com.shafir.store.entity.*;
import com.shafir.store.repository.*;
import com.shafir.store.service.InventoryService;
import com.shafir.store.service.MiniUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class MiniUserServiceImpl implements MiniUserService {

    private final RegularUserRepository regularUserRepository;
    private final MemberRepository memberRepository;
    private final MemberLevelRepository memberLevelRepository;
    private final MemberPointsRecordRepository memberPointsRecordRepository;
    private final MemberStoreRelRepository memberStoreRelRepository;
    private final ProductRepository productRepository;
    private final InventoryService inventoryService;
    private final JwtUtil jwtUtil;

    @Override
    @Transactional
    public RegularUser register(String phone, String password, String nickname) {
        LambdaQueryWrapper<Member> memberPhoneWrapper = new LambdaQueryWrapper<>();
        memberPhoneWrapper.eq(Member::getPhone, phone);
        if (memberRepository.selectCount(memberPhoneWrapper) > 0) {
            throw new BusinessException("手机号已注册");
        }

        Member member = new Member();
        member.setPhone(phone);
        member.setPassword(password);
        member.setName(StringUtils.hasText(nickname) ? nickname : "用户" + phone.substring(phone.length() - 4));
        member.setTotalConsume(BigDecimal.ZERO);
        member.setPoints(0);
        member.setLevel(1);
        member.setStatus(1);
        member.setRegisterTime(LocalDateTime.now());
        member.setUpdateTime(LocalDateTime.now());

        memberRepository.insert(member);

        RegularUser user = new RegularUser();
        user.setId(member.getId());
        user.setPhone(phone);
        user.setPassword(password);
        user.setNickname(member.getName());
        user.setTotalConsume(BigDecimal.ZERO);
        user.setCreateTime(LocalDateTime.now());
        user.setStatus(1);

        return user;
    }

    @Override
    public Map<String, Object> login(String phone, String password) {
        LambdaQueryWrapper<Member> memberWrapper = new LambdaQueryWrapper<>();
        memberWrapper.eq(Member::getPhone, phone);
        Member member = memberRepository.selectOne(memberWrapper);

        if (member == null) {
            throw new BusinessException("用户不存在");
        }

        if (member.getPassword() != null && !password.equals(member.getPassword())) {
            throw new BusinessException("密码错误");
        }

        if (member.getStatus() == 0) {
            throw new BusinessException("账号已被禁用");
        }

        String token = jwtUtil.generateToken(member.getId(), phone, "member");

        Map<String, Object> result = new HashMap<>();
        result.put("token", token);
        result.put("userType", 2);

        Map<String, Object> userInfo = buildMemberInfo(member);
        result.put("userInfo", userInfo);

        return result;
    }

    @Override
    public Map<String, Object> getUserInfo(Long userId, Integer userType) {
        if (userType == 1) {
            RegularUser user = regularUserRepository.selectById(userId);
            if (user == null) {
                throw new BusinessException("用户不存在");
            }
            return buildRegularUserInfo(user);
        } else {
            Member member = memberRepository.selectById(userId);
            if (member == null) {
                throw new BusinessException("会员不存在");
            }
            return buildMemberInfo(member);
        }
    }

    @Override
    public boolean updateUserInfo(Long userId, Integer userType, String nickname) {
        if (userType == 1) {
            RegularUser user = regularUserRepository.selectById(userId);
            if (user == null) {
                throw new BusinessException("用户不存在");
            }
            user.setNickname(nickname);
            return regularUserRepository.updateById(user) > 0;
        } else {
            Member member = memberRepository.selectById(userId);
            if (member == null) {
                throw new BusinessException("会员不存在");
            }
            member.setName(nickname);
            return memberRepository.updateById(member) > 0;
        }
    }

    @Override
    @Transactional
    public Member upgradeToMember(RegularUser user) {
        LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
        levelWrapper.gt(MemberLevel::getMinAmount, user.getTotalConsume());
        levelWrapper.orderByAsc(MemberLevel::getMinAmount);
        levelWrapper.last("LIMIT 1");
        MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

        if (nextLevel == null) {
            LambdaQueryWrapper<MemberLevel> maxLevelWrapper = new LambdaQueryWrapper<>();
            maxLevelWrapper.orderByDesc(MemberLevel::getLevel);
            maxLevelWrapper.last("LIMIT 1");
            nextLevel = memberLevelRepository.selectOne(maxLevelWrapper);
        }

        Member member = new Member();
        member.setName(user.getNickname());
        member.setPhone(user.getPhone());
        member.setGender(null);
        member.setBirthday(null);
        member.setPoints(0);
        member.setTotalConsume(user.getTotalConsume());
        member.setLevel(nextLevel != null ? nextLevel.getLevel() : 1);
        member.setStatus(1);
        member.setRegisterTime(LocalDateTime.now());
        member.setUpdateTime(LocalDateTime.now());

        memberRepository.insert(member);

        regularUserRepository.deleteById(user.getId());

        return member;
    }

    private Map<String, Object> buildRegularUserInfo(RegularUser user) {
        Map<String, Object> userInfo = new HashMap<>();
        userInfo.put("id", user.getId());
        userInfo.put("phone", user.getPhone());
        userInfo.put("nickname", user.getNickname());
        userInfo.put("totalConsume", user.getTotalConsume());
        userInfo.put("level", 1);
        userInfo.put("levelName", "普通用户");

        LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
        levelWrapper.gt(MemberLevel::getLevel, 1);
        levelWrapper.orderByAsc(MemberLevel::getLevel);
        levelWrapper.last("LIMIT 1");
        MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

        if (nextLevel != null) {
            userInfo.put("nextLevelThreshold", nextLevel.getMinAmount());
            userInfo.put("nextLevelName", nextLevel.getName());
        } else {
            userInfo.put("nextLevelThreshold", null);
            userInfo.put("nextLevelName", "最高等级");
        }
        userInfo.put("discount", 1.0);

        return userInfo;
    }

    private Map<String, Object> buildMemberInfo(Member member) {
        Map<String, Object> userInfo = new HashMap<>();
        userInfo.put("id", member.getId());
        userInfo.put("phone", member.getPhone());
        userInfo.put("nickname", member.getName());
        userInfo.put("totalConsume", member.getTotalConsume());
        userInfo.put("level", member.getLevel() != null ? member.getLevel() : 1);
        userInfo.put("points", member.getPoints() != null ? member.getPoints() : 0);

        if (member.getLevel() != null) {
            LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
            levelWrapper.eq(MemberLevel::getLevel, member.getLevel());
            levelWrapper.orderByAsc(MemberLevel::getId);
            levelWrapper.last("LIMIT 1");
            MemberLevel level = memberLevelRepository.selectOne(levelWrapper);
            if (level != null) {
                userInfo.put("levelName", level.getName());
                userInfo.put("discount", level.getDiscount() != null ? level.getDiscount() : 1.0);
            } else {
                userInfo.put("levelName", "普通会员");
                userInfo.put("discount", 1.0);
            }
        } else {
            userInfo.put("levelName", "普通会员");
            userInfo.put("discount", 1.0);
        }

        LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
        levelWrapper.gt(MemberLevel::getLevel, member.getLevel() != null ? member.getLevel() : 0);
        levelWrapper.orderByAsc(MemberLevel::getLevel);
        levelWrapper.last("LIMIT 1");
        MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

        if (nextLevel != null) {
            userInfo.put("nextLevelThreshold", nextLevel.getMinAmount());
            userInfo.put("nextLevelName", nextLevel.getName());
        } else {
            userInfo.put("nextLevelThreshold", null);
            userInfo.put("nextLevelName", "最高等级");
        }

        return userInfo;
    }

    @Override
    public IPage<MemberPointsRecord> getPointsRecords(Long memberId, Integer pageNum, Integer pageSize) {
        Page<MemberPointsRecord> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<MemberPointsRecord> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(MemberPointsRecord::getMemberId, memberId);
        wrapper.orderByDesc(MemberPointsRecord::getCreateTime);
        return memberPointsRecordRepository.selectPage(page, wrapper);
    }

    @Override
    public List<Map<String, Object>> getExchangeProducts(Long memberId) {
        Long storeId = StoreContext.getCurrentStoreId();
        if (storeId == null) {
            throw new BusinessException("未指定当前店铺");
        }

        Member member = memberRepository.selectById(memberId);
        int currentPoints = member != null ? (member.getPoints() != null ? member.getPoints() : 0) : 0;

        LambdaQueryWrapper<Product> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Product::getStatus, 1);
        wrapper.eq(Product::getStoreId, storeId);
        List<Product> products = productRepository.selectList(wrapper);

        List<Map<String, Object>> result = new ArrayList<>();
        for (Product product : products) {
            Inventory inventory = inventoryService.getByProductId(product.getId());
            int stockQuantity = inventory != null ? inventory.getQuantity() : 0;

            int requiredPoints = product.getPrice().multiply(new BigDecimal("3")).intValue();

            Map<String, Object> item = new HashMap<>();
            item.put("id", product.getId());
            item.put("name", product.getName());
            item.put("price", product.getPrice());
            item.put("imageUrl", product.getImageUrl());
            item.put("stockQuantity", stockQuantity);
            item.put("requiredPoints", requiredPoints);
            item.put("canExchange", currentPoints >= requiredPoints && stockQuantity > 0);

            result.add(item);
        }

        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean exchangeProduct(Long memberId, Long productId) {
        Long storeId = StoreContext.getCurrentStoreId();
        if (storeId == null) {
            throw new BusinessException("未指定当前店铺");
        }

        Product product = productRepository.selectById(productId);
        if (product == null || product.getStatus() != 1) {
            throw new BusinessException("商品不存在或已下架");
        }

        Inventory inventory = inventoryService.getByProductId(productId);
        if (inventory == null || inventory.getQuantity() < 1) {
            throw new BusinessException("商品库存不足");
        }

        Member member = memberRepository.selectById(memberId);
        if (member == null) {
            throw new BusinessException("会员不存在");
        }

        int currentPoints = member.getPoints() != null ? member.getPoints() : 0;
        int requiredPoints = product.getPrice().multiply(new BigDecimal("3")).intValue();

        if (currentPoints < requiredPoints) {
            throw new BusinessException("积分不足，需要 " + requiredPoints + " 积分，当前 " + currentPoints + " 积分");
        }

        int newPoints = currentPoints - requiredPoints;
        member.setPoints(newPoints);
        member.setUpdateTime(LocalDateTime.now());
        memberRepository.updateById(member);

        MemberPointsRecord record = new MemberPointsRecord();
        record.setMemberId(memberId);
        record.setStoreId(storeId);
        record.setType(2);
        record.setPoints(requiredPoints);
        record.setBalance(newPoints);
        record.setRemark("积分兑换商品：" + product.getName());
        record.setCreateTime(LocalDateTime.now());
        memberPointsRecordRepository.insert(record);

        inventoryService.stockOut(productId, 1, memberId, null, "积分兑换商品：" + product.getName());

        return true;
    }
}