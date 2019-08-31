package com.zzh.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zzh.common.ServerResponse;
import com.zzh.dao.UserMapper;
import com.zzh.entity.User;
import com.zzh.service.IUserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zzh
 * @since 2019-01-24
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {



    @Override
    public ServerResponse logion(String username, String password) {
        EntityWrapper<User> ew = new EntityWrapper<User>();
        ew.eq("username",username).eq("password",password);
        User user=new User();
        if ((user=user.selectOne(ew))!=null){
            user.setPassword("");
            return ServerResponse.createBySuccess(user);
        }else{
           return ServerResponse.createByErrorMessage("用户名或密码错误");
        }
    }
}
