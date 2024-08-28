package utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;



@Service
public class EmailService {
	private static final String mail = "dyddn30612@naver.com";
	

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(String to, String subject, String text) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        
        CreateAuthCode code = new CreateAuthCode();
        //setTo는 dto로 객체 받아서 처리하기
        helper.setTo("protect30612@naver.com");
        helper.setSubject("IO이메일인증" );
        helper.setText("이메일 인증<br><br>" 
        + code.createAuthCodeGet(8) 
        + "<br><br>올바르게 입력해주세요", true);
        helper.setFrom(mail);

        mailSender.send(message);
    }
}
