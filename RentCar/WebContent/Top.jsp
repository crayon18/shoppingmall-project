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
<!-- 세션을 이용한 로그인 처리 -->
<%
	String id = (String) session.getAttribute("id");

	//로그인이 되어 있지 않다면
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
			<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">로그인</button>	
		<%
			}else{%>
				<button onclick="location.href='MemberLogout.jsp'">로그아웃</button>
		<%
			}
		%>
		</td>
	</tr>
	<tr height="50">
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="text-decoration:none">예약하기</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="RentcarMain.jsp?center=CarReserveView.jsp" style="text-decoration:none">예약확인</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="#" style="text-decoration:none">자유게시판</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="#" style="text-decoration:none">이벤트</a></font>
		</td>
		<td align="center" width="200" bgcolor="red">
			<font size="5"><a href="#" style="text-decoration:none">고객센터</a></font>
		</td>
	</tr>
</table>

</body>
</html>