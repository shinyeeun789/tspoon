package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.FileInfo;

import java.util.List;

public interface FileInfoDAO {

    public List<FileInfo> fileInfoList(int articleNo) throws Exception;

}
