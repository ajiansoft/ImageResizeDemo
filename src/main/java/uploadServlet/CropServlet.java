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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnails;

public class CropServlet extends HttpServlet {
	private static final long serialVersionUID = -5959742370820904814L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer x1 = Integer.parseInt(request.getParameter("x1"));
		Integer y1 = Integer.parseInt(request.getParameter("y1"));
		//Integer y2 = Integer.parseInt(request.getParameter("y2"));
		Integer width = Integer.parseInt(request.getParameter("width"));
		Integer height = Integer.parseInt(request.getParameter("height"));
		String fileUrl = request.getParameter("fileSaveUrl");
		
		String serverUrl = request.getSession().getServletContext().getRealPath("/")+"/";
		String newFileSaveUrl = "upload/crop/"+System.currentTimeMillis()+".jpg";
		try {
			Thumbnails.of(serverUrl+fileUrl)
				.sourceRegion(x1, y1, width, height)//可指定上下左右位置，也可直接指定坐标
				.scale(1)
				.toFile(serverUrl+newFileSaveUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("cropedFileUrl", newFileSaveUrl);
		request.getRequestDispatcher("/show.jsp").forward(request, response);
	}

}
