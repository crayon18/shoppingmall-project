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
<% //ī�װ��� �з��� �޾ƿ�
	int category = Integer.parseInt(request.getParameter("category"));
	String temp="";
	if(category==1)temp="����";
	else if(category==2)temp="����";
	else if(category==3)temp="����";
%>

<center>
<table width="1000">
<tr height="100">
	<td align="center" colspan="3">
	<font size="5" color="gray"><%=temp %>�ڵ���</font>
	</td>
	</tr>
<%

	RentcarDAO rdao = new RentcarDAO();
	Vector<CarListBean> v = rdao.getCategoryCar(category);
	//tr�� 3���� �����ְ� �ٽ� tr�� �����Ҽ� �ֵ��� �ϴº��� ����
	int j=0;
	for(int i=0; i < v.size(); i++){
		
		//���Ϳ� ����� ��Ŭ������ ����
		CarListBean bean = v.get(i);
		if(j%3 ==0){
%>
		<tr height="220">
<% } %>
			<td width="333" align="center">
			<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
			<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
			</a><p>
			<font size="3" color="gray"><b>������ : <%=bean.getName() %></b></font></p></td>
	<% 
			j=j+1; //j���� �����Ͽ� �ϳ��� �࿡ ��3���� ���� ������ �����ֱ����ؼ� ����
	}
%>

</table>
</center>
</body>
</html>