<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 한글처리
request.setCharacterEncoding("utf-8");

// 액션태그 BoardBean bb 객체생성
// 액션태그 이용해서 폼의 파라미터를 -> 자바빈 변수 저장
%>
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
// 디비객체 생성 BoardDAO bdao
BoardDAO bdao = new BoardDAO();

// bdao.insertBoard(bb) 메서드 호출
bdao.insertBoard(bb);

// re_ref = num 같게, re_lev = 0, re_seq = 0

// notice.jsp로 이동
response.sendRedirect("notice.jsp");
%>