package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.AdminChartVO;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.dto.MemberPtVO;

import java.util.List;

public interface MemberDAO {
    public List<Member> memberList() throws Exception;
    public Member getMember(String id) throws Exception;
    public int memberCnt() throws Exception;
    public void memberInsert(Member member) throws Exception;
    public void memberEdit(Member member) throws Exception;
    public void memberDelete(String id) throws Exception;
    public Member loginCheck(String id) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void updatePt(MemberPtVO data) throws Exception;
    public List<AdminChartVO> adminChart() throws Exception;

}