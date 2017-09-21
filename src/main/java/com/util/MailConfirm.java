package com.util;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

/**
 * Created by huozongsheng on 2017/9/1.
 */
public class MailConfirm {
    private String [] code;
    private String Account = "2049342955@qq.com";
    private String PassWord = "dfldximcmaadecea";
    public static String myEmailSMTPHost = "smtp.qq.com";
    public String icode;

    public MailConfirm(){
        code = new String []{"0","1","2","3","4","5","6","7","8","9"};
    }
    public String getCode(){
        String result = "";
        for (int i=0; i<=5; i++){
            int number = new Random().nextInt(10);
            result = result+code[number];
        }
        return result;
    }

    public String sendMail(String email) throws Exception {
        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
        //HttpServletRequest req = new HttpServletRequest();
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);
        icode = getCode();
        MimeMessage message = createMimeMessage(session, Account, email,icode);

        // 4. 根据 Session 获取邮件传输对象
        Transport transport = session.getTransport();

        transport.connect(Account, PassWord);

        // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(message, message.getAllRecipients());

        // 7. 关闭连接
        transport.close();
        return "";
    }

    public MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String icode) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人
        message.setFrom(new InternetAddress(sendMail, "优购房", "UTF-8"));

        // 3. To: 收件人
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "优购房新注册用户", "UTF-8"));

        // 4. Subject: 邮件主题
        message.setSubject("登录邮箱验证", "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）
        message.setContent("您的验证码为:"+icode, "text/html;charset=UTF-8");

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

    public static void main(String [] args){
        MailConfirm mailConfirm = new MailConfirm();
        
        try {
            mailConfirm.sendMail("568792513@qq.com");
            System.out.println(mailConfirm.icode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
