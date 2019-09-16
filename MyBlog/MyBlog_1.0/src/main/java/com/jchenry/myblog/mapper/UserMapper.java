package com.jchenry.myblog.mapper;

import com.jchenry.myblog.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public interface UserMapper {

    List<User> selectAll();

    User selectUser(@Param("userName") String userName,
                                   @Param("password") String password);
}