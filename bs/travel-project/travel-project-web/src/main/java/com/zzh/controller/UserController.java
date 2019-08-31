package com.zzh.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.zzh.common.Const;
import com.zzh.common.ServerResponse;
import com.zzh.entity.EmailValidate;
import com.zzh.entity.User;
import com.zzh.service.IEmailValidateService;
import com.zzh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-01-24
 */
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private IUserService userService;
    @Autowired
    private IEmailValidateService emailValidateService;

    /**
     * 注册
     * @param user
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public ServerResponse<String> register (User user,String registerCode){
        System.out.println(user.toString());
        //对传参进行校验

        //验证邮箱验证码
        EntityWrapper<EmailValidate> entityWrapper=new EntityWrapper<>();
        entityWrapper.eq("email",user.getEmail())
                .eq("validate_code",registerCode);
        if(emailValidateService.selectCount(entityWrapper)<=0){
            return ServerResponse.createByErrorMessage("注册码错误");
        }

        //保存
        user.setCreateTime(new Date());
        user.setRole(10);
        if (user.insert()){
            return ServerResponse.createBySuccessMessage("注册成功");
        }else{
            return ServerResponse.createByError();
        }

    }


    /**
     * 用户登录
     * @param  username
     * @param  password
     * @param  session
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public ServerResponse<User> login(String username, String password, HttpSession session){

        ServerResponse<User> response= userService.logion(username,password);
        if (response.isSuccess()){
            session.setAttribute(Const.CURRENT_USER,response.getData());
        }
        return  response;
    }

    /**
     * 用户登录
     * @param  username
     * @param  password
     * @param  session
     * @return
     */
    @RequestMapping("/admin/login")
    @ResponseBody
    public ServerResponse<User> adminLogin(String username, String password, HttpSession session){

        ServerResponse<User> response= userService.logion(username,password);

        if (response.isSuccess()){
            if (response.getData().getRole()>=10){
                return ServerResponse.createByErrorMessage("请登录管理员用户");
            }
            session.setAttribute(Const.ADMIN_USER,response.getData());
        }
        return  response;
    }

    @RequestMapping("/update")
    @ResponseBody
    public ServerResponse update(User user){
        return ServerResponse.createByResult(userService.updateById(user));
    }

    @RequestMapping("updateView")
    public String updateView(HttpSession session, Model model){
        User user = (User)session.getAttribute(Const.CURRENT_USER);

        model.addAttribute("user",user);
        return "index/user_info";
    }


    /*
    @GetMapping("/check_email/{id}")
    @ResponseBody
    public ServerResponse<String>checkEmail(@PathVariable String id){

    }*/



}

