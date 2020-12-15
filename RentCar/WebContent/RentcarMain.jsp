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
	
//처음 실행 시에는 center값이 넘어오지 않기때문에 널처리 해줌
	if(center==null){
		center = "Center.jsp";//디폴트(기본) center값을 예제
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