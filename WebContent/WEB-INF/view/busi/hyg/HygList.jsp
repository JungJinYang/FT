<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.HygDTO"%>
<%@ page import="java.util.List"%>   
<%
List<HygDTO> rList = (List<HygDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<HygDTO>();
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
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    
    
    
		<script type="text/javascript">

			//���ȭ�� �̵�
			function doReg() {
			location.href="/hyg/busihygReg.do"; 
			}
			
			function doDeleteList() {
				
				var checked = false; //üũ�� ���¿���
				var check = document.getElementsByName("chkMenu");

				for( var i=0; i<check.length;i++){
					if(check[i].checked){
						checked = true;
					}
				}
				
				if (checked){
					if (confirm("�����Ͻðڽ��ϱ�?")){
						var f = document.getElementById("f");
						f.submit();
					}
				}else{
					alert("�ϳ� �̻� üũ���ֽñ� �ٶ��ϴ�.");
					
				}
			}

			/* 	function doAction(gubun) {
				var f = document.getElementById("form1");
				if (gubun == "U") {
					f.action = "busiupdateForm.do";
					f.submit();
				} else if (gubun == "D") {
					if (confirm("�����Ͻðڽ��ϱ�?")) {
						f.action = "busidelete.do";
						f.submit();
					}
				}
			} */

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
    <!-- join -->
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>����������</span></header>
			<div class="section">
			
			<form name="f" id="f" method="post" action="busideleteAllCheckList.do">
			<%
				Iterator<HygDTO> it = rList.iterator();
				while(it.hasNext()){
					HygDTO rDTO = (HygDTO)it.next();
					
					if (rDTO==null){
						rDTO = new HygDTO();
					}	
					%>
					
					
                   <a href="busiHygDetail.do?hgn_seq=<%=CmmUtil.nvl(rDTO.getHgn_seq())%>">
                   <div class='certi'> <img src="<%=CmmUtil.nvl(rDTO.getFile_name())%>"/>
                   
                    <input type='checkbox' name="chkMenu" value="<%=CmmUtil.nvl(rDTO.getHgn_seq())%>"/></div></a>

	            <%
				}
	             %>
	             
             </form>   
 

                <div class='wrapper50'>
              
						<input type="button" title="���" value="���" class="btn_half left" onclick="doReg()">
                    	<input type="button" title="����" value="����" class="btn_half left"  onclick="doDeleteList()">
 				
    
	
                
                
                
                
                </div>
            </div>
        </div>
    </div>
    <!-- join -->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
<%@include file="/busiinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
