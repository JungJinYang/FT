<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>
<%
	List<CtrDTO> rList = (List<CtrDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<CtrDTO>();
	}
	String searchBox = (String) request.getAttribute("searchBox");
	String searchText = (String) request.getAttribute("searchText");
	String searchParameter = "";

	if (searchText != null && searchBox != null) {
		searchParameter = "searchBox=" + searchBox + "&searchText=" + searchText;
	}

	System.out.println(searchParameter);

	/* 	String auth = (String)request.getSession().getAttribute("AUTH");
		if (auth == null){
			auth = "";
		} */
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>���Ǫ��Ʈ��</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	function userReg() {
		location.href = "/ctr/GuestctrRegform.do";
	}
	//��ü ���� ����
	function checkboxChange(f, cObj) {

		var cbox = document.getElementsByName("del_chk");

		//��ü ������ ���
		if (cObj.checked) {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = true;

			}

			//��ü ���������� ���
		} else {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = false;

			}
		}
	}

	function checkcheck() {
		var check = document.f.del_chk;
		if (check.length >= 1) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					return true;
				}
			}
		}
		alert("�ϳ� �̻� üũ���ֽñ� �ٶ��ϴ�.");
		return false;
	}

	function userupdate_check() {
		var checked = false;
		var check = document.getElementsByName("del_chk");
		var f = document.getElementById("f");

		if (check.length) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					checked = true;
					break; //�ϳ��� ���õ� ���� �ִٸ�, ��� for�� �� �ʿ� ����
				}
			}
		}

		if (checked) {
			if (confirm("�����Ѱ��� �����Ͻðڽ��ϱ�?")) {
				f.action = "/ctr/GuestupdateCheck.do";
				f.submit(); //�� submit;
			}

		} else {
			alert("�ϳ��� ���õ� ���� �����ϴ�.");

		}
	}
	
	/* �Խ�Ʈ�� �����Ȳ ���� ���ϰ� ���Ҿ� �� Ȯ���ϰ� �ȵǸ� ��¥ ����� 1022 */

	function disableCheck(obj) {
	    if (obj[obj.selectedIndex].className=='disabled') {
	        alert("�����Ͻ� ������ �����ϴ�");
	        for (var i=0; obj[i].className=="disabled"; i++); obj.selectedIndex = i; return;
	    }
	}
	
	function userdel_check() {
		var checked = false; //üũ ���� Ȯ�� ����
		var check = document.getElementsByName("del_chk");

		var f = document.getElementById("f"); //����ü

		if (check.length) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					checked = true;
					break; //�ϳ��� ���õ� ���� �ִٸ�, ��� for�� �� �ʿ� ����
				}
			}
		}

		//���õ� �׸��� �ִٸ�..
		if (checked) {
			if (confirm("�����Ѱ��� �����Ͻðڽ��ϱ�?")) {
				f.submit(); //�� submit;
			}

		} else {
			alert("�ϳ��� ���õ� ���� �����ϴ�.");

		}
	}

	/*
	#######################################################
	#	�Խñ� ������ ���� ����	
	#######################################################
	 */
	var viewSize = 5; //�ѹ��� ������ ����Ʈ ����
	var curViewSize = 0; //���� ����Ʈ ����
	var varCommentListCnt = 0; //����Ʈ �� ����
	var searchParameter = "<%=searchParameter%>";
	//������ �Խñ� ����(��� �̾ ���)
	var tag = "";

	/*
	#######################################################
	#	�Խñ� ������ ���� ��
	#######################################################
	 */

	//�ε��� �ڵ�����
	function doOnload() {
		doCommList();

	}

	//ajax ȣ��(����Ʈ ȣ��)
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

	//�Խñ� ����Ʈ ��ȸ�ϱ�
	function doCommList() {

		xmlHttpPost("/ctr/GuestCtrIndex.do", searchParameter, "viewResult");

	}

	//�Խù� ����Ʈ ��ȸ ��ó��
	function viewResult(result) {
		//alert(result);
		var jsonObj = eval("(" + result + ")");
		tag = "";
		//�迭����ŭ �ݺ��ϱ�
		for (var i = 0; i < jsonObj.list.length; i++) {
			//��ü�� ���� �ƴ϶��.....
			
			tag += "<li>";
			/* tag += "<input type='checkbox' name='del_chk' value=\"" + jsonObj.list[i].CTR_SEQ + "\">"; */
			
			tag += "   <span class='w80'>";
			tag += "   <span class='title ep'>";
			tag += "    <a href=\"GuestctrDetail.do?ctr_seq=" + jsonObj.list[i].CTR_SEQ + "\">";
			tag += "     " + jsonObj.list[i].TITLE + "</span></a><br/>";
			tag += "     " + jsonObj.list[i].USER_NAME + "&nbsp;|";
			tag += "     " + jsonObj.list[i].REG_DT + "";
			
			tag += "     <div class='select_status'>";
			tag += "<select class='status' onChange='disableCheck(this)' name='pro_"+jsonObj.list[i].CTR_SEQ+"' id='auth_"+ jsonObj.list[i].CTR_SEQ +"'>";
			if (jsonObj.list[i].PROGRESS == "R") {
				tag += "<option value='R'>��û</option>";
				tag += "<option value='RS' class=disabled >�����Ϸ�</option>";
				tag += "<option value='P' class=disabled>������</option>";
				tag += "<option value='TS' class=disabled>�ŷ��Ϸ�</option>";
			} else if (jsonObj.list[i].PROGRESS == "RS") {
				tag += "<option value='RS'>�����Ϸ�</option>";
				tag += "<option value='R' class=disabled>��û</option>";
				tag += "<option value='P' class=disabled>������</option>";
				tag += "<option value='TS' class=disabled>�ŷ��Ϸ�</option>";
			} else if (jsonObj.list[i].PROGRESS == "P") {
				tag += "<option value='P'>������</option>";
				tag += "<option value='R' class=disabled>��û</option>";
				tag += "<option value='RS' class=disabled>�����Ϸ�</option>";
				tag += "<option value='TS' class=disabled>�ŷ��Ϸ�</option>";
			} else if (jsonObj.list[i].PROGRESS == "TS") {
				tag += "<option value='TS'>�ŷ��Ϸ�</option>";
				tag += "<option value='R' class=disabled>��û</option>";
				tag += "<option value='RS' class=disabled>�����Ϸ�</option>";
				tag += "<option value='P' class=disabled>������</option>";
			}
			tag += "</select>";
			tag += "</div>";
			tag += "</span>";
			tag += "</span>";
			tag += "</li>";
		
		}

		$("#replyListArea").html(tag);

		//alert(jsonObj.listCnt);
		varCommentListCnt = jsonObj.listCnt;

		//alert(jsonObj.list.length);
		curViewSize = jsonObj.list.length; //���� ����Ʈ ���� ������Ʈ

		displayBtnMoreView();

	}

	//����Ʈ ������ ��ȸ ��ó��
	function viewResultMoreView(result) {
		//alert(result);

		var jsonObj = eval("(" + result + ")");

		//alert(tag);
		//�迭����ŭ �ݺ��ϱ�
		for (var i = 0; i < jsonObj.list.length; i++) {

			tag += "<li>";
			/* tag += "<input type='checkbox' name='del_chk' value=\"" + jsonObj.list[i].CTR_SEQ + "\">"; */
			
			tag += "   <span class='w80'>";
			tag += "   <span class='title ep'>";
			tag += "    <a href=\"BusictrDetail.do?ctr_seq=" + jsonObj.list[i].CTR_SEQ + "\">";
			tag += "     " + jsonObj.list[i].TITLE + "</span></a><br/>";
			tag += "     " + jsonObj.list[i].USER_NAME + "&nbsp;|";
			tag += "     " + jsonObj.list[i].REG_DT + "";
			
			tag += "     <div class='select_status'>";
			tag += "<select class='status' onChange='disableCheck(this)' name='pro_"+jsonObj.list[i].CTR_SEQ+"' id='auth_"+ jsonObj.list[i].CTR_SEQ +"'>";
			if (jsonObj.list[i].PROGRESS == "R") {
				tag += "<option value='R'>��û</option>";
				tag += "<option value='RS' class=disabled >�����Ϸ�</option>";
				tag += "<option value='P' class=disabled>������</option>";
				tag += "<option value='TS' class=disabled>�ŷ��Ϸ�</option>";
			} else if (jsonObj.list[i].PROGRESS == "RS") {
				tag += "<option value='RS'>�����Ϸ�</option>";
				tag += "<option value='R' class=disabled>��û</option>";
				tag += "<option value='P' class=disabled>������</option>";
				tag += "<option value='TS' class=disabled>�ŷ��Ϸ�</option>";
			} else if (jsonObj.list[i].PROGRESS == "P") {
				tag += "<option value='P'>������</option>";
				tag += "<option value='R' class=disabled>��û</option>";
				tag += "<option value='RS' class=disabled>�����Ϸ�</option>";
				tag += "<option value='TS' class=disabled>�ŷ��Ϸ�</option>";
			} else if (jsonObj.list[i].PROGRESS == "TS") {
				tag += "<option value='TS'>�ŷ��Ϸ�</option>";
				tag += "<option value='R' class=disabled>��û</option>";
				tag += "<option value='RS' class=disabled>�����Ϸ�</option>";
				tag += "<option value='P' class=disabled>������</option>";
			}
			tag += "</select>";
			tag += "</div>";
			tag += "</span>";
			tag += "</span>";
			tag += "</li>";

		}

		$("#replyListArea").html(tag);

		varCommentListCnt = jsonObj.listCnt;

		curViewSize += jsonObj.list.length; //���� �Խñ� ���� ������Ʈ

		displayBtnMoreView();

	}

	//����Ʈ ������(��ܿ� ����� ������ŭ ������ ����Ʈ ���� ����)
	function moreViewComment() {

		var start_page = parseInt(curViewSize) + 1;
		var end_page = parseInt(curViewSize) + parseInt(viewSize) + 1;

		var actionUrl = "/ctr/GuestCtrIndex.do"; //ȣ�� url 

		var submitParameter = "start_page=" + start_page + "&end_page="
				+ end_page;

		var resultFunction = "viewResultMoreView"; //������ ������ �Լ���

		xmlHttpPost(actionUrl, submitParameter + "&" + searchParameter,
				resultFunction);

	}

	function displayBtnMoreView() {

		//alert("curViewSize : "+ curViewSize + "|| varCommentListCnt :  "+ varCommentListCnt);
		//���� ����Ʈ ���� ����Ʈ �� ������ �۴ٸ�, ������ ������
		if (curViewSize < varCommentListCnt) {

			document.getElementById("btnMoreView").style.display = "";

		} else {

			document.getElementById("btnMoreView").style.display = "none";

		}

	}
	function doSearchForm() {
		var search = document.getElementById("search");
		search.submit();
	}
</script>
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body onload="doOnload()">
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
		<!-- S: CONTENT -->
		

		<!-- login -->
		<div class="content" style='display: block;'>
			<div class="content_wrapper">
				<header>
					<span>�����͸� ��㹮��</span>
				</header>
				<form id="search" name="search" method="post" action="/ctr/GuestctrList.do">
					<div class='section'>
						<!-- group -->
						<div class="group">
							<div id="search">
								<div class="input_select phone w25"> 
									<select id="searchBox" name="searchBox">
										<option value="">����</option>
										<option value="TITLE" >����</option>
										<option value="USER_ID">���̵�</option>
									</select>
								</div>
								<div class="input_row w45">
									<span class="input_box"> <input type="text" id="searchText" name="searchText" placeholder="���� / ���̵�"
										class="input_email" value=''>
									</span>
								</div>
								<input type="button" title="�˻�" value="�˻�"
									class="btn_small w10 inline" onclick="doSearchForm()"/>
							</div>
						</div>
					</div>
				</form>
				<form name="f" id="f" method="post"
					action="GuestdeleteAllCheckList.do">
					<div class='section'>
						<!-- group -->
						
						<!-- group -->
						<!-- list -->
<!-- 						<ul class='member book'> -->
<!-- 							<li class='list_head'><input type="checkbox" name="all" -->
<!-- 								onclick="checkboxChange(this.form, this)" /><span>��ü����</span></li> -->
<!-- 						</ul> -->
						<ul id="replyListArea" class='member book'>
						</ul>
						<!-- ������ �� -->
						<!-- list -->

						</select>
						<div class='wrapper50'>

							<%-- <%if(auth.equals("A") || auth.equals("P")) {%>
							<button type="button" value="�۾���" onclick="userReg()"
								align="left" class="btn_tri">�۾���</button>
							<button type="button" value="����" onclick="userupdate_check()"
								align="center" class="btn_tri">����</button>
							<input type="button" value="����" onclick="userdel_check()"
								align="right" class="btn_tri">
						<%}else if(auth.equals("U")) { %> --%>
							<button type="button" value="�۾���" onclick="userReg()"
								align="left" class="btn_global">�۾���</button>
							<%-- 	<%} %> --%>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- login -->



		<input id="btnMoreView" type="button" title="������" value="������"
			onclick="moreViewComment()" class="btn_white">
		<!-- list -->
		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
