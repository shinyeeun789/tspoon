package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.DataRoom;
import kr.co.teaspoon.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DataRoomDAOImpl implements DataRoomDAO {

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<DataRoom> dataRoomList(Page page) throws Exception {
        return sqlSession.selectList("dataRoom.dataRoomList", page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return sqlSession.selectOne("dataRoom.getCount");
    }

    @Override
    public void dataRoomInsert(DataRoom dataRoom) throws Exception {
        sqlSession.insert("dataRoom.dataRoomInsert", dataRoom);
    }

    @Override
    public DataRoom dataRoomDetail(int articleNo) throws Exception {
        return sqlSession.selectOne("dataRoom.dataRoomDetail", articleNo);
    }

    @Override
    public void dataRoomEdit(DataRoom dataRoom) throws Exception {
        sqlSession.update("dataRoom.dataRoomUpdate", dataRoom);
    }

    @Override
    public void dataRoomDelete(int articleNo) throws Exception {
        sqlSession.delete("dataRoom.dataRoomDelete", articleNo);
    }
}
