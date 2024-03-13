<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%String id = (String)session.getAttribute("user_id");
%>
<HTML>
<HEAD>
<style type="text/css">
h1{font-size: 50px; color:orangered; margin:30px 0 50px 0}
footer #foot {font-size:20px; margin: 20px 0 0 20px; float:left;}
footer #link {margin: 10px 20px 20px 20px; float:right;}

</style>
<link rel="stylesheet" href="style.css">
<TITLE>항공 관리 시스템</TITLE>
</HEAD>

<BODY>
	<H2 align = right> <%=id%>님 환영합니다 (관리자 로그인)</H2>
	<h1 align = center>Airline Ticket Reservation</h1>
    <H5 align=center>
    <p width=100>
    <button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/flight/flightCheck.jsp'" >
	항공편 조회<span>항공편 조회</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/aircraft/aircraftCheck.jsp'" >
	항공기 조회<span>항공기 조회</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/assign/assign.jsp'" >
	항공기 배정<span>항공기 배정</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/refund_a/passenger_Check.jsp'" >
	승객 조회<span>승객 조회</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/administrator/administrator_check.jsp'" >
	관리자 조회<span>관리자 조회</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="iframeContent.location.href='/DBairport/refund_list/refundCheck.jsp'" >
	환불 내역<span>환불 내역</span>
	</button>
	<button style="border-radius: 5em;  background: #F9F9F9; box-shadow: 2px 3px 10px rgba(0,0,0,0.2);  margin-right: 5px;" class="btn btn-swap" onclick="location.href='/DBairport/login.html'" >
	로그아웃<span>로그아웃</span>
	</button>
    </H5>
	<table width=100% >		
		<tr width=100% >
		    <td colspan=3>				
					<iframe frameBorder="0" width=100% height=800px src=/DBairport/flight/flightCheck.jsp name=iframeContent seamless="seamless">					
	        </td>
	    <tr>
	</table>
</BODY>
</HTML>
