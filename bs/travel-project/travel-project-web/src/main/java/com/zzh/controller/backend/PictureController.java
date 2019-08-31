package com.zzh.controller.backend;


import com.zzh.common.PictureResult;
import com.zzh.common.ServerResponse;
import com.zzh.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/pic")
public class PictureController  {
	
	@Autowired
	private PictureService pictureService;

	@RequestMapping("/upload")
	@ResponseBody
	public PictureResult uploda(MultipartFile uploadFile) throws Exception {
		//调用service上传图片
		PictureResult pictureResult = pictureService.uploadFile(uploadFile);
		//返回上传结果

		return pictureResult;
		
	}

	@RequestMapping("/upload1")
	@ResponseBody
	public ServerResponse<String> uploda1(MultipartFile uploadFile) throws Exception {
		//调用service上传图片
		PictureResult pictureResult = pictureService.uploadFile(uploadFile);


		return ServerResponse.createBySuccess(pictureResult.getUrl());


	}
}
