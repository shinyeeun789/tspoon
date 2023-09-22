package kr.co.teaspoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String index(HttpServletRequest request, Model model) {

        return "/index";
    }

}
