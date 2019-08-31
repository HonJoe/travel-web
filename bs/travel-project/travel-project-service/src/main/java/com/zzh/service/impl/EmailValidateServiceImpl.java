package com.zzh.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zzh.dao.EmailValidateMapper;
import com.zzh.entity.EmailValidate;
import com.zzh.service.IEmailValidateService;
import com.zzh.util.SendEmailUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zzh
 * @since 2019-01-26
 */
@Service
public class EmailValidateServiceImpl extends ServiceImpl<EmailValidateMapper, EmailValidate> implements IEmailValidateService {

    @Value("${email_SMTPHost}")
    private  String myEmailSMTPHost;
    @Value("${email_Account}")
    private  String myEmailAccount;
    @Value("${email_Password}")
    private  String myEmailPassword ;
    @Value("${email_Port}")
    private  String emialPort;

    @Override
    public boolean sendEmail(String toEmailAccount) throws Exception {
        //发送邮件
        SendEmailUtil.setContext(myEmailSMTPHost,myEmailAccount,myEmailPassword,emialPort);
        String registerCode=registerCode();
        String title="注册码为："+registerCode;
        String content="注册码为："+registerCode+",请注意查收";
        SendEmailUtil.sendMail(toEmailAccount,title,content);
        //保存验证码
        EmailValidate emailValidate=new EmailValidate();
        emailValidate.setEmail(toEmailAccount);
        emailValidate.setValidateCode(registerCode);
        emailValidate.setCreateTime(new Date());
        return emailValidate.insert();
    }


    //注册码
    public  String registerCode(){
        String numberString="";
        //四位位随机数
        int i=(int)(Math.random()*10);
        int j=(int)(Math.random()*100);
        int k=(int)(Math.random()*1000);
        int l=(int)(Math.random()*10000);
        //最高位不为0
        while (l==0) {
            k=(int)(Math.random()*10000);
        }
        numberString=""+(i+j+k+l)+"";
        return numberString;
    }

}
