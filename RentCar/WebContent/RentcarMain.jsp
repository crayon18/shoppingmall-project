<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String center = request.getParameter("center");
	
//ó�� ���� �ÿ��� center���� �Ѿ���� �ʱ⶧���� ��ó�� ����
	if(center==null){
		center = "Center.jsp";//����Ʈ(�⺻) center���� ����
	}
%>

<table width="1000">
<!-- top -->
	<tr height="140" align="center">
		<td align="center" width="1000">
		<jsp:include page="Top.jsp"></jsp:include>
		</td>
	</tr>
<!-- center -->
	<tr height="600" align="center">
		<td align="center" width="1000">
		<jsp:include page="<%=center %>"></jsp:include>
		</td>
	</tr>
<!-- bottom -->
	<tr height="140" align="center">
		<td align="center" width="1000">
		<jsp:include page="Bottom.jsp"></jsp:include>
		</td>
	</tr>
</table>

</body>
</html>