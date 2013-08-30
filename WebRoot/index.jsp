<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
  	<link rel="stylesheet" href="js/jcrop/css/jquery.Jcrop.css" type="text/css" />
    <script type="text/javascript" src="js/jcrop/js/jquery.min.js"></script>
  	<script type="text/javascript" src="js/jcrop/js/jquery.Jcrop.js"></script>
  	<script type="text/javascript">
  		$(function(){
  			 $("#targetImg").Jcrop({
  			  	setSelect: [100,100,200,300],//初始化选择框位置(左上角(x,y),右下角(x,y))
  			 	onChange:showCoords,
  			 	onSelect:showCoords,
  			 	aspectRatio:0 //1：锁定选择框比例，0：不锁定
  			 });
  			 function showCoords(obj){ 
  			 	$("#x1").val(obj.x);
  			 	$("#y1").val(obj.y); 
  			 	$("#x2").val(obj.x2); 
  			 	$("#y2").val(obj.y2); 
  			 	$("#w").val(obj.w); 
  			 	$("#h").val(obj.h);
  			 	//显示预览图
  			 	if(parseInt(obj.w) > 0){
  			 		//计算预览区域图片缩放的比例，通过计算显示区域的宽度(与高度)与剪裁的宽度(与高度)之比得到
  			 		var rx = $("#cropSpan").width() / obj.w; 
  			 		var ry = $("#cropSpan").height() / obj.h;
  			 		//通过比例值控制图片的样式与显示
  			 		$("#cropText").val("width:"+Math.round(rx * $("#targetImg").width())+"px"
  			 					+",height:"+Math.round(rx * $("#targetImg").height())+"px"
  			 					+",marginLeft:-" + Math.round(rx * obj.x)+"px"
  			 					+",marginTop:-" + Math.round(ry * obj.y) + "px"
  			 		);
  			 		$("#cropImg").css({
  			 			width:Math.round(rx * $("#targetImg").width()) + "px",//预览图片宽度为计算比例值与原图片宽度的乘积 
  			 			height:Math.round(rx * $("#targetImg").height()) + "px", //预览图片高度为计算比例值与原图片高度的乘积 
  			 			marginLeft:"-" + Math.round(rx * obj.x) + "px",
  			 			marginTop:"-" + Math.round(ry * obj.y) + "px"
  			 			/*
  			 			,
  			 			marginRight:"-" + (Math.round(rx * obj.x)+Math.round(rx * $("#targetImg").width())) + "px",
  			 			marginBottom:"-" + (Math.round(ry * obj.y)+Math.round(rx * $("#targetImg").height())) + "px"
  			 			*/
  			 		});
  			 	}
  			 }
  		});
  	</script>
  </head>
  
  <body>
  	<div style="float:left;">
	  	<img src="picture/4.jpg" id="targetImg" width="500" height="400" />
	  	<br>
	  	<span>
	  		左上角坐标：<input type="text" id="x1" style="width: 50px;"><input type="text" id="y1" style="width: 50px;"><br>
	  		右下角坐标：<input type="text" id="x2" style="width: 50px;"><input type="text" id="y2" style="width: 50px;"><br>
	  		裁切宽高度：<input type="text" id="w" style="width: 50px;"><input type="text" id="h" style="width: 50px;"><br>
	  	</span>
  	</div>
  	<input type="text" id="cropText" style="float:left;margin-left:10px;width:500px;">
  	<div style="float:left;margin-left:50px;">
		<table id="__01" width="640" height="960" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="3">
					<img src="images/01.png" width="640" height="139" alt=""></td>
			</tr>
			<tr>
				<td rowspan="2">
					<img src="images/02.png" width="28" height="821" alt=""></td>
				<td width="283" height="340">
					<div id="cropSpan" style="overflow:hidden;width: 283px;height: 340px;">
				  		<img id="cropImg" src="picture/4.jpg" />
				  	</div>
				</td>
				<td rowspan="2">
					<img src="images/04.png" width="329" height="821" alt=""></td>
			</tr>
			<tr>
				<td>
					<img src="images/05.png" width="283" height="481" alt=""></td>
			</tr>
		</table>
  	</div>
  </body>
</html>
