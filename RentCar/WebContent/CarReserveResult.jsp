<%@ page import="java.util.Date"%>
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
	
%>
</body>
</html>