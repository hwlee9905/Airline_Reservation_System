<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*, java.util.Date" %>
<%String id5 = (String)session.getAttribute("user_id") ;%>
<HTML>
<head>
	<link href="styleRL.css" rel="stylesheet">
</head>
  <BODY>
  <br>
 	<%	
 	 	   request.setCharacterEncoding("utf-8");
 	
 	       ResultSet rs = (ResultSet) request.getAttribute("RS");
 	       if (rs == null) {
 	    	   out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
 	    	   return;
 	       }
 	       
 	%>

 	<%
  	       
 System.out.print("   >> rs : " + rs + "\n");	       
		   ResultSetMetaData md = rs.getMetaData();
		   int count = md.getColumnCount();
		   String[] columns = new String[count];
		   String[] columnTypes = new String[count];
		   for(int i=0; i<count; i++){
			   columns[i] = md.getColumnLabel(i+1);
			   columnTypes[i] = md.getColumnTypeName(i+1);
System.out.print("   >> clms : " + columns[i] + " " + columnTypes[i]+ "\n");	
     	   }
	  %>
	   
	   <table align=center valign=top border="1" cellpadding="8" cellspacing="0" bordercolor="#999999"> 
       <%
			out.print("<tr bgcolor=#CCCCCC>" );
      	 	out.print("<th>예약 번호</th>");
      	 	out.print("<th>ID</th>");
      	 	out.print("<th>관리자ID</th>");
      	 	out.print("<th>환불 이유</th>");
      	 	out.print("<th>환불일</th>");
      	 	out.print("<th>환불 가격</th>");
			out.print("</tr>" );

			while(rs.next()) {
				out.print("<tr>" );

				for(int i=0; i<columns.length; i++){

					Object obj= rs.getObject(columns[i]);
 // System.out.print("   >> col value : " + (obj) + "\n");
					if (obj == null)    // null 객체이면 null을 출력
						out.print("<td> null </td>");
					else if (columnTypes[i].equals("INTEGER") || columnTypes[i].equals("FLOAT")
			                             || columnTypes[i].equals("DOUBLE") || columnTypes[i].equals("BIGINT") )
						out.print("<td align=right>" + obj + "</td>");	
					else if (columnTypes[i].equals("VARCHAR") && ((String) obj).equals(""))
					     out.print("<td> &nbsp; </td>");	
					else if (columnTypes[i].equals("VARCHAR") )
						out.print("<td align=left>"+ obj + "</td>");	
 			     	else
					     out.print("<td>" + obj + "</td>");	
				}
				out.print("</tr>" );
			}
      %>
      </table>
  </BODY>
  <footer>
 <hr>
   <div id="foot">
    2022 @hanshin university / airplane
   </div>
   <div id="link">
       <a href="http://www.naver.com/" target="_blank">
           <img src="../image/naver.png" height="32">
       </a>
       <a href="http://www.google.com/" target="_blank">
           <img src="../image/google.png" height="32">
       </a>
       <a href="http://www.daum.net/" target="_blank">
           <img src="../image/daum.png" height="32">
       </a>
        </div>
        </hr>
        </footer>
</HTML>
