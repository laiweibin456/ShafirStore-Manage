package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.MemberLevel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberLevelRepository extends BaseMapper<MemberLevel> {
}