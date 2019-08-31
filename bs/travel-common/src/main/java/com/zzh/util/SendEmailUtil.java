package com.zzh.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 */
public class SendEmailUtil {


    //邮件服务器主机名
    // QQ邮箱的 SMTP 服务器地址为: smtp.qq.com
     private static String myEmailSMTPHost = "smtp.qq.com";
    //发件人邮箱
    private static String myEmailAccount = "924901052@qq.com";
    //发件人邮箱密码（授权码）
    //在开启SMTP服务时会获取到一个授权码，把授权码填在这里
    private static String myEmailPassword = "uodukdimvpsvbejj";
    //发送邮件端口
    private static String emialPort="587";


	public static void main(String[] args) {
		try {
			sendMail("852276920@qq.com", "标题1","测试邮件");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	    public static void setContext(String SMTPHost,String emialAccount,String password,String port){
            myEmailSMTPHost=SMTPHost;
            myEmailAccount=emialAccount;
            myEmailPassword=password;
            emialPort=port;
        }


        public static void sendMail(String toEmailAddress, String emailTitle, String emailContent) throws Exception{
            // 创建Properties 类用于记录邮箱的一些属性
            final Properties props = new Properties();
            // 表示SMTP发送邮件，必须进行身份验证
            props.put("mail.smtp.auth", "true");
            //此处填写SMTP服务器
            props.put("mail.smtp.host", myEmailSMTPHost);
            //端口号，QQ邮箱给出了两个端口，但是另一个我一直使用不了，所以就给出这一个587
            props.put("mail.smtp.port", emialPort);
            // 此处填写你的账号
            props.put("mail.user", myEmailAccount);
            // 此处的密码就是前面说的16位STMP口令
            props.put("mail.password", myEmailPassword);

            // 构建授权信息，用于进行SMTP进行身份验证
            Authenticator authenticator = new Authenticator() {

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    // 用户名、密码
                    String userName = props.getProperty("mail.user");
                    String password = props.getProperty("mail.password");
                    return new PasswordAuthentication(userName, password);
                }
            };

            // 使用环境属性和授权信息，创建邮件会话
            Session mailSession = Session.getInstance(props, authenticator);
            // 创建邮件消息
            MimeMessage message = new MimeMessage(mailSession);
            // 设置发件人
            InternetAddress form = new InternetAddress(
                    props.getProperty("mail.user"));
            message.setFrom(form);

            // 设置收件人的邮箱
            InternetAddress to = new InternetAddress(toEmailAddress);
            message.setRecipient(Message.RecipientType.TO, to);

            // 设置邮件标题
            message.setSubject(emailTitle);

            // 设置邮件的内容体
            message.setContent(emailContent, "text/html;charset=UTF-8");

            // 最后当然就是发送邮件啦
            Transport.send(message);
        
	}
}
