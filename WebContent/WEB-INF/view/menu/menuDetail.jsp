<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%@page import="ac.kr.ft.com.dto.MenuComDTO"%>
<%
	MenuInfoDTO menuinfoDto = (MenuInfoDTO) request.getAttribute("menuinfoDto");

	if (menuinfoDto == null) {
		menuinfoDto = new MenuInfoDTO();
	}
	List<MenuComDTO> cList = menuinfoDto.getrList();

	if (cList == null) {
		cList = new ArrayList<MenuComDTO>();
	}
%>




<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>�޴�����</title>

<%@include file="/inc/top.jsp"%>
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">


	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "updateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("�����Ͻðڽ��ϱ�?")) {
				f.action = "delete.do";
				f.submit();
			}
		}
	}
var commentSaveType = "A"; //��� ���� ���(A:��� ����, B:��� ����)
	

	//������ ��� ����(��� �̾ ���)
	var tag = "";
	
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
		xmlHttpPost("/menu/CommentList.do", "menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>" , "viewResult");
		
	}
	
	
	//��� ����Ʈ ��ȸ ��ó��
	function viewResult(result) {
		
		var jsonObj = eval("("+ result+")");
		
		tag = "";
	
		//�迭����ŭ �ݺ��ϱ�
		for (var i=0;i<jsonObj.list.length;i++){
			var contents = jsonObj.list[i].CONTENTS.replace(/<br>/gi,"\r\n");	
			tag +="<tr>";
			tag +=" <td>";
			tag +=" "+jsonObj.list[i].REG_DT+""; 
			tag += "</td>";
			tag +=" <td>";
			tag +="    <textarea  rows=\"3\" cols=\"40\" readonly style=\"background-color: #e2e2e2; width: 700px; height: 80px;\">"+contents+"</textarea>";
			tag +=" </td>";
			tag +=" <td>";
			tag +=" 	<input type=\"button\" value=\"��ۼ���\" class=\"btn btn-outline btn-warning\" style=\"width: 100px; height: 40px;\" onclick=\"doCommentUpdateView('"+ jsonObj.list[i].COM_SEQ +"', '"+ jsonObj.list[i].CONTENTS +"')\">";
			tag +=" 	<input type=\"button\" value=\"��ۻ���\" class=\"btn btn-outline btn-danger\"  style=\"width: 100px; height: 40px;\" onclick=\"doCommentDelete('"+ jsonObj.list[i].COM_SEQ +"')\" >";
			tag +=" </td>";
			tag +="</tr>";
		}
		

		$("#replyListArea").html(tag);

		//��� �� �־��ֱ�
		$("#commentListCnt").html(jsonObj.listCnt);
		
	
		varCommentListCnt = jsonObj.listCnt;
		curViewSize = jsonObj.list.length; //���� ��� ���� ������Ʈ
		
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
			var actionUrl = "/menu/InsertComment.do"; //ȣ�� url 
			var submitParameter ="menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>&contents=" + f.contents.value; 
			var resultFunction ="viewResultInsert"; //������ ������ �Լ���
			
			
		//��� ����			
		}else if (commentSaveType=="B"){
	
			var f = document.getElementById("form2"); //��� �Է� ��
			var actionUrl = "/menu/updateComment.do"; //ȣ�� url 
			var submitParameter ="menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>&com_seq="+ f.com_seq.value +"&contents=" + f.contents.value; 
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
		f.contents.value= contents.replace(/<br>/g,"\n");  //��� ���� �����ֱ�
       	
		//��ư�� �����ϱ�
		document.getElementById("btnSave").value ="��� ����";
	
		//���� Ÿ������ ����
		commentSaveType = "B"; 
	
		//��� ���� ��� ��ư �����
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"Ȯ��\" onclick=\"saveComment()\" style=\"width: 100px; height: 40px;\"  class=\"btn btn-outline btn-success\">";
			tag += "<input type=\"button\" id=\"btnCancle\" value=\"���\" onclick=\"cancleComment()\" style=\"width: 100px; height: 40px;\"  class=\"btn btn-outline btn-danger\">";
		
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
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"��� ���\" onclick=\"saveComment()\" style=\"width: 100px; height: 83px;\" class=\"btn btn-outline btn-success\">";
		
		$("#btnCommentArea").html(tag);
		
	}
	
	//��� ���� �� ó��
	function viewResultUpdate(result) {
		
		
		//��ۼ����� �����̶��...
		if (result=="1"){

			//��� ���� ���� �ʱ�ȭ
			doCommentPageInit();

			commentSaveType = "A"; 
			
			//��� �������� �Էµ� ���� �ʱ�ȭ
			var f = document.getElementById("form2");
			f.com_seq.value= ""; //��� ��ȣ �ʱ�ȭ
			f.contents.value= ""; //��� ���� �ʱ�ȭ
			
			//��� ��� ��ư���� ����
			var tag  = "<input type=\"button\" id=\"btnSave\" value=\"��� ���\" style=\"width: 100px; height: 83px;\" onclick=\"saveComment()\" class=\"btn btn-outline btn-success\">";
			
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
			var actionUrl = "/menu/deleteComment.do"; //ȣ�� url 
			var submitParameter ="menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>&com_seq=" + com_seq; 
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
			var tag  = "<input type=\"button\" id=\"btnSave\" value=\"��� ���\" style=\"width: 100px; height: 83px;\" onclick=\"saveComment()\" class=\"btn btn-outline btn-success\">";
			
			$("#btnCommentArea").html(tag);
			
			
			
			
			//��� ��ȸ
			doCommList();
			
		}else{
			alert("��� ������ �����Ͽ����ϴ�.");	
		}
	}
	
		
</script>
</head>

<body onload="doOnload()">
	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">�޴� ����</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">�޴� ��</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">

								<form name="form1" id="form1" method="post">
								<input type="hidden" name="menu_seq"
										value="<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>" />
								<table class="table table-striped table-bordered table-hover" id="dataTables-example">
					  					<tr>
									        <td align="center" width="25%" height="50%"><img
											src="<%=CmmUtil.nvl(menuinfoDto.getFile_name())%>" width="220px" height="200px" /></td>
											<td><b><h3>
											<%=CmmUtil.nvl(menuinfoDto.getMenu_name())%></h3><br/>
										    <%=CmmUtil.nvl(menuinfoDto.getPrice(), "0") + "��"%><br/><br/>
                                            ���޴��Ұ�<pre><%=CmmUtil.nvl(menuinfoDto.getMenu_int())%></pre><br/><br/>
                                            ������������<pre><%=CmmUtil.nvl(menuinfoDto.getCountry_info())%></pre><br/><br/>
											</b></td>
									        </tr>
									     </table>
									     
									     </form>
							<p align="right">
									<input type="button" class="btn btn-outline btn-warning" value="����" onclick="doAction('U')" /> 
									<input type="button" class="btn btn-outline btn-danger" value="����" onclick="doAction('D')" />
									<input type="button" class="btn btn-outline btn-default" value="���" onclick="location.href='/menu/menuList.do'" />
								</p>

				    					
				    					
				    					
	    					<form name="form2" id="form2">
							<input type="hidden" name="com_seq">
							<h3>��۾���</h3>		
								
							<table class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
										<tr>
											<td colspan="2">
											
												<P>
													<textarea name="contents"  placeholder="������ �Է����ּ���." style="width: 800px; height: 80px;" class="form-control"></textarea>
												</P>
											</td>
											<td id="btnCommentArea"><input type="button" value="��۵��" id="btnSave" style="width: 100px; height: 83px;" class="btn btn-outline btn-success" onclick="saveComment()"></td>
										</tr>
							</thead>
							
							 <!--���⼭ ���� ���۽� ��� ����Ʈ  -->
							<tbody id="replyListArea">
							
							
							</tbody>			
									</table> 
									 
					
									
												
							
								</form>
	
	
							</div>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	<script
		src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
									    
  
				

</body>

</html>

