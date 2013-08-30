<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
    <form action="servlet/UploadServlet" method="post" enctype="multipart/form-data">
    	<input type="file" name="uploadFile"><br>
    	<input type="submit" value="上传">
    </form>
  </body>
</html>
