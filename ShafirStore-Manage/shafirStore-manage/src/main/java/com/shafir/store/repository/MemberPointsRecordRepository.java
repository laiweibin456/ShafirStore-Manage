package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.MemberPointsRecord;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberPointsRecordRepository extends BaseMapper<MemberPointsRecord> {
}