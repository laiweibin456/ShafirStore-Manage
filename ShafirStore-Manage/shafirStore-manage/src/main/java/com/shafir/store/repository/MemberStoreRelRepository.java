package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.MemberStoreRel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MemberStoreRelRepository extends BaseMapper<MemberStoreRel> {

    @Select("SELECT * FROM member_store_rel WHERE member_id = #{memberId} AND store_id = #{storeId}")
    MemberStoreRel findByMemberIdAndStoreId(@Param("memberId") Long memberId, @Param("storeId") Long storeId);

    @Select("SELECT * FROM member_store_rel WHERE member_id = #{memberId}")
    List<MemberStoreRel> findByMemberId(@Param("memberId") Long memberId);
}
