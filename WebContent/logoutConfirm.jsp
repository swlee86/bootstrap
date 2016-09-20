<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page session="true" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>로그아웃</title>
</head>
<body>
<%
String id = request.getParameter("user_id");   
session.invalidate();

Cookie idcookie = new Cookie("idcookie", id);
Cookie upcookie = new Cookie("upcookie", id);
idcookie.setMaxAge(0);
upcookie.setMaxAge(0);
response.addCookie(idcookie);
response.addCookie(upcookie);
response.sendRedirect("index.jsp");
%>
</body>
</html>
