package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardVO;
import kr.co.teaspoon.dto.Category;
import kr.co.teaspoon.util.Page;

import java.util.List;

public interface BoardDAO {
    public List<BoardVO> boardList(Page page) throws Exception;
    public BoardVO boardDetail(int seq) throws Exception;
    public void boardInsert(Board dto) throws Exception;
    public void boardDelete(int seq) throws Exception;
    public void boardEdit(Board dto) throws Exception;
    public List<Category> categories() throws Exception;
    public int getCount(Page page) throws Exception;
}
