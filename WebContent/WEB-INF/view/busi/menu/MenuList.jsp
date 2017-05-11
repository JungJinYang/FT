<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%@ page import="java.util.List"%>        
<%
List<MenuInfoDTO> rList = (List<MenuInfoDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<MenuInfoDTO>();
}

int listCnt = rList.size(); //����Ʈ ũ��

String auth = (String)request.getSession().getAttribute("AUTH");
if (auth == null){
	auth = "";
}
%>     
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>���Ǫ��Ʈ��</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    
	<script type="text/javascript">
	
		//���ȭ�� �̵�
		function doReg() {
			location.href="/menu/busiMenuReg.do"; 
		}
	</script>
	
	
	
	<%@include file="/busiinc/apptop.jsp" %>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
   <%@include file="/busiinc/appheader.jsp"%>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
	<%@include file="/busiinc/appmenu.jsp"%>
	<!-- login -->
    <div class="content" style='display:block;'>
        <div class="content_wrapper">
        	<header><span>�޴�����</span></header>
			<div class='section'>
				<%
				Iterator<MenuInfoDTO> it = rList.iterator();
				while(it.hasNext()){
					MenuInfoDTO rDTO = (MenuInfoDTO)it.next();
					
					if (rDTO==null){
						rDTO = new MenuInfoDTO();
					}				
				
				
				%>				
                <a href="BusiMenuDetail.do?menu_seq=<%=CmmUtil.nvl(rDTO.getMenu_seq())%>" class='food'>
                <img src='<%=CmmUtil.nvl(rDTO.getFile_name())%>' />
                <div class='title'><%=CmmUtil.nvl(rDTO.getMenu_name())%></br> <%=CmmUtil.nvl(rDTO.getPrice(), "0") + "��"%></div></a>
                <%
				}
                %>
       	<input type="button" title="�޴����"  value="�޴����" class="btn_global" onclick="doReg()"> 
        	
        			
        	
        	
        	
        	</div>
		</div>
    </div>
	<!-- login -->

    <!-- S: FOOTER -->
<%@include file="/busiinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
