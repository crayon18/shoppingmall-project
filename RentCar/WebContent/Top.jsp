<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
a {
color:white;
}
</style>
</head>
<body>
<!-- ������ �̿��� �α��� ó�� -->
<%
	String id = (String) session.getAttribute("id");

	//�α����� �Ǿ� ���� �ʴٸ�
	if(id==null){
		id="guest";
	}
%>


<table width="1000">
	<tr height="70">
		<td colspan="4">
			<a href="RentcarMain.jsp" style="text-decoration:none">
			<img alt="" src="img/jang.jpg" height="65">
			</a>
		</td>
		<td align="center" width="200">
			<%=id %>
		<%
			if(id.equals("guest")){ %>
			<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">�α���</button>	
		<%
			}else{%>
				<button onclick="location.href='MemberLogout.jsp'">�α׾ƿ�</button>
		<%
			}
		%>
		</td>
	</tr>
	<tr height="50">
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="text-decoration:none">�����ϱ�</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="RentcarMain.jsp?center=CarReserveView.jsp" style="text-decoration:none">����Ȯ��</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="#" style="text-decoration:none">�����Խ���</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="#" style="text-decoration:none">�̺�Ʈ</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="#" style="text-decoration:none">������</a></font>
		</td>
	</tr>
</table>

</body>
</html>