package com.donjomjo.dreamfunding.common.filehandler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileRename {
	
	public static String fileRename(MultipartFile filename) {

		return  "dreamfunding_"
				+new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date())
				+(int)(Math.random()*90000+10000)+filename.getOriginalFilename()
				.substring(filename.getOriginalFilename().lastIndexOf("."));
	
	}
	

}
