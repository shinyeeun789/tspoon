package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    // 로그인 폼 로딩
    @GetMapping("login.do")
    public String login(Model model) throws Exception {
        return "/member/login";
    }

    // 로그인 처리
    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    public String memberLogin(@RequestParam String id, @RequestParam String pw, RedirectAttributes rttr) throws Exception {
        boolean ps = memberService.loginCheck(id, pw);
        if(ps){
            session.setAttribute("sid", id);
            rttr.addFlashAttribute("msg", 1);
            return "redirect:/";
        } else {
            rttr.addFlashAttribute("msg", 0);
            return "redirect:login.do";
        }
    }

    //로그아웃
    @GetMapping("logout.do")
    public String memberLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    /* 관리자가 볼 수 있는 회원 목록 */
    @RequestMapping(value="list.do", method=RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/member/memberList";
    }

    /* 관리자가 회원의 상세 정보 보기 */
    @GetMapping("detail.do")
    public String detail(@RequestParam String id, Model model) throws Exception {
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/memberDetail";
    }

    @GetMapping("delete.do")
    public String memberDelete(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        memberService.memberDelete(id);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String memberEdit(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/memberEdit";
    }

    @RequestMapping(value="mypage.do", method=RequestMethod.GET)
    public String myPage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }

}
