<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.* "  %>
<!DOCTYPE html> 
<html> 
<head> 

<title>idCheck</title>
 </head> 
 <body> 
 	<div style="text-align: center"> 
 	<h3>* ���̵� �ߺ�Ȯ�� *</h3> 
 	<form method="post" action="idCheckPro.jsp" onsubmit="return blankCheck(this)"> 
 	���̵� : <input type="text" name="id" maxlength="10" autofocus> 
 	<input type="submit" value="�ߺ�Ȯ��"> </form> 
 	</div> 
 	<script> 
 	function blankCheck(f){ 
 		var id=f.id.value; 
 		id=id.trim(); 
 		if(id.length<4){ 
 			alert("���̵�� 4�� �̻� �Է����ֽʽÿ�."); 
 			return false; 
 		}
 		return true;
 	}
 	</script> 
 </body> 
 </html>

