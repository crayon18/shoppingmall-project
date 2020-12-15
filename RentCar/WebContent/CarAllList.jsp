<%@ page import= "db.RentcarDAO" %>
<%@ page import= "db.CarListBean" %>
<%@ page import= "java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<table width="1000">
<tr height="100">
	<td align="center" colspan="3">
	<font size="5" color="gray">전체 자동차</font>
	</td>
	</tr>
<%
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarListBean> v = rdao.getAllCar(); 
	//tr을 3개씩 보여주고 다시 tr을 실행할수 있도록 하는변수 선언
	int j=0;
	for(int i=0; i < v.size(); i++){
		
		//백터에 저장된 빈클래스를 추출
		CarListBean bean = v.get(i);
		if(j%3 ==0){
%>
		<tr height="220">
<% } %>
			<td width="333" align="center">
			<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
			<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
			</a><p>
			<font size="3" color="gray"><b>차량명 : <%=bean.getName() %></b></font></p></td>
	<% 
			j=j+1; //j값을 증가하여 하나의 행에 총3개의 차량 정보를 보여주기위해서 증가
	}
%>

</table>
</center>
</body>
</html>