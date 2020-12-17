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
		alert("로그인후 예약이 가능합니다");
		location.href='RentcarMain.jsp?center=MemberLogin.jsp';
	</script>	
<%
	}

	//날짜 비교 
	Date d1 = new Date();
	Date d2 = new Date();
	
	//날짜를 2020-12-17 포멧 해주는 클래스 선언
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	d1 = sdf.parse(rbean.getRday());
	d2 = sdf.parse(sdf.format(d2));
	//날짜 비교 메소드를 사용 가능해짐
	int compare = d1.compareTo(d2);
	//예약 하려는 날짜보다 현재 날짜가 크다면 -1
	//예약 하려는 날짜와 현재 날짜가 같다면 0
	//예약 하려는 날자가 더 크다면 1을 리턴
	if(compare < 0){//오늘보다 이전 날짜 선택시
	%>
		<script>
		alert("현재 시스템 날짜보다 이전 날짜는 선택할수 없습니다");
		history.go(-1);
		</script>
<%	
	}
	
%>
</body>
</html>