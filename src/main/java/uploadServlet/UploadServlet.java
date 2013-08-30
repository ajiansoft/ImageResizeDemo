/*  
 * Copyright (c) 2010-2020 Chongqing Suilong Technology Co. Ltd. All Rights Reserved.  
 *  
 * This software is the confidential and proprietary information of  
 * Founder. You shall not disclose such Confidential Information  
 * and shall use it only in accordance with the terms of the agreements  
 * you entered into with Founder.  
 *  
 */  
package uploadServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sourceforge.fastupload.FastUploadParser;
import net.sourceforge.fastupload.FileFactory;
import net.sourceforge.fastupload.MultiPart;

public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = 8170725266140477440L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FileFactory factory = FileFactory.getInstance();
		factory.setThreshold(1024*1024*10);//每个文件大小,单位字节
		factory.setMaxContentLength(1024*1024*100);//总请求流大小,单位字节
		FastUploadParser uploadParser = new FastUploadParser(request,factory);
		//ProgressListener listener = new ProgressListener(uploadParser);
		List<MultiPart> list = uploadParser.parseList();
		//System.out.println("已上传："+listener.progress()+"byte");
		String uploadSaveUrl = "upload/original/"+System.currentTimeMillis()+".jpg";
		for (MultiPart mp : list) {
			if(mp.isFile()){
				mp.toFile(request.getSession().getServletContext().getRealPath("/")+"/"+uploadSaveUrl);
			}
		}
		request.setAttribute("uploadSaveUrl", uploadSaveUrl);
		request.getRequestDispatcher("/crop1.jsp").forward(request, response);
	}

}
