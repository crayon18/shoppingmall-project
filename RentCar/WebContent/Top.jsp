<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
			<img alt="" src="img/jang.jpg" height="65">
		</td>
		<td align="center" width="200">
			<%=id %>�� �ݰ����ϴ�.
		</td>
	</tr>
	<tr height="50">
		<td align="center" width="200" bgcolor="pink">
			<font color="white" size="5"><a href="#" style="text-decoration:none">�����ϱ�</a></font>
		</td>
		<td align="center" width="200" bgcolor="pink">
			<font color="white" size="5"><a href="#" style="text-decoration:none">����Ȯ��</a></font>
		</td>
		<td align="center" width="200" bgcolor="pink">
			<font color="white" size="5"><a href="#" style="text-decoration:none">�����Խ���</a></font>
		</td>
		<td align="center" width="200" bgcolor="pink">
			<font color="white" size="5"><a href="#" style="text-decoration:none">�̺�Ʈ</a></font>
		</td>
		<td align="center" width="200" bgcolor="pink">
			<font color="white" size="5"><a href="#" style="text-decoration:none">��������</a></font>
		</td>
	</tr>
</table>

</body>
</html>