<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%
/*
��� �޽��� ����, ������� �̵�
*/


String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
%>

<script type="text/javascript">
<%
if (msg.length()>0){
%>
	alert("<%=msg %>");
<%	
}else{
%>
	alert("�ý��ۿ� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���.");
<%	
}
%>
parent.location.href="/event/eventList.do";
</script>
    