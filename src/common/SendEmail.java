package common;

import java.util.Calendar;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


// That 事件： 从指定qq邮箱发送邮件给其他邮箱
public class SendEmail
{
    // 参数表示：发送邮箱、目的邮箱、发送邮箱密码、发送邮件正文
    public SendEmail(String _from, String _to, String _password,String _emailContent) {

        String to = _to;
        String from = _from;

        String host = "smtp.qq.com"; 					 //QQ邮件服务器

        Properties properties = System.getProperties();

        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");


        Session session = Session.getInstance(properties, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(from, _password);
            }
        });

        try{
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(from));

            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            message.setSubject("Mail send by java!");				// 邮件标题

            message.setText(_emailContent);

            Transport.send(message);

        }catch (MessagingException mex) {
           mex.printStackTrace();
        }
    }

    // 测试
    public  static void main(String[] args) throws Exception {

    }

}