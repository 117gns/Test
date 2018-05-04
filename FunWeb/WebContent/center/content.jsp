<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
// num pageNum 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

// BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();

//조회수 증가 메서드 호출 updateReadcount(num)
bdao.updateReadcount(num);

// 자바빈 변수 = getBoard(num) 메서드 호출
BoardBean bb = bdao.getBoard(num);

// 엔터 "\r\n" -> <br> 변경
// 글내용이 있으면
// 글내용 String content = replace(엔터,<br>)
String content = "";
if(bb.getContent()!=null){
	content = bb.getContent().replace("\r\n","<br>");
}


%>
<!-- 게시판 -->
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=bb.getNum() %></td>
	<td>조회수</td><td><%=bb.getReadcount() %></td></tr>
<tr><td>작성자</td><td><%=bb.getName() %></td>
	<td>작성일</td><td><%=bb.getDate() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=content %></td></tr>
</table>
<div id="table_search">
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");
// 세션값이 있으면 글수정, 글삭제, 답글 쓰기
// 세션값, 글쓴사람이 일치 하면 글수정, 글삭제 버튼 보이기
if(id!=null) {
	if(bb.getName().equals(id)) {
		%>
		<input type="button" value="글수정" class="btn">
		<input type="button" value="글삭제" class="btn">
		<%
	}
	%>
	<input type="button" value="답글쓰기" class="btn" 
	onclick="location.href='reWrite.jsp?num=<%=bb.getNum() %>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq() %>'">
	<%
}
%>
<!-- <input type="button" value="글수정" class="btn"> -->
<!-- <input type="button" value="글삭제" class="btn"> -->
<!-- <input type="button" value="답글쓰기" class="btn"> -->
<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>