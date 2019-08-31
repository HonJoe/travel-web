package com.zzh.controller.backend;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.zzh.common.Const;
import com.zzh.common.ServerResponse;
import com.zzh.entity.User;
import com.zzh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
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
@RequestMapping("/manager/user")
public class UserMangeController {


    @Autowired
    private IUserService userService;


    /**
     * 用户列表
     * @param keyword
     * @param current
     * @param size
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public ServerResponse list(String keyword, @RequestParam(value="current",defaultValue="1") int current, @RequestParam(value="size",defaultValue="10") int size){
        System.out.println(keyword);
        EntityWrapper<User> userEntityWrapper=new EntityWrapper<User>();
        userEntityWrapper.like("username",keyword).or().like("email",keyword).or().like("phone",keyword);
        return ServerResponse.createBySuccess(userService.selectPage(new Page<User>(current,size),userEntityWrapper));
    }

    /**
     *
     */
    @ResponseBody
    @RequestMapping("/count")
    public int getCountPage(){
        return userService.selectCount(null);
    }

    /**
     * 批量删除
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    public  ServerResponse delete(String[] id){
        return ServerResponse.createByResult(userService.deleteBatchIds(Arrays.asList(id)));
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
     * 更新
     * @param user
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/update")
    public ServerResponse update(User user){
        user.setUpdateTime(new Date());
        return ServerResponse.createByResult(user.updateById());

    }

    @RequestMapping("/updateView/{id}")
    public String updateView(@PathVariable String id, Model model){
        User user=userService.selectById(id);
        model.addAttribute(user);
        return "backend/user_update";
    }

    @RequestMapping("/loginView")
    public String loginView(){
        return "backedn/login";
    }
}

