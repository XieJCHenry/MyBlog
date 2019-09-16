package com.jchenry.myblog.controller;

import com.jchenry.myblog.domain.User;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.service.UserService;
import com.jchenry.myblog.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * UserController
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/27 19:13
 * @Version 1.0
 **/
@Controller
@RequestMapping(path = "user")
public class UserController {

    @Autowired
    private UserService userService;


    /*@PostMapping("doLogin")
    public String doLogin(@RequestParam(value = "username") String username,
                          @RequestParam(value = "password") String password,
                          HttpSession session) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/console";
        } else {
            return "redirect:/login";
        }
    }*/

    /*@PostMapping("doLogin")
    @ResponseBody
    public Msg doLogin(@RequestParam("username")String userName,
                       @RequestParam("password")String password) {
        User user = userService.checkAccount(userName, password);
        if (user != null) {
            String token = JwtUtil.sign(user.getUsername(), user.getUserId().toString());
            System.out.println("controller : " + token);
            if (token != null) {
                return Msg.success().add("accessToken", token);
            }
        }
        return Msg.error();
    }*/

    @PostMapping("doLogin")
    public String doLogin(@RequestParam("username") String userName,
                          @RequestParam("password") String password,
                          HttpSession session) {
        User user = userService.checkAccount(userName, password);
        if (user != null) {
            String token = JwtUtil.sign(user.getUsername(), user.getUserId().toString());
            if (token != null) {
                session.setAttribute("accessToken",token);
                return "redirect:/console";
            }
        }
        return "redirect:/login";
    }

    public String doLogout() {
        return "";
    }
}
