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
	// 대상.html()
	var h = $('h1').html();
	// alert(h);
	// div 태그에 html '<h3>html 함수</h3>' 넣기
	$('div').html('<h3>html 함수</h3>');
	
	// div 태그에 html 배열 '<h3>html-0 함수</h3>' 넣기
	//					'<h3>html-1 함수</h3>'
	//					'<h3>html-2 함수</h3>'
	$('div').html(function(index){
		return '<h3>html-'+index+ '함수</h3>';
	});
	
	// function(index,html){} *head-0*
	$('h1').html(function(index,html){
	//	alert(index);
	//	alert(html);
		return "*"+html+"*";
	});
});
</script>
</head>
<body>
<!-- js1/test5.jsp -->
<div>0</div>
<div>1</div>
<div>2</div>
<h1>head-0</h1>
<h1>head-1</h1>
<h1>head-2</h1>
</body>
</html>