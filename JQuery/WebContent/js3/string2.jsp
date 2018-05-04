<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// name	age 파라미터 가져와서
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
%>
이름은 <%=name%>,나이는 <%=age%>
