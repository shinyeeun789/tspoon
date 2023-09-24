package kr.co.teaspoon.controller;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/news/*")
public class NewsController {

    public static HashMap<String, String> map;

    @RequestMapping(value="list.do")
    public String newsList(Model model) throws Exception {
        int page = 1;
        ArrayList<String> al1 = new ArrayList<>();
        ArrayList<String> al2 = new ArrayList<>();
        ArrayList<String> al3 = new ArrayList<>();
        ArrayList<String> al4 = new ArrayList<>();

        while (page < 20) {
            // 크롤링하고 싶은 페이지
            String address = "https://www.hangyo.com/news/section_list_all.html?sec_no=1468&page=" + Integer.toString(page);
            Document rawData = Jsoup.connect(address).timeout(5000).get();

            Elements newsItems = rawData.select("li");          // li 태그 안에 있는 요소 크롤링
            String realURL = "";
            String realTitle = "";
            String realContent = "";
            String realRegdate = "";
            for (Element option : newsItems) {
                realURL = "https://www.hangyo.com" + option.select("a").attr("href");       // a 태그
                realTitle = option.select("h2").text();                                               // h2 태그
                realContent = option.select("p").text();                                              // p 태그
                realRegdate = option.select("em").text();                                             // em 태그 안의 요소 크롤링
                al1.add(realURL);
                al2.add(realTitle);
                al3.add(realContent);
                al4.add(realRegdate);
            }
            page += 10;
        }
        model.addAttribute("urls", al1);
        model.addAttribute("titles", al2);
        model.addAttribute("contents", al3);
        model.addAttribute("regdates", al4);

        return "/news/newsList";
    }

}
