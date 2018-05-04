<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 대상.attr()
	// 이미지 태그 속성 width 값 가져오기 -> 경고메시지 출력
	var wid = $('img').attr('width');
	alert(wid);
	// 이미지태그 속성 src 값 변경 4.gif
	// $('img').attr('src','3.gif');
	// 이미지 태그 속성 width height 변경
	$('img').attr('width','300').attr('height','300');
	
	// 이미지태그 속성 width 100, 200, 300
	$('img').attr('width',function(index){
		return (index+1)*100;
	});
});
</script>
</head>
<body>
<!-- js1/test4.jsp -->
<img src="1.gif" width="200" height="100">
<img src="2.gif" width="200" height="100">
<img src="3.gif" width="200" height="100">
</body>
</html>