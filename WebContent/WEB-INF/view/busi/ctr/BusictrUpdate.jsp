<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%
CtrDTO ctrDto = (CtrDTO)request.getAttribute("ctrDto"); 

if (ctrDto==null){
	ctrDto = new CtrDTO();
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
	function doKeyOnlyNumber(event) {
		
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.KeyCode;
		if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
			return true;
		}else{
			return false;
		}
	}
		function doAction(gubun) {
			var f = document.getElementById("form1");
			if(gubun=="U"){
				f.action = "BusictrUpdate.do";
				f.submit();
			}else if(gubun=="D"){
				if(confirm("�����Ͻðڽ��ϱ�?")){
					f.action = "delete.do";
					f.submit();
				}
			}
		}
		
		 var SetComma = function(str) {

		       var regMustNumberComma = /^[\t|0-9|,]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + "," + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("���ڸ� �Է��Ͻ� �� �ֽ��ϴ�.");
		               return "";
		           }
		           return retValue;

		   }

		   var SetComma1 = function(str) {

		       var regMustNumberComma = /^[\t|0-9]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("���ڸ� �Է��Ͻ� �� �ֽ��ϴ�.");
		               return "";
		           }
		           return retValue;

		   }
		function disableCheck(obj) {
		    if (obj[obj.selectedIndex].className=='disabled') {
		        alert("�̹� �Ϸ�� �ŷ��Դϴ�.");
		        for (var i=0; obj[i].className=="disabled"; i++); obj.selectedIndex = i; return;
		    }
		}
		
	</script>
	<%@include file="/busiinc/apptop.jsp"%>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
    	<%@include file="/busiinc/appheader.jsp"%>
    <!-- E: HEADER -->
 <%@include file="/busiinc/appmenu.jsp"%>
    <!-- S: CONTENT -->
    <!-- join -->
<form name="f" method="post" action="BusictrUpdate.do">
<input type="hidden" name="ctr_seq" value="<%=CmmUtil.nvl(ctrDto.getCtr_seq()) %>"/>

    
    
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>�����͸� ����</span></header>
			<div class="section">
			
			
        		<div class="input_row">
					<span class="input_box">
						<label class="lbl" >����</label>
						<input type="text" name="title" placeholder="����" class="input_area" value="<%=CmmUtil.nvl(ctrDto.getTitle())%>">
					</span>
				</div>
				
				
				<!-- ��¥ ���� ���ϰ� �ƿ� ���ɾ�� 1022-->
				<div class="input_row">
					<span class="input_box">
						<label class="lbl" >��¥</label>
						<input type="text" name="reg_dt" placeholder="��¥" class="input_area" value="<%=CmmUtil.nvl(ctrDto.getReg_dt())%>" disabled="disabled">
					</span>
				</div>
				
				<!-- �����Ȳ�� ���Ҿ� 1022--> 
			
				  <select class="only" name="progress" onChange="disableCheck(this)">
                        <!-- 
                        Register = ��û 
                        Register Success = �����Ϸ�
                        Progressing = ������
                        Trade Success = �ŷ��Ϸ�
                        -->
                            
                            <% if(CmmUtil.nvl(ctrDto.getProgress()).equals("R")){
                                  out.print("<option value='R'>��û</option>");
                                  out.print("<option value='RS'>�����Ϸ�</option>");
                                  out.print("<option value='P'>������</option>");
                                  out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                               }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("RS")){
                                  out.print("<option value='RS'>�����Ϸ�</option>");
                       			  out.print("<option value='R'>��û</option>");
                                  out.print("<option value='P'>������</option>");
                                  out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                               }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("P")){
                                  out.print("<option value='P'>������</option>");
                              	  out.print("<option value='R'>��û</option>");
                                  out.print("<option value='RS'>�����Ϸ�</option>");
                                  out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                               }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("TS")){
                                  out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                              	  out.print("<option value='R' class=disabled >��û</option>");
                                  out.print("<option value='RS'class=disabled >�����Ϸ�</option>");
                                  out.print("<option value='P' class=disabled >������</option>");
                               }else{
                                  out.print("����");
                               }
                                  %>
                    </select>
				
	            <div class="input_row">
					<span class="input_box">
						<label class="lbl" >�����ο�</label>
						<input type="text" name="people"  placeholder="�����ο�" maxlength="4"  class="input_area" value="<%=CmmUtil.nvl(ctrDto.getPeople())%>" onkeyup="this.value=SetComma(this.value)"/>
						<%-- <input type="number" name="people" placeholder="�����ο�" maxlength="4" class="input_area" value="<%=CmmUtil.nvl(ctrDto.getPeople())%>" onkeydown="return doKeyOnlyNumber(event);"/> --%>
					</span>
				</div>
                
                <div class="input_row">
					<span class="input_box">
						<label class="lbl" >���</label>
						<input type="text" name="place" placeholder="���" class="input_area" value="<%=CmmUtil.nvl(ctrDto.getPlace())%>">
					</span>
				</div>
				
				<div class="input_row">
					<span class="input_box">
						<label class="lbl" >�̸�</label>
						<input type="text" name="user_name"placeholder="�̸�" class="input_area" value="<%=CmmUtil.nvl(ctrDto.getUser_name())%>">
					</span>
				</div>
				
				
				<!-- ��ȭ��ȣ ���Ҿ� �� 10.22 -->				
                <!-- group -->
				<div class="group" style='display:block;height:40px;' >
					<div class="input_select phone">
						<select name="tel_1" value="<%=CmmUtil.nvl(ctrDto.getTel_1())%>" onkeyup="this.value=SetComma1(this.value)">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
						</select>
					</div>
					<label class='dash'> - </label>
					<div class="input_row phone">
						<span class="input_box">
							<label class="lbl" >��ȭ��ȣ</label>
							<input type="number" name="tel_2" class="input_phone" value="<%=CmmUtil.nvl(ctrDto.getTel_2())%>" maxlength="4" onkeyup="this.value=SetComma1(this.value)">
						</span>	
					</div>
					<label class='dash'> - </label>
					<div class="input_row phone">
						<span class="input_box">
							<label class="lbl" >��ȭ��ȣ</label>
							<input type="number" name="tel_3" class="input_phone" value="<%=CmmUtil.nvl(ctrDto.getTel_3())%>" maxlength="4" onkeyup="this.value=SetComma1(this.value)">
						</span>	
					</div>
				</div>
                <!-- group -->
                
                 <br/>
					
		<%-- 	  <select class="only" name="ctr_yn">
                               <% if(CmmUtil.nvl(ctrDto.getCtr_yn()).equals("1")){
                                  out.print("<option value='1'>�������� ��</option>");
                                  out.print("<option value='2'>�������� �ƴϿ�</option>");
                               }else if(CmmUtil.nvl(ctrDto.getCtr_yn()).equals("2")){
                                   out.print("<option value='2'>�������� �ƴϿ�</option>");
                              		out.print("<option value='1'>�������� ��</option>");
                               }else{
                                  out.print("����");
                               }
                                  %>
               </select> --%>
            
			<div class="input_content">
               <span class="input_box">
                        <textarea name="contents" placeholder="����"><%=CmmUtil.nvl(ctrDto.getContents())%></textarea>
               </span>
            </div>
                
            </div>
        </div>
    </div>
   
    <div class="content wrapper50">
	    <input type="submit" title="Ȯ��" value="Ȯ��" class="btn_half left">
	    <input type="button" title="���" value="���" onclick="location.href='/ctr/BusictrList.do'" class="btn_half left">
    </div>
     </form>
    
    <!-- �� �����Ѱ� ���µ� ���̷��� 1022-->
    
    <!-- E: CONTENT -->

    <!-- S: FOOTER --> 
   	<%@include file="/busiinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>

    