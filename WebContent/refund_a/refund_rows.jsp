<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%@ page errorPage = "/error/erroepageSelect.jsp" %>         
<!DOCTYPE html>
<html>
	<HEAD><TITLE>ȯ��(������)</TITLE></HEAD>
	<body>

		<%  
   	    	request.setCharacterEncoding("euc-kr");     	
		  
			String id = (String) session.getAttribute("ID");
			ResultSet rs = DB.reservation_Check(id);
	       if (rs == null) {
	    	   out.print("<H3 align=center >ResultSet ��ü�� ���޵��� �ʾҽ��ϴ�.</H3>");  
	    	   return;
	       }
			%>
			
			<%
			
		    int rows =Integer.parseInt(request.getParameter("rows")); 
			session.setAttribute("rows1", rows);
			String refundyn="";
			
			
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
			   int k=0;
				while(rs.next()) {
						Object obj= rs.getObject(columns[11]);

						if(k==rows){
							refundyn = String.valueOf(obj);
					}

					if(k==rows){
						
						break;
					}
					k++;
				}

	        if(refundyn.equals("N")){
	        	out.print("<script> alert('ȯ�� �Ұ��� �����Դϴ�'); window.history.go(-1);;</script>");
	        }else {
	        	out.print("<script> alert('ȯ�� �����մϴ�');window.location.href = 'http://localhost:8080/DBairport/refund_a/refund.html';</script>");
	        }


       %>
	</body>
</html>