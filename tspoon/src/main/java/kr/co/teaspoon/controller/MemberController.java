package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.MemberService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

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

    // 회원약관 화면 로딩
    @GetMapping("term.do")
    public String term(Model model) throws Exception {
        return "/member/term";
    }

    // 회원가입 폼 로딩
    @GetMapping("join.do")
    public String join(Model model) throws Exception {
        return "/member/join";
    }

    // 회원가입 
    @RequestMapping(value="join.do", method= RequestMethod.POST)
    public String joinPro(ServletRequest request, ServletResponse response, Model model) throws Exception {
        Member member = new Member();
        member.setId(request.getParameter("id"));
        member.setPw(request.getParameter("pw"));
        member.setName(request.getParameter("name"));
        member.setEmail(request.getParameter("email"));
        member.setTel(request.getParameter("tel"));
        member.setAddr1(request.getParameter("addr1"));
        member.setAddr2(request.getParameter("addr2"));
        member.setPostcode(request.getParameter("postcode"));
        member.setBirth(request.getParameter("birth"));
        memberService.memberInsert(member);

        return "/member/login";
    }

    // 아이디 중복 체크
    @RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
    public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String id = request.getParameter("id");
        boolean result = memberService.idCheck(id);

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    /* 관리자가 볼 수 있는 회원 목록 */
    @RequestMapping(value="list.do", method=RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/member/memberList";
    }

    @GetMapping("delete.do")
    public String memberDelete(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        memberService.memberDelete(id);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/memberEdit";
    }

    @PostMapping("edit.do")
    public String memberEdit(Member mem, @RequestParam String pw2, Model model) throws Exception {
        if(mem.getPw() == null) {
            mem.setPw(pw2);
        } else {
            mem.setPw(pwEncoder.encode(mem.getPw()));
        }
        memberService.memberEdit(mem);
        return "redirect:mypage.do";
    }

    @RequestMapping(value="mypage.do", method=RequestMethod.GET)
    public String myPage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }

}
