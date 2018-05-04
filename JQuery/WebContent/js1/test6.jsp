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
	// 대상.append()	대상태그 뒷부분에 추가
	// body 태그 append() 뒷부분에 추가 "<h2>뒤부분추가</h2>"
	$('body').append("<h2>뒤부분추가</h2>");
	
	// 테이블 태그 뒤부분에 kim 김길동 추가
	$('table').append("<tr><td>kim</td><td>김길동</td></tr>");
	
	// div 태그 뒤부분에 추가 $('img').first() 첫번째 이미지
	
	setInterval(function(){
		// 1초마다
		$('div').append($('img').first());
	}, 1000);
});
</script>
</head>
<body>
<!-- js1/test6.jsp -->
<h1>본문</h1>
<table border="1">
<tr><td>아이디</td><td>이름</td></tr>
</table>
<div>
<img src="1.gif">
<img src="2.gif">
<img src="3.gif">
<img src="4.gif">
<img src="5.gif">
</div>
</body>
</html>