<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*, java.time.LocalDate"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>������ �߰�</TITLE></HEAD>
	<body>

		<%  
   	    	request.setCharacterEncoding("euc-kr");     	
		  
			
			String adID = (String) request.getParameter("adID");
			int PW = request.getParameter("pw").hashCode();
			String name = (String) request.getParameter("name");
			String address1 = (String) request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address = address1 + address2;
			LocalDate regdate = LocalDate.now();
			String tel = (String) request.getParameter("tel");
			String rank = (String) request.getParameter("rank");
			
         	DB.loadConnect();
         	if(1==DB.duplicateID(adID)){
         		out.print("<script> alert('�̹� �ִ� ���̵� �Դϴ�.');window.history.go(-1);</script>");
         	}
	        int k = DB.administrator_add(adID, PW,name,address,regdate.toString(),tel,rank);
	        if(k==0){
	        	out.print("<script> alert('�߰��� �����߽��ϴ�');window.location.href = 'http://localhost:8080/DBairport/administrator/administrator_check.jsp';</script>");
	        }else {
	        	out.print("<script> alert('�߰��� �����߽��ϴ�');window.location.href = 'http://localhost:8080/DBairport/administrator/administrator_check.jsp';</script>");
	        }
	       

       %>
	</body>
</html>