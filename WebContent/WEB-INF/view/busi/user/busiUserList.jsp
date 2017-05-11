<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%

	List<UserDTO> rList = (List<UserDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<UserDTO>();
	}
	String searchBox = (String) request.getAttribute("searchBox");
	String searchText = (String) request.getAttribute("searchText");
	String searchParameter = "";
	
	if(searchText != null && searchBox != null){
		searchParameter = "searchBox=" + searchBox + "&searchText=" + searchText;
	}
	
	System.out.println(searchParameter);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>���Ǫ��Ʈ��</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	/*
	 #######################################################
	 #	�Խñ� ������ ���� ����	
	 #######################################################
	 */
	var viewSize = 5; //�ѹ��� ������ ��� ����
	var curViewSize = 0; //���� ��� ����
	var varCommentListCnt = 0; //��� �� ����
	var searchParameter = "<%=searchParameter %>"; 
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
		xmlHttpPost("/user/busiUserIndex.do",searchParameter , "viewResult");

	}
	//�Խù� ����Ʈ ��ȸ ��ó��
	function viewResult(result) {
		var jsonObj = eval("(" + result + ")");
		tag = "";

		//�迭����ŭ �ݺ��ϱ�
		for (var i = 0; i < jsonObj.list.length; i++) {

			//��ü�� ���� �ƴ϶��.....

			tag += "<li>";
			tag += "<input type=\"checkbox\" name=\"del_chk\" value=\""+ jsonObj.list[i].USER_NO +"\">";
			tag += "   <span class='w80' ><span>";
			tag += "    <a href=\"busiUserDetail.do?user_no="
					+ jsonObj.list[i].USER_NO + "\">";
			tag += "     " + jsonObj.list[i].USER_NAME + "</span><br/>";
			tag += "      		" + jsonObj.list[i].EMAIL1 + "@";
			tag += "     " + jsonObj.list[i].EMAIL2 + "</a></span>";
			tag += "</li>";
		}

		// 	  <li><input type='checkbox'/><span class='w80'><span>������</span><br/>gimini@gmail.com</span></li>

		$("#reply").html(tag);

		varCommentListCnt = jsonObj.listCnt;

		curViewSize = jsonObj.list.length; //���� ��� ���� ������Ʈ

		displayBtnMoreView();

	}

	//����Ʈ ������ ��ȸ ��ó��
	function viewResultMoreView(result) {

		var jsonObj = eval("(" + result + ")");

		//alert(tag);
		//�迭����ŭ �ݺ��ϱ�
		for (var i = 0; i < jsonObj.list.length; i++) {

			//��ü�� ���� �ƴ϶��.....
			tag += "<li>";
			tag += "<input type=\"checkbox\" name=\"del_chk\" value=\""+ jsonObj.list[i].USER_NO +"\">";
			tag += "   <span class='w80' ><span>";
			tag += "    <a href=\"busiUserDetail.do?user_no="
					+ jsonObj.list[i].USER_NO + "\">";
			tag += "     " + jsonObj.list[i].USER_NAME + "</span><br/>";
			tag += "      		" + jsonObj.list[i].EMAIL1 + "@";
			tag += "     " + jsonObj.list[i].EMAIL2 + "</a></span>";
			tag += "</li>";
		}

		$("#reply").html(tag);

		varCommentListCnt = jsonObj.listCnt;

		curViewSize += jsonObj.list.length; //���� �Խñ� ���� ������Ʈ

		displayBtnMoreView();

	}

	//����Ʈ ������(��ܿ� ����� ������ŭ ������ ����Ʈ ���� ����)
	function moreViewComment() {

		var start_page = parseInt(curViewSize) + 1;
		var end_page = parseInt(curViewSize) + parseInt(viewSize) + 1;

		var actionUrl = "/user/busiUserIndex.do"; //ȣ�� url 

		var submitParameter = "start_page=" + start_page + "&end_page="	+ end_page;

		var resultFunction = "viewResultMoreView"; //������ ������ �Լ���

		xmlHttpPost(actionUrl, submitParameter + "&" + searchParameter, resultFunction);

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

	/*
	 #######################################################
	 #	������ ��	
	 #######################################################
	 */

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
	
	function doSearchForm() {
		var search = document.getElementById("search");
		search.submit();
	}
	//�˻� ��ũ��Ʈ

	/* function fn_search() {
		if (jQuery("#searchS").val() == "") {
			return;
		} else {
			jQuery("input[name=searchFiled]").val(jQuery("#searchS").val());
		}
		var searchValue = jQuery("#searchI").val();
		jQuery("input[name=searchValue]").val(searchValue);

		jQuery("form[name=f]").attr("method", "post");
		jQuery("form[name=f]").attr("action", "").submit();
	} */
</script>
<%@include file="/busiinc/apptop.jsp"%>
</head>
<body onload="doOnload()">
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/busiinc/appheader.jsp"%>
		<!-- E: HEADER -->

		<!-- S: CONTENT -->
		<%@include file="/busiinc/appmenu.jsp"%>
		<!-- login -->
		<div class="content" style='display: block;'>
			<div class="content_wrapper">
				<header>
					<span>ȸ������Ʈ</span>
				</header>

				<!-- 				<input type="hidden" name="searchFiled" -->
				<%-- 					value="${search.searchFiled }" /> --%>
				<!-- 				//�˻����� -->
				<!-- 				<input type="hidden" name="searchValue" -->
				<%-- 					value="${search.searchValue }" /> --%>
				<!-- //�˻��� -->
				<!-- //�˻��� -->
				<form id="search" name="search" method="post" action="/user/busiUserList.do">
					<div class='section'>
						<!-- group -->
						<div class="group">
							<div id="search">
								<div class="input_select phone w20">
									<select id="searchBox" name="searchBox">
										<option value="">����</option>
										<option value="USER_NAME" >�̸�</option>
										<option value="USER_ID">���̵�</option>
									</select>
								</div>
								<div class="input_row w50">
									<span class="input_box"> <input type="text" id="searchText" name="searchText" placeholder="�̸� / ���̵�"
										class="input_email" value=''>
									</span>
								</div>
								<input type="button" title="�˻�" value="�˻�"
									class="btn_small w10 inline" onclick="doSearchForm()"/>
							</div>
						</div>
					</div>
				</form>
				<form id="f" name="f" method="post" action="busiDeleteCheck.do">
					<!-- group -->
					<!-- list -->
					<ul class='member'>
						<li class='list_head'><input type="checkbox" name="all"
							onclick="checkboxChange(this.form, this)" /> <span>��ü����</span> <a
							href='#' class="icon-trash">
						</a></li>
						<!-- list -->
					</ul>
					<ul class='board' id="reply">
					</ul>
					<!-- //�˻��� -->
					<!-- group -->
					<!-- list -->
				</form>
					<input type="button" title="����" value="����"
					onclick="userdel_check()" class="btn_global">

				<input id="btnMoreView" type="button" title="������" value="������"
					onclick="moreViewComment()" class="btn_white">
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