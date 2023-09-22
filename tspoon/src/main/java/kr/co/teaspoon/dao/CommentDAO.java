package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Comment;
import kr.co.teaspoon.util.BoardPage;

import java.util.List;

public interface CommentDAO {
    public List<Comment> commentList(BoardPage page) throws Exception;
    public int getCount(int cno) throws Exception;
    public void commentInsert(Comment dto) throws Exception;
    public void commentDelete(int comNo) throws Exception;

}
