package com.io.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.io.model.MypageDTO;
import com.io.service.MyPageService;

@Controller
public class MypageController {

    @Autowired
    private MyPageService mypageService;

    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        String uemail = (String) session.getAttribute("userEmail");
        if (uemail == null) {
            return "redirect:/login";
        }

        List<MypageDTO> myPosts = mypageService.getMypagePosts(uemail);
        model.addAttribute("myPosts", myPosts);

        return "mypage";
    }
}
