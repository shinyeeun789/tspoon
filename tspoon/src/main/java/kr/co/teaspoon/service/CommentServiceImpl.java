package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.CommentDAO;
import kr.co.teaspoon.dto.Comment;
import kr.co.teaspoon.util.BoardPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDAO commentDAO;

    @Override
    public List<Comment> commentList(BoardPage page) throws Exception {
        return commentDAO.commentList(page);
    }

    @Override
    public int getCount(int cno) throws Exception {
        return commentDAO.getCount(cno);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        commentDAO.commentInsert(dto);
    }

    @Override
    public void commentDelete(int comNo) throws Exception {
        commentDAO.commentDelete(comNo);
    }
}
