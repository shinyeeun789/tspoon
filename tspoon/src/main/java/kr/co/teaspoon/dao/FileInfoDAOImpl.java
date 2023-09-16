package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.FileInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileInfoDAOImpl implements FileInfoDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<FileInfo> fileInfoList(int articleNo) throws Exception {
        return sqlSession.selectList("fileInfo.fileInfoList", articleNo);
    }
}
