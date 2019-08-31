package com.zzh.controller;


import com.zzh.common.ServerResponse;
import com.zzh.service.IEmailValidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-01-26
 */
@Controller
public class EmailValidateController {

    @Autowired
    private  IEmailValidateService emailValidateService;

    //发送验证码
    @RequestMapping("/emailValidate")
    @ResponseBody
    public ServerResponse emialRegister(String email) throws Exception {

        //对邮箱格式进行验证


        //send
        boolean result=emailValidateService.sendEmail(email);
        if (result){
            return ServerResponse.createBySuccess();
        }else{
            return ServerResponse.createByError();
        }
    }


}

