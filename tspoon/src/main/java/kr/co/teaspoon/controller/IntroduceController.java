package kr.co.teaspoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/introduce/*")
public class IntroduceController {

    @RequestMapping("company.do")
    public String company(Model model) throws Exception {
        return "/introduce/company";
    }

    @RequestMapping("directions.do")
    public String directions(Model model) throws Exception {
        return "/introduce/directions";
    }

}
