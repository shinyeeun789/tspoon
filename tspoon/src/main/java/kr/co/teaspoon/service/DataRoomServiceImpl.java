package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.DataRoomDAO;
import kr.co.teaspoon.dto.DataRoom;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DataRoomServiceImpl implements DataRoomService {
    @Autowired
    private DataRoomDAO dataRoomDAO;

    @Override
    public List<DataRoom> dataRoomList(Page page) throws Exception {
        return dataRoomDAO.dataRoomList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return dataRoomDAO.getCount(page);
    }

    @Transactional
    @Override
    public void dataRoomInsert(DataRoom dataRoom) throws Exception {
        dataRoomDAO.dataRoomInsert(dataRoom);
        dataRoomDAO.fileInfoInsert(dataRoom);
    }

    @Override
    public DataRoom dataRoomDetail(int articleNo) throws Exception {
        return dataRoomDAO.dataRoomDetail(articleNo);
    }

    @Override
    public void dataRoomDelete(int articleNo) throws Exception {
        dataRoomDAO.dataRoomDelete(articleNo);
    }
}
