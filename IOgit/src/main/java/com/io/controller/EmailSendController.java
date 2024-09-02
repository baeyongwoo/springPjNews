package com.io.controller;

import com.io.service.EmailAuthService;
import com.io.service.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class EmailSendController {

    @Autowired
    private EmailAuthService emailAuthService;

    @Autowired
    private EmailSenderService emailSenderService;

    // 이메일 발송 및 인증 코드 생성
    @PostMapping("/sendAuthCode.do")
    @ResponseBody
    public String sendAuthCode(@RequestParam String email, HttpSession session) {
        String authCode = emailAuthService.generateAuthCode();
        session.setAttribute("authCode", authCode);

        // 이메일 발송
        String subject = "Your Authentication Code";
        String text = "Your authentication code is: " + authCode;
        try {
            emailSenderService.sendEmail(email, subject, text);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    // 인증 코드 검증
    @PostMapping("/verifyAuthCode.do")
    @ResponseBody
    public String verifyAuthCode(@RequestParam String code, HttpSession session) {
        String sessionCode = (String) session.getAttribute("authCode");
        if (sessionCode != null && sessionCode.equals(code)) {
            return "access";
        } else {
            return "un-access";
        }
    }
}
