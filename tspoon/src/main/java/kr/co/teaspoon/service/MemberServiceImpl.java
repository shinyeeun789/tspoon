package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.MemberDAO;
import kr.co.teaspoon.dto.AdminChartVO;
import kr.co.teaspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member getMember(String id) throws Exception {
        return memberDAO.getMember(id);
    }

    @Override
    public int memberCnt() throws Exception {
        return memberDAO.memberCnt();
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        member.setPw(pwEncoder.encode(member.getPw()));
        memberDAO.memberInsert(member);
    }

    @Override
    public void memberEdit(Member member) throws Exception {
        memberDAO.memberEdit(member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);
    }

    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        boolean comp = false;
        Member member = memberDAO.loginCheck(id);
        if(member != null && pwEncoder.matches(pw, member.getPw())) {
            comp = true;
        }
        return comp;
    }

    @Override
    public void updateVisited(String id) throws Exception {
        memberDAO.updateVisited(id);
    }

    @Override
    public boolean idCheck(String id) throws Exception {
        return memberDAO.getMember(id) == null ? true : false;
    }

    @Override
    public List<AdminChartVO> adminChart() throws Exception {
        return memberDAO.adminChart();
    }
}
