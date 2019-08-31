package com.zzh.service;


import com.zzh.common.PictureResult;
import org.springframework.web.multipart.MultipartFile;

public interface PictureService {
	public PictureResult uploadFile(MultipartFile uploadFile) throws Exception;
}
