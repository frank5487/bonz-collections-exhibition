package en.upenn.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.InputStream;
import java.util.Properties;

public class MailUtils {

    private static final String USER = "";
    private static final String PASSWORD = "";

    public static boolean sendMail(String to, String text, String title) {

        try {
            final Properties pro = new Properties();
            InputStream is = MailUtils.class.getClassLoader().getResourceAsStream("mail.properties");
            pro.load(is);
//            pro.put("mail.smtp.auth", "true");
//            pro.put("mail.smtp.starttls.enable", "true");
//            pro.put("mail.smtp.host", "smtp.gmail.com");
//            pro.put("mail.smtp.port", "587");
//
//            // sender's account
//            pro.put("mail.user", USER);
//            // sender's password
//            pro.put("mail.password", PASSWORD);

            Authenticator authenticator = new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    String username = pro.getProperty("mail.user");
                    String password = pro.getProperty("mail.password");
                    return new PasswordAuthentication(username, password);
                }
            };

            // build the session of email along with the properties environment and authenticator
            Session mailSession = Session.getInstance(pro, authenticator);
            // build up the message
            MimeMessage mimeMessage = new MimeMessage(mailSession);
            // set sender
            String username = pro.getProperty("mail.user");
            InternetAddress from = new InternetAddress(username);
            mimeMessage.setFrom(from);


            // set receiver
            InternetAddress toAdrress = new InternetAddress(to);
            mimeMessage.setRecipient(Message.RecipientType.TO, toAdrress);;

            // set email title
            mimeMessage.setSubject(title);

            // set email content
            mimeMessage.setContent(text, "text/html;charset=utf-8");

            // send email
            Transport.send(mimeMessage);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * test
     *
     */
    public static void main(String[] args) {
        MailUtils.sendMail("test@holo.en", "test, do not reply", "Java Mail");
        System.out.println("send successfully!");

    }
}
