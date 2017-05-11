<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.CommunityDTO"%>
<%@ page import="ac.kr.ft.com.dto.FileDTO"%>
<%@ page import="java.util.List"%> 
<%@ page import="ac.kr.ft.com.dto.CommunityComDTO" %>
<% 
	CommunityDTO communityDto = (CommunityDTO) request.getAttribute("communityDto");

	if (communityDto == null) {
		communityDto = new CommunityDTO();
	}

	String login = (String)session.getAttribute("USER_NO");
	if (login == null){
		login = "";
	}
	
	System.out.println(login);
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>���Ǫ��Ʈ��</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	
	var commentSaveType = "A"; //��� ���� ���(A:��� ����, B:��� ����)
	
	/*
	#######################################################
	#	��� ������ ���� ����	
	#######################################################
	*/
	var viewSize = 5; //�ѹ��� ������ ��� ����
	var curViewSize = 0; //���� ��� ����
	var varCommentListCnt = 0; //��� �� ����
	
	//������ ��� ����(��� �̾ ���)
	var tag = "";
	var login = "<%=login %>";
	/*
	#######################################################
	#	��� ������ ���� ��
	#######################################################
	*/
	
	
	//�ε��� �ڵ�����
	function doOnload(){
		
		doCommList();
		
	}
	
	
	//������ ���� �ʱ�ȭ(��� ����, ������ �ʱ�ȭ ����=>������ ó������ ��ȸ)
	function doCommentPageInit(){
		var viewSize = 5; //�ѹ��� ������ ��� ����
		var curViewSize = 0; //���� ��� ����
		var varCommentListCnt = 0; //��� �� ����		
		
	
		
		
	}

	
	//�Խ��� ���� ������Ʈ,���� �� �ϳ�.
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U"){
			f.action = "busicommunityupdateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("�����Ͻðڽ��ϱ�?")) {
				f.action = "busidelete.do";
				f.submit();
			}
		}

	}
	

	//ajax ȣ��(��� ȣ��)
	function xmlHttpPost(actionUrl, submitParameter, resultFunction) {
		var xmlHttpRequest = false;

		//IE�ΰ��
		if (window.ActiveXObject) {
			xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
		} else {
			xmlHttpRequest = new XMLHttpRequest();
			xmlHttpRequest.overrideMimeType('text/xml');
		}

		xmlHttpRequest.open('POST', actionUrl, true);
		xmlHttpRequest.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xmlHttpRequest.onreadystatechange = function() {
			if (xmlHttpRequest.readyState == 4) {
				switch (xmlHttpRequest.status) {
				case 404:
					alert('����: ' + actionUrl + '�� �������� ����');
					break;
				case 500:
					alert('����: ' + xmlHttpRequest.responseText);
					break;
				default:
					eval(resultFunction + '(xmlHttpRequest.responseText);');
					break;
				}
			}
		}

		xmlHttpRequest.send(submitParameter);
	}

	
	//��� ����Ʈ ��ȸ�ϱ�
	function doCommList(){
		xmlHttpPost("/community/busiCommentList.do", "cmt_seq=<%=CmmUtil.nvl(communityDto.getCmt_seq())%>" , "viewResult");
		
	}
	
	//��� ����Ʈ ��ȸ ��ó��
	function viewResult(result) {
		var jsonObj = eval("("+ result+")");
		tag = "";
		
		//�迭����ŭ �ݺ��ϱ�
		for (var i=0;i<jsonObj.list.length;i++){
			
			if(login==null){ 
				
				tag +="<li>";
				tag +="  <div class=\"reply_detail\">";
				tag +="  <div class=\"head\">";
				tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
				tag +="    <span class='name'>|"+"&nbsp;&nbsp;"+ jsonObj.list[i].USER_NAME +"</span>";
				tag +=" 	</div>";
				tag +="  "+ jsonObj.list[i].CONTENTS +" ";
				tag +="  <div class=\"view_modify btn_wrap\">";
				tag +="  </div>";
				tag +="</div>";
				tag +="</li>";
				}else{
				tag +="<li>";
				tag +="  <div class=\"reply_detail\">";
				tag +="  <div class=\"head\">";
				tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
				tag +="    <span class='name'>|"+"&nbsp;&nbsp;"+ jsonObj.list[i].USER_NAME +"</span>";
				tag +=" 	</div>";
				tag +="  "+ jsonObj.list[i].CONTENTS +" ";
				tag +="  <div class=\"view_modify btn_wrap\">";
				tag +="   <input type=\"button\" value=\"����\" onclick=\"doCommentUpdateView('"+ jsonObj.list[i].COMT_SEQ +"', '"+ jsonObj.list[i].CONTENTS +"')\"  class=\"btn_modify\">";
				tag +="   <input type=\"button\" value=\"����\" onclick=\"doCommentDelete('"+ jsonObj.list[i].COMT_SEQ +"')\"  class=\"btn_delete\">";
				tag +="  </div>";
				tag +="</div>";
				tag +="</li>";
					
					
						
					
				}
			
		}
		
		$("#replyListArea").html(tag);

		//��� �� �־��ֱ�
		$("#commentListCnt").html(jsonObj.listCnt);
		
	
		varCommentListCnt = jsonObj.listCnt;
		curViewSize = jsonObj.list.length; //���� ��� ���� ������Ʈ
		
		displayBtnMoreView();
		
	}
	
	//��� ������ ��ȸ ��ó��
	function viewResultMoreView(result) {
		var jsonObj = eval("("+ result+")");
		
		//alert(tag);
		//�迭����ŭ �ݺ��ϱ�
		for (var i=0;i<jsonObj.list.length;i++){
			
			if(login==null){ 	
				tag +="<li>";
				tag +="  <div class=\"reply_detail\">";
				tag +="  <div class=\"head\">";
				tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
				tag +="    <span class='name'>|"+"&nbsp;&nbsp;"+ jsonObj.list[i].USER_NAME +"</span>";
				tag +=" 	</div>";
				tag +="  "+ jsonObj.list[i].CONTENTS +" ";
				tag +="  <div class=\"view_modify btn_wrap\">";
				tag +="  </div>";
				tag +="</div>";
				tag +="</li>";
												
					}else{		
				tag +="<li>";
				tag +="  <div class=\"reply_detail\">";
				tag +="  <div class=\"head\">";
				tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
				tag +="    <span class='name'>|"+"&nbsp;&nbsp;"+ jsonObj.list[i].USER_NAME +"</span>";
				tag +="  </div>";
				tag +="  "+ jsonObj.list[i].CONTENTS +" ";
				tag +="  <div class=\"view_modify btn_wrap\">";
				tag +="   <input type=\"button\" value=\"����\" onclick=\"doCommentUpdateView('"+ jsonObj.list[i].COMT_SEQ +"', '"+ jsonObj.list[i].CONTENTS +"')\"  class=\"btn_modify\">";
				tag +="   <input type=\"button\" value=\"����\" onclick=\"doCommentDelete('"+ jsonObj.list[i].COMT_SEQ +"')\"  class=\"btn_delete\">";
				tag +="  </div>";
				tag +="</div>";
				tag +="</li>";
					}
			
		}
		
		$("#replyListArea").html(tag);
		

		//��� �� �־��ֱ�
		$("#commentListCnt").html(jsonObj.listCnt);
		
		varCommentListCnt = jsonObj.listCnt;
		
		curViewSize += jsonObj.list.length; //���� ��� ���� ������Ʈ
		
		displayBtnMoreView();
		
	}
	
	
	//��� �����ϱ�
	function saveComment() {
		
		var f = document.getElementById("form2");
		
		if (f.contents.value == "") {
		   alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
		   f.contents.focus();
		   return false;
		}
		
		var actionUrl = ""; //ȣ�� url 
		var submitParameter = ""; 		
		var resultFunction =""; //������ ������ �Լ���
		
		//��� ���
		if (commentSaveType=="A"){
			var actionUrl = "/community/busiInsertComment.do"; //ȣ�� url 
			var submitParameter ="cmt_seq=<%=CmmUtil.nvl(communityDto.getCmt_seq())%>&contents=" + f.contents.value; 
			var resultFunction ="viewResultInsert"; //������ ������ �Լ���
			
		//��� ����			
		}else if (commentSaveType=="B"){
		
			var f = document.getElementById("form2"); //��� �Է� ��
			var actionUrl = "/community/busiUpdateComment.do"; //ȣ�� url 
			var submitParameter ="cmt_seq=<%=CmmUtil.nvl(communityDto.getCmt_seq())%>&com_seq="+ f.com_seq.value +"&contents=" + f.contents.value; 
			var resultFunction ="viewResultUpdate"; //������ ������ �Լ���
			
			
		}else{
			alert("������ �߻��߽��ϴ�.\n����� �õ��Ͻñ� �ٶ��ϴ�.")
			return;
		}
		
		xmlHttpPost(actionUrl, submitParameter, resultFunction);
			
	}
	
	//��� ��� �� ó��
	function viewResultInsert(result) {
		//��۵���� �����̶��...
		if (result=="1"){
			doCommList();
			
			//������ �Էµ� ��� ���� ����
			var f = document.getElementById("form2");
			f.contents.value="";
			
			
		}else{
			alert("��� ��Ͽ� �����Ͽ����ϴ�.");	
		}
	}
	

	//��� ���� ���� �����ֱ�
	function doCommentUpdateView(com_seq, contents){
		
		var f = document.getElementById("form2");
		f.com_seq.value= com_seq; //��� ��ȣ ����
		f.contents.value= contents.replace(/<br>/g,"\n"); //��� ���� �����ֱ�

		//��ư�� �����ϱ�
		document.getElementById("btnSave").value ="��� ����";
					
		//���� Ÿ������ ����
		commentSaveType = "B"; 
		
		//��� ���� ��� ��ư �����
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"��� ����\" onclick=\"saveComment()\" class=\"btn_confirm\">&nbsp;";
		    tag += "<input type=\"button\" id=\"btnCancle\" value=\"���� ���\" onclick=\"cancleComment()\" class=\"btn_confirm\">";
		
		$("#btnCommentArea").html(tag);
		
	}
	
	//��� ���� ���
	function cancleComment(result) {
		
		//��� ��� �������� ����
		commentSaveType = "A"; 
		
		//��� �������� �Էµ� ���� �ʱ�ȭ
		var f = document.getElementById("form2");
		f.com_seq.value= ""; //��� ��ȣ �ʱ�ȭ
		f.contents.value= ""; //��� ���� �ʱ�ȭ
		
		//��� ��� ��ư���� ����
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"��� ���\" onclick=\"saveComment()\" class=\"btn_confirm\">";
		
		$("#btnCommentArea").html(tag);
		
	}
	
	//��� ���� �� ó��
	function viewResultUpdate(result) {
			
		//��ۼ����� �����̶��...
		if (result=="1"){
				alert("����� �����Ǿ����ϴ�");
			//��� ���� ���� �ʱ�ȭ
			doCommentPageInit();
			
			commentSaveType = "A"; 
			
			//��� �������� �Էµ� ���� �ʱ�ȭ
			var f = document.getElementById("form2");
			f.com_seq.value= ""; //��� ��ȣ �ʱ�ȭ
			f.contents.value= ""; //��� ���� �ʱ�ȭ
			
			//��� ��� ��ư���� ����
			var tag  = "<input type=\"button\" id=\"btnSave\" value=\"��� ���\" onclick=\"saveComment()\" class=\"btn_confirm\">";
			
			$("#btnCommentArea").html(tag);
			
			
			//��� ��ȸ
			doCommList();
			
		
			
		}else{
			alert("��� ������ �����Ͽ����ϴ�.");	
		}
	}
	
	
	//��� �����ϱ�
	function doCommentDelete(com_seq){
		
		if(confirm("�����Ͻðڽ��ϱ�?")){
			var actionUrl = "/community/busiDeleteComment.do"; //ȣ�� url 
			var submitParameter ="cmt_seq=<%=CmmUtil.nvl(communityDto.getCmt_seq())%>&com_seq=" + com_seq; 
			var resultFunction ="viewResultDelete"; //������ ������ �Լ���
			
			xmlHttpPost(actionUrl, submitParameter, resultFunction);
			
		}
		
	}
	
	
	//��� ���� �� ó��
	function viewResultDelete(result) {
		
		//��ۻ����� �����̶��...
		if (result=="1"){
			
			//��� ���� ���� �ʱ�ȭ
			doCommentPageInit();
			
			commentSaveType = "A"; 
			
			//��� �������� �Էµ� ���� �ʱ�ȭ
			var f = document.getElementById("form2");
			f.com_seq.value= ""; //��� ��ȣ �ʱ�ȭ
			f.contents.value= ""; //��� ���� �ʱ�ȭ
			
			//��� ��� ��ư���� ����
			var tag  = "<input type=\"button\" id=\"btnSave\" value=\"��� ���\" onclick=\"saveComment()\" class=\"btn_confirm\">";
			
			$("#btnCommentArea").html(tag);
			
			//��� ��ȸ
			doCommList();
			
		}else{
			alert("��� ������ �����Ͽ����ϴ�.");	
		}
	}
	
	//��� ������(��ܿ� ����� ������ŭ ������ ��� ���� ����)
	function moreViewComment(){

		var start_page_size = parseInt(curViewSize) + 1; 
		var end_page_size = parseInt(curViewSize) + parseInt(viewSize) + 1;
		
		var actionUrl = "/community/busiCommentList.do"; //ȣ�� url 
		var submitParameter  ="cmt_seq=<%=CmmUtil.nvl(communityDto.getCmt_seq())%>";
		    submitParameter +="&start_page_size="+ start_page_size + "&end_page_size="+ end_page_size; 
		
		var resultFunction ="viewResultMoreView"; //������ ������ �Լ���
		
		xmlHttpPost(actionUrl, submitParameter, resultFunction);
			
		
	}
	
	function displayBtnMoreView(){
		
		//alert("curViewSize : "+ curViewSize + "|| varCommentListCnt :  "+ varCommentListCnt);
		//���� ��� ���� ��� �� ������ �۴ٸ�, ������ ������
		if (curViewSize < varCommentListCnt){
			document.getElementById("btnMoreView").style.display = "";
			
		}else{
			document.getElementById("btnMoreView").style.display = "none";
			
		}
		
	}
	</script>
	
	<script language="javascript">
function fc_chk_byte(obj_name,max_length)
{
   var ls_str     = obj_name.value; // �̺�Ʈ�� �Ͼ ��Ʈ���� value ��
   var li_str_len = ls_str.length;  // ��ü����
   // �����ʱ�ȭ
   var li_max      = max_length; // ������ ���ڼ� ũ��
   var i           = 0;  // for���� ���
   var li_byte     = 0;  // �ѱ��ϰ��� 2 �׹ܿ��� 1�� ����
   var li_len      = 0;  // substring�ϱ� ���ؼ� ���
   var ls_one_char = ""; // �ѱ��ھ� �˻��Ѵ�
   var ls_str2     = ""; // ���ڼ��� �ʰ��ϸ� �����Ҽ� ������������ �����ش�.
   
   for(i=0; i< li_str_len; i++)
   {
      // �ѱ�������
      ls_one_char = ls_str.charAt(i);
      // �ѱ��̸� 2�� ���Ѵ�.
      if (escape(ls_one_char).length > 4)
      {
         li_byte = li_byte+2;
      }
      // �׿��� ���� 1�� ���Ѵ�.
      else
      {
         li_byte++;
      }
      // ��ü ũ�Ⱑ li_max�� ����������
      if(li_byte <= li_max)
      {
         li_len = i + 1;
      }
   }   
   
   // ��ü���̸� �ʰ��ϸ�
   if(li_byte > li_max)
   {
      alert( li_max + " Bytes�� �ʰ� �Է��Ҽ� �����ϴ�. \n �ʰ��� ������ �ڵ����� ���� �˴ϴ�. ");
      ls_str2 = ls_str.substr(0, li_len);
      obj_name.value = ls_str2; 
      document.frms.chkbytes.value = cal_length(obj_name.value);
   }
   obj_name.focus();   
   document.frms.chkbytes.value = cal_length(ls_str);
}

/**
 * �ѱ��� 2����Ʈ �� ����Ͽ� �Է¹��� ���ڿ��� DB�� ����� �� �� �����Ʈ�� �����ϴ��� ����Ѵ�.
 * ����(\r\n)�� 2����Ʈ�� �����Ѵ�.
 * @param val : �Է¹��� ���ڿ�
 */
function cal_length(val)
{
  // �Է¹��� ���ڿ��� escape() �� �̿��Ͽ� ��ȯ�Ѵ�.
  // ��ȯ�� ���ڿ� �� �����ڵ�(�ѱ� ��)�� ���������� %uxxxx�� ��ȯ�ȴ�.
  var temp_estr = escape(val);
  var s_index   = 0;
  var e_index   = 0;
  var temp_str  = "";
  var cnt       = 0;

  // ���ڿ� �߿��� �����ڵ带 ã�� �����ϸ鼭 ������ ����.
  while ((e_index = temp_estr.indexOf("%u", s_index)) >= 0)  // ������ ���ڿ��� �����Ѵٸ�
  {
    temp_str += temp_estr.substring(s_index, e_index);
    s_index = e_index + 6;
    cnt ++;
  }

  temp_str += temp_estr.substring(s_index);

  temp_str = unescape(temp_str);  // ���� ���ڿ��� �ٲ۴�.

  // �����ڵ�� 2����Ʈ �� ����ϰ� �������� 1����Ʈ�� ����Ѵ�.
  return ((cnt * 2) + temp_str.length) + "";
}


 </script>
	<%@include file="/busiinc/apptop.jsp"%>
</head>
<body onload="doOnload()">
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
   <%@include file="/busiinc/appheader.jsp"%>
    <!-- E: HEADER -->
<%@include file="/busiinc/appmenu.jsp"%>
    <!-- S: CONTENT -->
    <!-- join -->
    <form name="form1" id="form1" method="post">
  	<input type="hidden" name="cmt_seq" value="<%=CmmUtil.nvl(communityDto.getCmt_seq())%>">
  
    <div class="content view" style="display:block;">
        <div class="content_wrapper">
        	
        	<header>
                <div class='view_title'>
                   <%=CmmUtil.nvl(communityDto.getTitle())%>
                </div>
                <span class='view_info'>
                    <span>   <%=CmmUtil.nvl(communityDto.getUser_name())%></span><br/>
                   <%=CmmUtil.nvl(communityDto.getReg_dt())%>&nbsp;&nbsp;|&nbsp;&nbsp;��ȸ <%=CmmUtil.nvl(communityDto.getRead_cnt())%>
					
 				
               
                </span>
                
            </header>
			<div class="section">
                <!-- group -->
	            <div class="view_detail">
				<img src="<%=CmmUtil.nvl(communityDto.getFile_name())%>" /><br/>
					<%=CmmUtil.nvl(communityDto.getContents())%>
				</div>
                <div class="view_modify btn_wrap">
                          
                          
                                
                    <input type="button" title="����" value="����" onclick="doAction('U')" class="btn_tri">
                    <input type="button" title="����" value="����" onclick="doAction('D')" class="btn_tri">
      				<input type="button" title="���" value="���" onclick="location.href='busicommunityList.do'"class="btn_tri">
                             
                </div>
            </div>
        </div>
    </div>
	</form>

			
	<form name="form2" id="form2"> 
	<input type="hidden" name="com_seq">
	<div class="content view" style="display:block;">
        <div class="content_wrapper">
		<div class="reply_head">��� <span id="commentListCnt"> 0 </span></div>
			
		    <ul class="reply">
		  	   <li>
               		<div class="reply_detail">
                           <span class="input_box">
                               <textarea name="contents" placeholder="������ �Է����ּ���." onkeyup="fc_chk_byte(this,4000);"></textarea>
                           </span>
					<div id="btnCommentArea" class="view_modify btn_wrap">
						<input type="button" id="btnSave" value="��� ���" onclick="saveComment()" class="btn_confirm">
					</div>

					</div>
                </li>
				
				<!-- ��� �����ִ� ���� -->									
			    <div id="replyListArea">
			    
			    
			    
			    </div>
                 

              <input id="btnMoreView" type="button" title="������" onclick="moreViewComment()" value="������" class="btn_white" />
              </ul>
    	</div>
	</div> 
    </form>
    

    <!-- E: CONTENT -->
			

	<!-- S: FOOTER -->
    <%@include file="/busiinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
    