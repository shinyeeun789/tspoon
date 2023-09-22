package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Board;
import kr.co.teaspoon.dto.BoardVO;
import kr.co.teaspoon.dto.Category;
import kr.co.teaspoon.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<BoardVO> boardList(Page page) throws Exception {
        return sqlSession.selectList("board.boardList", page);
    }

    @Override
    public BoardVO boardDetail(int seq) throws Exception {
        sqlSession.update("board.countUp", seq);
        return sqlSession.selectOne("board.boardDetail", seq);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        sqlSession.insert("board.boardInsert", dto);
    }

    @Override
    public void boardDelete(int seq) throws Exception {
        sqlSession.delete("board.boardDelete", seq);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        sqlSession.update("board.boardUpdate", dto);
    }

    @Override
    public List<Category> categories() throws Exception {
        return sqlSession.selectList("board.categories");
    }

    @Override
    public int getCount(Page page) throws Exception {
        return sqlSession.selectOne("board.getCount", page);
    }
}
