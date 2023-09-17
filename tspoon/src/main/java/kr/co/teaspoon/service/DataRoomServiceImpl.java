package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.DataRoomDAO;
import kr.co.teaspoon.dao.FileInfoDAO;
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

    @Autowired
    private FileInfoDAO fileInfoDAO;

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
        fileInfoDAO.fileInfoInsert(dataRoom);
    }

    @Override
    public DataRoom dataRoomDetail(int articleNo) throws Exception {
        return dataRoomDAO.dataRoomDetail(articleNo);
    }

    @Transactional
    @Override
    public void dataRoomEdit(DataRoom dataRoom) throws Exception {
        dataRoomDAO.dataRoomEdit(dataRoom);
        if(dataRoom.getFileInfoList().get(0).getSaveFolder() != null) {
            fileInfoDAO.fileInfoDelete(dataRoom.getArticleNo());
            fileInfoDAO.fileInfoInsert(dataRoom);
        }
    }

    @Override
    public void dataRoomDelete(int articleNo) throws Exception {
        dataRoomDAO.dataRoomDelete(articleNo);
    }
}
