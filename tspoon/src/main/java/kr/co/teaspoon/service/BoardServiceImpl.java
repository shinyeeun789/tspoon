package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.BoardDAO;
import kr.co.teaspoon.dao.BoardDAOImpl;
import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardVO;
import kr.co.teaspoon.dto.Category;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public List<BoardVO> boardList(Page page) throws Exception {
        return boardDAO.boardList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return boardDAO.getCount(page);
    }

    @Override
    public BoardVO boardDetail(int seq) throws Exception {
        return boardDAO.boardDetail(seq);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardDAO.boardInsert(dto);
    }

    @Override
    public void boardDelete(int seq) throws Exception {
        boardDAO.boardDelete(seq);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardDAO.boardEdit(dto);
    }

    @Override
    public List<Category> categories() throws Exception {
        return boardDAO.categories();
    }
}
