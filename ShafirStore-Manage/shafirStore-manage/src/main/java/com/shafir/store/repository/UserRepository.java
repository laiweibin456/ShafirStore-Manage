package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository extends BaseMapper<User> {
}
