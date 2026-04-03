package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberRepository extends BaseMapper<Member> {

    @Select("SELECT COALESCE(MAX(id), 0) FROM member")
    Long getMaxId();
}