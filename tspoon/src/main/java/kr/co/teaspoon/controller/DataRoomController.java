package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.DataRoom;
import kr.co.teaspoon.dto.FileInfo;
import kr.co.teaspoon.service.DataRoomService;
import kr.co.teaspoon.service.FileInfoService;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/dataRoom/*")
public class  DataRoomController {

    @Autowired
    private DataRoomService dataRoomService;

    @Autowired
    private FileInfoService fileInfoService;

    @Autowired
    private HttpSession session;

    @GetMapping("list.do")
    public String getBoardList(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setKeyword(request.getParameter("keyword"));
        page.setType(request.getParameter("type"));

        // 페이징에 필요한 데이터 만들기
        int total = dataRoomService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<DataRoom> dataRoomList = dataRoomService.dataRoomList(page);
        model.addAttribute("dataRoomList", dataRoomList);           // 자료 목록
        model.addAttribute("curPage", curPage);                     // 현재 페이지
        model.addAttribute("page", page);                           // 페이징 데이터
        return "/dataRoom/dataRoomList";
    }

    @RequestMapping(value = "insert.do", method = RequestMethod.GET)
    public String insertForm() throws Exception {
        return "/dataRoom/dataRoomInsert";
    }

    @RequestMapping(value = "insert.do", method = RequestMethod.POST)
    public String write(DataRoom dataRoom, @RequestParam("upfile") MultipartFile[] files, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {
        String sid = (String) session.getAttribute("sid");
        if(sid != null && sid.equals("admin")) {
            String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/dataRoom/");           // 업로드 경로 설정
            String today = new SimpleDateFormat("yyMMdd").format(new Date());
            String saveFolder = realPath + today;
            File folder = new File(saveFolder);
            if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
                folder.mkdirs();
            }
            List<FileInfo> fileInfoList = new ArrayList<>();        // 첨부파일 정보를 리스트로 생성
            for(MultipartFile file : files) {
                FileInfo fileInfo = new FileInfo();
                String originalFileName = file.getOriginalFilename(); // 첨부파일의 실제 파일명
                if(!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
                    fileInfo.setSaveFolder(today);
                    fileInfo.setOriginFile(originalFileName);
                    fileInfo.setSaveFile(saveFileName);
                    file.transferTo(new File(folder, saveFileName));    // 파일을 업로드 폴더에 저장
                }
                fileInfoList.add(fileInfo);
            }
            dataRoom.setFileInfoList(fileInfoList);
            dataRoom.setId(sid);

            try {
                dataRoomService.dataRoomInsert(dataRoom);
                rttr.addFlashAttribute("msg", "자료실에 글을 등록하였습니다");
            } catch(Exception e) {
                e.printStackTrace();
                rttr.addFlashAttribute("msg", "글 작성 중 문제가 발생했습니다");
            }
        } else {
            rttr.addFlashAttribute("msg", "관리자만 접근 가능한 페이지입니다");
        }
        return "redirect:/dataRoom/list.do";
    }

    @GetMapping("detail.do")
    public String detail(HttpServletRequest request, Model model) throws Exception {
        int articleNo = request.getParameter("no") != null ? Integer.parseInt(request.getParameter("no")) : 0;
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
        DataRoom dataRoom = dataRoomService.dataRoomDetail(articleNo);
        List<FileInfo> fileList = fileInfoService.fileInfoList(articleNo);

        model.addAttribute("dataRoom", dataRoom);
        model.addAttribute("fileList", fileList);
        model.addAttribute("curPage", curPage);

        return "/dataRoom/dataRoomDetail";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int articleNo = request.getParameter("no") != null ? Integer.parseInt(request.getParameter("no")) : 0;
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");

        DataRoom dataRoom = dataRoomService.dataRoomDetail(articleNo);
        dataRoom.setFileInfoList(fileInfoService.fileInfoList(articleNo));

        model.addAttribute("dataRoom", dataRoom);
        model.addAttribute("curPage", curPage);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);

        return "/dataRoom/dataRoomEdit";
    }

    @PostMapping("edit.do")
    public String dataRoomEdit(DataRoom dataRoom, @RequestParam("upfile") MultipartFile[] files, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        String sid = (String) session.getAttribute("sid");
        if (sid != null && sid.equals("admin")) {
            String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/dataRoom/"); // 경로설정
            String today = new SimpleDateFormat("yyMMdd").format(new Date());                               //오늘 날짜
            String saveFolder = realPath + today;           // 저장되는 폴더 경로
            File folder = new File(saveFolder);
            if(!folder.exists()) {                          // 폴더가 존재하지 않으면 생성함
                folder.mkdirs();
            }

            // 기존 파일 삭제
            List<FileInfo> fileList = fileInfoService.fileInfoList(dataRoom.getArticleNo());
            ServletContext application = request.getSession().getServletContext();
            for(FileInfo fileInfo : fileList) {
                File oldFile = new File(application.getRealPath("/")+"/resources/upload/dataRoom/"+fileInfo.getSaveFolder()+"/"+fileInfo.getSaveFile());
                if(oldFile.exists()) {
                    oldFile.delete();
                }
            }

            List<FileInfo> fileInfos = new ArrayList<>();   //첨부파일 정보를 리스트로 생성
            for (MultipartFile file : files) {
                FileInfo fileInfo = new FileInfo();
                String originalFileName = file.getOriginalFilename(); //첨부파일의 실제 파일명을 저장
                if (!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf('.')); // 랜덤으로 파일이름 설정
                    fileInfo.setArticleNo(dataRoom.getArticleNo());
                    fileInfo.setSaveFolder(today);
                    fileInfo.setOriginFile(originalFileName);
                    fileInfo.setSaveFile(saveFileName);
                    file.transferTo(new File(folder, saveFileName));  // 파일을 업로드 폴더에 저장
                }
                fileInfos.add(fileInfo);
            }

            dataRoom.setFileInfoList(fileInfos);
            dataRoom.setId(sid);

            try {
                dataRoomService.dataRoomEdit(dataRoom);
            } catch (Exception e) {
                e.printStackTrace();
                rttr.addFlashAttribute("msg", "글 작성중 문제가 발생했습니다");
            }

        } else {
            rttr.addFlashAttribute("msg", "관리자만 접근 가능한 페이지입니다");
        }

        rttr.addAttribute("no", dataRoom.getArticleNo());
        rttr.addAttribute("page", request.getParameter("page"));
        if(request.getParameter("type") != null) {          // 검색 데이터가 있는 경우에만 view에 type과 keyword 데이터 전달
            rttr.addAttribute("type", request.getParameter("type"));
            rttr.addAttribute("keyword", request.getParameter("keyword"));
        }
        return "redirect:/dataRoom/detail.do";
    }

    @GetMapping("delete.do")
    public String dataRoomDelete(@RequestParam int no, RedirectAttributes rttr) throws Exception {
        dataRoomService.dataRoomDelete(no);
        return "redirect:/dataRoom/list.do";
    }

}
