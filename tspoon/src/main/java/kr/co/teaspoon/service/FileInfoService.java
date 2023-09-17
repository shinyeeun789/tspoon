package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.FileInfo;

import java.util.List;

public interface FileInfoService {
    public List<FileInfo> fileInfoList(int articleNo) throws Exception;
}
