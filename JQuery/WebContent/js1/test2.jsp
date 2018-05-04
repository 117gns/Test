<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 대상,함수()
	
	// 전체
	// $('*').css('color','red');
	// 태그 'h1' 글자색
	$('h1').css('color','blue');
	// #이름 .이름
	$('#ta2').css('color','orange');
	$('.ta3').css('color','purple');
	// 대상 태그[속성=값]	text	.val(넣고자하는 값)
	$('input[type=text]').val("ABCD");
	$('input[type=password]').val("123123123123");
	// 태그:odd 홀수번째 	태그:even 짝수번째
	// 태그:first 첫번째 	태그:last 마지막
	// tr 태그 홀수번째 배경색 background 색
	$('tr:odd').css('background','green');
	// tr 태그 짝수번째 배경색 background 색
	$('tr:even').css('background','pink');
	// tr 태그 첫번째 배경색 background 색
	$('tr:first').css('background','yellow').css('color','red');
});
</script>
</head>
<body>
<table>
<tr><td>이름</td><td>혈액형</td><td>지역</td></tr>
<tr><td>홍길동</td><td>A</td><td>부산</td></tr>
<tr><td>이순신</td><td>B</td><td>서울</td></tr>
<tr><td>유관순</td><td>O</td><td>대전</td></tr>
<tr><td>홍길순</td><td>AB</td><td>울산</td></tr>
</table>
<input type="text">
<input type="password">
<h1>제목1</h1>
<h1 id="ta2">제목2</h1>
<h1 class="ta3">제목3</h1>
내용
</body>
</html>