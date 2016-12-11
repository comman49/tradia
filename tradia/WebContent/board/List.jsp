<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
  <%
  int total = 0;
  
  try {
	  Class.forName("com.mysql.jdbc.Driver");
      Connection conn = null;
      conn = DriverManager.getConnection("jdbc:mysql://182.224.57.93:3306", "tradia", "tradia");
      Statement st = null;
      ResultSet rs = null;
      st = conn.createStatement();
      rs = st.executeQuery("select count(*) from tradia.BOARD");

      if(rs.next())
      {
			total = rs.getInt(1);
	  }
	  rs.close();
	  out.print("총 게시물 : " + total + "개");

	  String sqlList = "SELECT BOARD_NO, REGDATE, USER_ID, CONTENTS from tradia.BOARD order by BOARD_NO DESC";
		rs = st.executeQuery(sqlList);
		
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr text-align:center;">
   <td width="5"></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String regdate = rs.getString(2);
			String user_id = rs.getString(3);
			String contents = rs.getString(4);
		
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><%=regdate %></td>
	<td align="center"><%=user_id %></td>
	<td align="center"><%=contents %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	st.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='Write.jsp'"></td>
  </tr>
</table>
</body> 
</html>