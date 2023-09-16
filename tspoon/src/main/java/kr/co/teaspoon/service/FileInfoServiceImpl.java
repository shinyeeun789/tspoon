package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.FileInfoDAO;
import kr.co.teaspoon.dto.FileInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileInfoServiceImpl implements FileInfoService {

    @Autowired
    private FileInfoDAO fileInfoDAO;

    @Override
    public List<FileInfo> fileInfoList(int articleNo) throws Exception {
        return fileInfoDAO.fileInfoList(articleNo);
    }
}
