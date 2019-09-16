package com.jchenry.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * TestController
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/29 17:56
 * @Version 1.0
 **/
@Controller
public class TestController {

    @GetMapping("test")
    public String test() {
        return "test/test";
    }
}
