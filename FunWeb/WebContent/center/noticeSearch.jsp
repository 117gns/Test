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

<!-- 게시판 -->
<%
// center/noticeSearch.jsp
request.setCharacterEncoding("utf-8");
// search 파라미터 가져오기
String search = request.getParameter("search");

// BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();

// count = getBoardCount() 메서드 호출
int count = bdao.getBoardCount(search);

// 게시판 글 한페이지에 15개씩 잘라서 가져오기
int pageSize = 5;

// 현 페이지 번호 가져오기(pageNum)
String pageNum = request.getParameter("pageNum");

// 페이지 번호가 없으면 "1" 설정
if(pageNum == null) {
	pageNum = "1";
}

// int currentPage = pageNum 정수형 변환
int currentPage = Integer.parseInt(pageNum);	// 현재페이지

// pageSize currentPage 조합
// 1페이지일때 15개씩 -> 시작페이지가 1번, 2 15 -> 16, 3 15 -> 31 ...
int startRow = (currentPage-1)*pageSize+1; // 시작페이지
int endRow = currentPage*pageSize;	 // 끝페이지

List<BoardBean> boardList = null;
// 게시판에 글이 있으면 boardList = getBoardList(시작행번호,몇개) 함수 호출
if(count !=0) {
	boardList = bdao.getBoardList(startRow,pageSize,search);
}

%>
<article>
<h1>Notice [전체 글개수 : <%=count %>]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    for(int i=0; i<boardList.size(); i++) {
    	BoardBean bb = boardList.get(i);
    %>
<tr onclick="location.href='content.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>'"><td><%=bb.getNum() %></td><td class="left"><%=bb.getSubject() %></td>
    <td><%=bb.getName() %></td><td><%=bb.getDate() %></td><td><%=bb.getReadcount() %></td></tr>
    <%
    }
    %>
</table>
<div id="table_search">

<form action="noticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>

</div>
<div class="clear"></div>
<div id="page_control">
<%
// 게시판의 글이 있으면
if(count!=0) {
// 전체 페이지수 구하기 전체 글 개수/한화면에 보여줄 글개수 + 나머지없으면 0,있으면 1
	int pageCount = count/pageSize + ((count%pageSize == 0) ? 0 : 1);
// 한페이지에 보여질 페이지 수
	int pageBlock = 3;
// 시작페이지 번호 구하기	// 현페이지번호 pageBlock 조합 1~10->1, 11~20->11
	int startPage = (((currentPage-1)/pageBlock)*pageBlock)+1;
// 끝페이지 번호 구하기
	int endPage = startPage+pageBlock-1;	// startPage pageBlock 조합 10 20 30
// 끝페이지 구한것이 전체 페이지 개수보다 큰경우 끝페이지 변경
	if(endPage > pageCount) {
			endPage = pageCount;
	}
// Prev
	if(startPage > pageBlock) {
		%>
		<a href="noticeSearch.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
		<%
	}
// 1~10
	for(int i=startPage; i<=endPage; i++) {
		%>
		<a href="noticeSearch.jsp?pageNum=<%=i %>">[<%=i %>페이지]</a>
		<%
	}
// Next
	if(endPage < pageCount) {
		%>
		<a href="noticeSearch.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
		<%
	}
}
%>
<!-- <a href="#">Prev</a> -->
<!-- <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
<!-- <a href="#">4</a><a href="#">5</a><a href="#">6</a> -->
<!-- <a href="#">7</a><a href="#">8</a><a href="#">9</a> -->
<!-- <a href="#">10</a> -->
<!-- <a href="#">Next</a> -->
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