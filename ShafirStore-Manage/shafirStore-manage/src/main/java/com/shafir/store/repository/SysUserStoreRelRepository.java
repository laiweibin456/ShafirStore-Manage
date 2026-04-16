package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.SysUserStoreRel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SysUserStoreRelRepository extends BaseMapper<SysUserStoreRel> {

    @Select("SELECT store_id FROM sys_user_store_rel WHERE user_id = #{userId}")
    List<Long> findStoreIdsByUserId(@Param("userId") Long userId);
}
