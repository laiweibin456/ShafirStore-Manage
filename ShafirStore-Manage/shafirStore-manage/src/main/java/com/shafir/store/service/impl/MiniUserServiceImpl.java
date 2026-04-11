package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.common.utils.JwtUtil;
import com.shafir.store.entity.Member;
import com.shafir.store.entity.MemberLevel;
import com.shafir.store.entity.RegularUser;
import com.shafir.store.repository.MemberLevelRepository;
import com.shafir.store.repository.MemberRepository;
import com.shafir.store.repository.RegularUserRepository;
import com.shafir.store.service.MiniUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MiniUserServiceImpl implements MiniUserService {

    private final RegularUserRepository regularUserRepository;
    private final MemberRepository memberRepository;
    private final MemberLevelRepository memberLevelRepository;
    private final JwtUtil jwtUtil;

    @Override
    @Transactional
    public RegularUser register(String phone, String password, String nickname) {
        LambdaQueryWrapper<RegularUser> phoneWrapper = new LambdaQueryWrapper<>();
        phoneWrapper.eq(RegularUser::getPhone, phone);
        if (regularUserRepository.selectCount(phoneWrapper) > 0) {
            throw new BusinessException("手机号已注册");
        }

        LambdaQueryWrapper<Member> memberPhoneWrapper = new LambdaQueryWrapper<>();
        memberPhoneWrapper.eq(Member::getPhone, phone);
        if (memberRepository.selectCount(memberPhoneWrapper) > 0) {
            throw new BusinessException("手机号已注册");
        }

        RegularUser user = new RegularUser();
        user.setPhone(phone);
        user.setPassword(password);
        user.setNickname(StringUtils.hasText(nickname) ? nickname : "用户" + phone.substring(phone.length() - 4));
        user.setTotalConsume(BigDecimal.ZERO);
        user.setCreateTime(LocalDateTime.now());
        user.setStatus(1);

        regularUserRepository.insert(user);
        return user;
    }

    @Override
    public Map<String, Object> login(String phone, String password) {
        LambdaQueryWrapper<RegularUser> regularWrapper = new LambdaQueryWrapper<>();
        regularWrapper.eq(RegularUser::getPhone, phone);
        RegularUser regularUser = regularUserRepository.selectOne(regularWrapper);

        if (regularUser != null) {
            if (!password.equals(regularUser.getPassword())) {
                throw new BusinessException("密码错误");
            }
            if (regularUser.getStatus() == 0) {
                throw new BusinessException("账号已被禁用");
            }

            String token = jwtUtil.generateToken(regularUser.getId(), phone, "regular_user");

            Map<String, Object> result = new HashMap<>();
            result.put("token", token);
            result.put("userType", 1);

            Map<String, Object> userInfo = buildRegularUserInfo(regularUser);
            result.put("userInfo", userInfo);

            return result;
        }

        LambdaQueryWrapper<Member> memberWrapper = new LambdaQueryWrapper<>();
        memberWrapper.eq(Member::getPhone, phone);
        Member member = memberRepository.selectOne(memberWrapper);

        if (member != null) {
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

        throw new BusinessException("用户不存在");
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
        levelWrapper.orderByAsc(MemberLevel::getMinAmount);
        levelWrapper.last("LIMIT 1");
        MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

        if (nextLevel != null) {
            userInfo.put("nextLevelThreshold", nextLevel.getMinAmount());
            userInfo.put("nextLevelName", nextLevel.getName());
        } else {
            userInfo.put("nextLevelThreshold", 0);
            userInfo.put("nextLevelName", "无");
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
        userInfo.put("level", member.getLevel());
        userInfo.put("points", member.getPoints());

        if (member.getLevel() != null) {
            MemberLevel level = memberLevelRepository.selectById(member.getLevel());
            if (level != null) {
                userInfo.put("levelName", level.getName());
                userInfo.put("discount", level.getDiscount());
            }
        }

        LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
        levelWrapper.gt(MemberLevel::getLevel, member.getLevel());
        levelWrapper.orderByAsc(MemberLevel::getMinAmount);
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
}