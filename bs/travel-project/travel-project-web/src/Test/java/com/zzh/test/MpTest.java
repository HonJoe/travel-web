package com.zzh.test;

import com.zzh.service.IEmailValidateService;
import com.zzh.service.impl.EmailValidateServiceImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by lenovo on 2019/1/25.
 */
public class MpTest {

    public static  void main(String[] args){
        //创建一个spring容器
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
//        UserMapper userMapper = applicationContext.getBean("userMapper",UserMapper.class);
        IEmailValidateService emailValidateService=applicationContext.getBean("emailValidateServiceImpl", EmailValidateServiceImpl.class);
        try {
            emailValidateService.sendEmail("924901052@qq.com");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
