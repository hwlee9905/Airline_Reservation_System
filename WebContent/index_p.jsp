<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%String id = (String)session.getAttribute("user_id");%>
<HTML>
<HEAD>
<HEAD>
<style type="text/css">
h1{font-size: 50px; color:orangered; margin:30px 0 50px 0}


</style>
<link rel="stylesheet" href="style.css">
<TITLE>�װ� ���� �ý���</TITLE>
</HEAD>
</HEAD>

<BODY>
	<H2 align = right> <%=id%>�� ȯ���մϴ� (�°� �α���)</H2>
	<h1 align = center>Airline Ticket Reservation</h1>
    <H5 align=center>
    <button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/reservation/assignCheck.jsp'" >
	�װ��� ��ȸ<span>�װ��� ��ȸ</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/refund_p/listRS_reservatoin2.jsp'" >
	���� ��ȸ<span>���� ��ȸ</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="location.href='/DBairport/login.html'" >
	�α׾ƿ�<span>�α׾ƿ�</span>
	</button>
	</H5>
	<table width=100%>		
		<tr width=100% height=700>
		    <td colspan=3>				
					<iframe frameBorder="0" width=100% height=700 src=/DBairport/reservation/assignCheck.jsp name=iframeContent seamless="seamless">					
	        </td>
	    <tr>
	</table>
</BODY>
</HTML>
