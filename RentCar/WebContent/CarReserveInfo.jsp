<%@ page import= "db.RentcarDAO" %>
<%@ page import= "db.CarListBean" %>
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
	int no = Integer.parseInt(request.getParameter("no"));

	//������ ���̽��� ����
	RentcarDAO rdao = new RentcarDAO();
	//��Ʈī �ϳ������� ������ ����
	CarListBean bean = rdao.getOneCar(no);
	
	int category = bean.getCategory();
	String temp="";
	if(category==1)temp="����";
	else if(category==2)temp="����";
	else if(category==3)temp="����";
%>

<center>
<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
<table width="1000">
	<tr height="100">
		<td align="center" colspan="3">
		<font size="6" color="gray"><%=bean.getName() %>���� ����</font></td>
	</tr> 
	<tr>
		<td rowspan="6" width="500">
		<img alt="" src="img/<%=bean.getImg()%>" width="450">
		<td width="250" align="center"> �����̸� </td>
		<td width="250" align="center"><%=bean.getName() %> </td>
	</tr>
		<tr>
		<td width="250" align="center"> �������� </td>
		<td width="250" align="center"><select name="qty">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										</select> </td>
	</tr>
	<tr>
		<td width="250" align="center"> �����з� </td>
		<td width="250" align="center"><%=temp %> </td>
	</tr>
	<tr>
		<td width="250" align="center"> �뿩���� </td>
		<td width="250" align="center"><%=bean.getPrice() %>�� </td>
	</tr>
	<tr>
		<td width="250" align="center"> ����ȸ�� </td>
		<td width="250" align="center"><%=bean.getCompany() %> </td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="hidden" name="no" value="<%=bean.getNo()%>">
		<input type="hidden" name="img" value="<%=bean.getImg() %>">
		<input type="submit" value="�ɼǼ����� �����ϱ�">
		</td>
	</tr> 
</table>
	<br><br><br>
	<font size="6" color="gray">���� ���� ����</font>
	<p>
	<%=bean.getInfo()%>
</form>
</center>

</body>
</html>