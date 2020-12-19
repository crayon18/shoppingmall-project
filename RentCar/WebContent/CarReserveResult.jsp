<%@ page import="java.util.Date"%>
<%@ page import="db.RentcarDAO"%>
<%@ page import="db.CarListBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty name="rbean" property="*"/>
</jsp:useBean>

<%
	String id = (String)session.getAttribute("id");
	
	if(id==null){
%>
	<script>
		alert("�α����� ������ �����մϴ�");
		location.href='RentcarMain.jsp?center=MemberLogin.jsp';
	</script>	
<%
	}

	//��¥ �� 
	Date d1 = new Date();
	Date d2 = new Date();
	
	//��¥�� 2020-12-17 ���� ���ִ� Ŭ���� ����
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	d1 = sdf.parse(rbean.getRday());
	d2 = sdf.parse(sdf.format(d2));
	//��¥ �� �޼ҵ带 ��� ��������
	int compare = d1.compareTo(d2);
	//���� �Ϸ��� ��¥���� ���� ��¥�� ũ�ٸ� -1
	//���� �Ϸ��� ��¥�� ���� ��¥�� ���ٸ� 0
	//���� �Ϸ��� ���ڰ� �� ũ�ٸ� 1�� ����
	if(compare < 0){//���ú��� ���� ��¥ ���ý�
	%>
		<script>
		alert("���� �ý��� ��¥���� ���� ��¥�� �����Ҽ� �����ϴ�");
		history.go(-1);
		</script>
<%	
	}
	
	//��������� �ƹ��� ������ ���ٸ� ������ ������ ��� ������ �����ֱ�
	//���̵� ���� ��Ŭ������ ���⶧���� ���⼭ ������
	String id1 = (String)session.getAttribute("id");
	rbean.setId(id1);
	
	
	//�����ͺ��̽��� ��Ŭ������ ����
	RentcarDAO rdao = new RentcarDAO();
	rdao.setReserveCar(rbean); 
	
	//�������� ������
	CarListBean cbean = rdao.getOneCar(rbean.getNo());
	
	//���� �� �ݾ�
	int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
	//�ɼ� �ݾ�
	int usein = 0;
		if(rbean.getUsein()==1)usein=10000;
	int usewifi = 0;
		if(rbean.getUsewifi()==1)usewifi=10000;
	int useseat = 0;
		if(rbean.getUseseat()==1)useseat=10000;
	
	int totaloption = (rbean.getQty()*rbean.getDday())*(usein+usewifi+useseat);
%>

<center>
	<table width="1000">
		<tr height="100">
			<td align="center">
			<font size="6" color="gray">���� ���� �Ϸ� ȭ��</font></td>
		</tr>
		<tr>
			<td align="center">
			<img alt="" src="img/<%=cbean.getImg()%>" width="470"></td>
		</tr>
		<tr height="50">
			<td align="center">
			<font size="5" color="red">���� �� ���� �ݾ�<%=totalcar %>��</font></td>
		</tr>
		<tr height="50">
			<td align="center">
			<font size="5" color="red">���� �� �ɼ� �ݾ�<%=totaloption %>��</font></td>
		</tr>
		<tr height="50">
			<td align="center">
			<font size="5" color="red">���� �� �ݾ�<%=totaloption+totalcar %>��</font></td>
		</tr>
	</table>
</center>


</body>
</html>