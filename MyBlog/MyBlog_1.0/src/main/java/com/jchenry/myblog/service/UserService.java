package com.jchenry.myblog.service;

import com.jchenry.myblog.domain.User;
import com.jchenry.myblog.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * UserService
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/27 20:04
 * @Version 1.0
 **/
@Service
public class UserService {

    @Autowired
    private UserMapper mapper;

    public User checkAccount(String identity, String password){
        return mapper.selectUser(identity,password);
    }
}
