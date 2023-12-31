package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardVO;
import kr.co.teaspoon.dto.Category;
import kr.co.teaspoon.dto.Comment;
import kr.co.teaspoon.service.BoardService;
import kr.co.teaspoon.service.CommentService;
import kr.co.teaspoon.util.BoardPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;

    @GetMapping("list.do")		//board/list.do
    public String getBoardList(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String category = request.getParameter("cate");

        BoardPage page = new BoardPage();
        page.setCategory(category);                                   // 카테고리 데이터 SET
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET

        // 페이징에 필요한 데이터 저장
        int total = boardService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<BoardVO> boardList = boardService.boardList(page);
        List<Category> categories = boardService.categories();

        model.addAttribute("boardList", boardList);          // 게시글 목록
        model.addAttribute("categories", categories);       // 카테고리 목록
        model.addAttribute("curPage", curPage);             // 현재 페이지
        model.addAttribute("curCategory", category);        // 현재 카테고리
        model.addAttribute("page", page);                   // 페이징 데이터

        return "/board/boardList";
    }

    @GetMapping("detail.do")	//board/detail.do?seq=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        BoardVO comm = boardService.boardDetail(Integer.parseInt(request.getParameter("seq")));

        // 게시판 목록에서 사용자가 선택한 게시물이 속해있는 페이지
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        // 댓글 목록의 페이지
        int commentPage = request.getParameter("commentPage") != null ? Integer.parseInt(request.getParameter("commentPage")) : 1;

        // 댓글 페이징 처리
        BoardPage page = new BoardPage();
        // 페이징에 필요한 데이터 저장
        int total = commentService.getCount(comm.getSeq());
        page.setSeq(comm.getSeq());
        page.makeBlock(commentPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(commentPage, total);

        List<Comment> commentList = commentService.commentList(page);

        model.addAttribute("detail", comm);
        model.addAttribute("commentList", commentList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("commentPage", commentPage);
        model.addAttribute("page", page);
        model.addAttribute("cate", request.getParameter("cate"));
        model.addAttribute("type", request.getParameter("type"));
        model.addAttribute("keyword", request.getParameter("keyword"));

        return "/board/boardDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        List<Category> categories = boardService.categories();
        model.addAttribute("categories", categories);
        return "/board/boardInsert";
    }

    @PostMapping("insert.do")
    public String boardInsert(Board board, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        board.setNickname((String) session.getAttribute("sid"));
        boardService.boardInsert(board);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String boardDelete(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        boardService.boardDelete(seq);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        BoardVO detail = boardService.boardDetail(seq);
        model.addAttribute("detail", detail);

        List<Category> categories = boardService.categories();
        model.addAttribute("categories", categories);

        return "/board/boardEdit";
    }

    @PostMapping("edit.do")
    public String boardEdit(Board board, HttpServletRequest request, Model model) throws Exception {
        boardService.boardEdit(board);
        return "redirect:list.do";
    }

    //ckeditor를 이용한 이미지 업로드
    @PostMapping("imageUpload.do")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "D:\\github\\project03\\tspoon\\src\\main\\webapp\\resources\\upload\\board/";	// 이미지 경로 설정(폴더 자동 생성)
            //String path = request.getRealPath("/resource/upload/board");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            printWriter = response.getWriter();
            String contextPath = request.getContextPath();
            String fileUrl = contextPath + "/board/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value="ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid, @RequestParam(value="fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //서버에 저장된 이미지 경로
        String path = "D:\\github\\project03\\tspoon\\src\\main\\webapp\\resources\\upload\\board/";	// 이미지 경로 설정
        //String path = request.getRealPath("/resource/uploadckImage/");
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}