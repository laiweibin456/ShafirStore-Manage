package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.Role;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoleRepository extends BaseMapper<Role> {
}
