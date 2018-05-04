<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// member/joinPro.jsp
// 한글처리
request.setCharacterEncoding("UTF-8");

// 자바빈 파일만들기, 패키지 member 파일이름 MemberBean
// 액션태그 MemberBean mb 객체 생성
// 액션태그 setProperty 이용해서 폼의 파라미터 -> 자바빈 변수에 저장
// 가입날짜 setReg_date 호출
%>
<jsp:useBean id="mb" class="member.MemberBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
mb.setReg_date(new Timestamp(System.currentTimeMillis()));

// 디비작업 파일 만들기 패키지 member 파일이름 MemberDAO
// 객체생성 MemberDAO mdao
// insertMember(mb) 메서드 호출

MemberDAO mdao = new MemberDAO();
mdao.insertMember(mb);

// "회원가입성공" longin.jsp로 이동
%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href = "login.jsp";
</script>
</body>
</html>





















