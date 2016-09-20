<%@page import="kr.or.kosta.utils.SingletonHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String ID = request.getParameter("email");
	String PSWD = request.getParameter("pswd");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = SingletonHelper.getConnection("oracle");
		String sql="SELECT * FROM homepage WHERE email=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ID);
		rs = pstmt.executeQuery();

		if(rs.next()){
			if(rs.getString(2).equals(PSWD)){
				%>
				<script>
				alert("패스워드 정합성 확인");
				</script>
				<%
			   	Cookie upcookie = new Cookie("upcookie", ID);
			   	upcookie.setMaxAge(24*60*60);
			   	response.addCookie(upcookie);
			   	response.sendRedirect("index.html");
			}else{
				%>
				<script>
				alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요");
				window.history.go(-1);
				</script>
				<%
				
				
			}

		}
		
	}catch(Exception e){
		
	}finally{
		
	}
		
 %>