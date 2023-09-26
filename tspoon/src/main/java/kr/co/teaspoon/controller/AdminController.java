package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.*;
import kr.co.teaspoon.service.*;
import kr.co.teaspoon.util.FilterPage;
import kr.co.teaspoon.util.Page;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private QnaService qnaService;

    @Autowired
    private EventService eventService;

    @Autowired
    private FilterWordService filterWordService;

    @RequestMapping("dashboard.do")
    public String dashboard(Model model) throws Exception {
        // 회원 수
        int memberCnt = memberService.memberCnt();
        model.addAttribute("memberCnt", memberCnt);

        // 게시글 수
        int boardCnt = boardService.boardCnt();
        model.addAttribute("boardCnt", boardCnt);

        // 이벤트 참여자 수
//        int applyCnt = applyService.applyCnt();
        int applyCnt = 0;
        model.addAttribute("applyCnt", applyCnt);

        // 미답변 질문 수
        int noAnswerCnt = qnaService.noAnswerCount();
        model.addAttribute("noAnswerCnt", noAnswerCnt);

        // 진행 중인 이벤트 목록
        List<Event> ongoingEvents = eventService.ongoingEvents();
        model.addAttribute("ongoingEvents", ongoingEvents);

        return "/admin/dashboard";
    }

    @PostMapping("getAdminChart.do")
    public void getAdminChart(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<AdminChartVO> adminChart = memberService.adminChart();
        JSONArray jsonArray = new JSONArray();

        for(AdminChartVO vo : adminChart) {
            JSONObject obj = new JSONObject();
            obj.put("label", vo.getLabel());
            obj.put("memberCnt", vo.getMemberCnt());
            obj.put("attendCnt", vo.getAttendCnt());
            jsonArray.put(obj);
        }

        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }

    /* 관리자가 볼 수 있는 회원 목록 */
    @GetMapping("memberList.do")
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        return "/admin/memberList";
    }

    @GetMapping("memberMgmt.do")
    public String memberMgmt(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        return "/admin/memberMgmt";
    }

    @GetMapping("memberDelete.do")
    public String memberDelete(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        String id = request.getParameter("id");
        memberService.memberDelete(id);
        rttr.addFlashAttribute("msg", id);
        return "redirect:/admin/memberMgmt.do";
    }

    @GetMapping("qnaMgmt.do")
    public String qnaMgmt(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        Page page = new Page();
        int total = qnaService.noAnswerCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터

        //QnaList
        List<Qna> noAnswerList = qnaService.noAnswerList(page);
        model.addAttribute("noAnswerList", noAnswerList);     //QnA 목록
        return "/admin/qnaMgmt";
    }

    // 필터링 단어 추가 페이지 로딩
    @RequestMapping(value="filtering.do", method= RequestMethod.GET)
    public String filterInsertGet(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        // 필터링 단어 목록 페이징 처리
        Page page = new Page();
        int total = filterWordService.getCount();
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<FilterWord> filterList = filterWordService.filterList(page);
        model.addAttribute("filterList", filterList);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        return "/admin/filterInsert";
    }

    // 필터링 단어 추가
    @RequestMapping(value="filterInsert.do", method= RequestMethod.POST)
    public String filterInsertGet(@RequestParam String word, Model model) throws Exception {
        filterWordService.filterInsert(word);
        return "redirect:/admin/filtering.do";
    }

    // 필터링 단어 삭제
    @GetMapping("filterDelete.do")
    public String filterDelete(@RequestParam int fno, Model model) throws Exception {
        filterWordService.filterDelete(fno);
        return "redirect:/admin/filtering.do";
    }

    // 커뮤니티 관리 페이지 로딩
    @RequestMapping("boardMgmt.do")
    public String boardMgmt(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ?Integer.parseInt(request.getParameter("page")) : 1;

        FilterPage page = new FilterPage();
        int total = filterWordService.getCountBadList();
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<BoardVO> boardList = filterWordService.badList(page);
        model.addAttribute("list", boardList);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        return "/admin/boardMgmt";
    }

    // 커뮤니티 삭제
    @RequestMapping("boardDelete.do")
    public String communityDelete(@RequestParam int seq, HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ?Integer.parseInt(request.getParameter("page")) : 1;
        boardService.boardDelete(seq);
        model.addAttribute("curPage", curPage);
        return "redirect:/admin/boardMgmt.do";
    }

    @RequestMapping("eventMgmt.do")
    public String getEventList(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        int total = eventService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Event> eventList = eventService.eventList(page);

        model.addAttribute("eventList", eventList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("page", page);

        return "/admin/eventMgmt";
    }

    @RequestMapping("selectWinner.do")
    public String selectWinner(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        int total = eventService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Event> ongoingEvents = eventService.ongoingEvents(page);
        model.addAttribute(ongoingEvents);

        return "/admin/selectWinner";
    }

}
