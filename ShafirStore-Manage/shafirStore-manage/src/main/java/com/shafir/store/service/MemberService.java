package com.shafir.store.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.entity.Member;

import java.util.List;

public interface MemberService {

    Member getById(Long id);

    Member getByPhone(String phone);

    IPage<Member> selectPage(Integer pageNum, Integer pageSize, String keyword, Integer level, Integer status);

    List<Member> getAllMembers();

    boolean addMember(Member member);

    boolean updateMember(Member member);

    boolean updateStatus(Long id, Integer status);

    boolean deleteMember(Long id);

    boolean updatePoints(Long id, Integer points, Integer type, Long orderId, String remark);

    int getMemberCount();

    List<Member> getTopMembers(Integer limit);
}