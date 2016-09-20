<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String EMAIL = request.getParameter("email");
String PSWD = request.getParameter("pswd");
String NAME = request.getParameter("name");
String PHNUM = request.getParameter("phnum");

//out.print(PSWD+"/"+NAME+"/"+PHNUM);

Connection conn = null;
PreparedStatement pstmt = null;

try{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "kglim", "1004");
	 out.print(conn.isClosed());
	 String sql = "UPDATE homepage SET PSWD=? NAME=? PHNUM=? WHERE EMAIL=?";
	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1, PSWD);
	 pstmt.setString(2, NAME);
	 pstmt.setString(3, PHNUM);
	 pstmt.setString(4, EMAIL);
	 int row = pstmt.executeUpdate();
	 
	 if(row>0){
		 out.print("<script>");
		 out.print("alert('데이터 수정에 성공하였습니다')");
		 out.print("</script>");
	 }else{
		 out.print("<script>");
		 out.print("alert('데이터 수정 실패')");
		 out.print("</script>");
	 }
}catch(Exception e){
	e.getStackTrace();
	 out.print("<script>");
	 out.print("alert('데이터 수정 실패')");
	 out.print("</script>");
}finally{
	pstmt.close();
}
%>
