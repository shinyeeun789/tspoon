package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Comment;
import kr.co.teaspoon.util.BoardPage;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDAOImpl implements CommentDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Comment> commentList(BoardPage page) throws Exception {
        return sqlSession.selectList("comment.commentList", page);
    }

    @Override
    public int getCount(int cno) throws Exception {
        return sqlSession.selectOne("comment.getCount", cno);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        sqlSession.insert("comment.commentInsert", dto);
    }

    @Override
    public void commentDelete(int comNo) throws Exception {
        sqlSession.delete("comment.commentDelete", comNo);
    }
}
