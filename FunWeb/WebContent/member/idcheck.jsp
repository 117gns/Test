<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ok() {
	// join.jsp id상자 값 <- idcheck.jsp userid상자에 찾은값
	opener.document.fr.id.value = document.wfr.userid.value;
	// idcheck.jsp 창닫기
	window.close();
}
</script>
</head>
<body>
<%
// member/idcheck.jsp
String id = request.getParameter("userid");

MemberDAO mdao = new MemberDAO();
// int check = idcheck(id)
int check = mdao.idcheck(id);
// check==1 out.println("아이디 중복")
// check==0 "아이디 중복ㄴㄴ 아이디 사용가능"
if(check==1) {
	out.println("아이디 중복");
} else {
	out.println("아이디 사용가능");
	%>
	<input type="button" value="사용하기" onclick="ok()">
	<%
}
%>
<form action="idcheck.jsp" method="post" name="wfr">
아이디 : <input type="text" name="userid" value="<%=id %>">
<input type="submit" value="중복체크">
</form>
</body>
</html>