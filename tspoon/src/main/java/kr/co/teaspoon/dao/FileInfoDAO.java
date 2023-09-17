package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.DataRoom;
import kr.co.teaspoon.dto.FileInfo;

import java.util.List;

public interface FileInfoDAO {
    public List<FileInfo> fileInfoList(int articleNo) throws Exception;
    public void fileInfoInsert(DataRoom dataRoom) throws Exception;
    public void fileInfoDelete(int articleNo) throws Exception;

}
