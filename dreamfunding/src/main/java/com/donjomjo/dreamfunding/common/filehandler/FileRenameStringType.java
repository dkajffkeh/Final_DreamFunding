package com.donjomjo.dreamfunding.common.filehandler;

import java.text.SimpleDateFormat;
import java.util.Date;



public class FileRenameStringType {
	
	public static String fileRenameString(String filename) {

		return  "dreamfunding_"
				+new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date())
				+(int)(Math.random()*90000+10000)+filename
				.substring(filename.lastIndexOf("."));
	
	}
	

}
