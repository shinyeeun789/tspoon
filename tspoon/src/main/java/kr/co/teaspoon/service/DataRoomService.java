package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.DataRoom;
import kr.co.teaspoon.util.Page;

import java.util.List;

public interface DataRoomService {
    public List<DataRoom> dataRoomList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public void dataRoomInsert(DataRoom dataRoom) throws Exception;
    public DataRoom dataRoomDetail(int articleNo) throws Exception;
    public void dataRoomDelete(int articleNo) throws Exception;
}
