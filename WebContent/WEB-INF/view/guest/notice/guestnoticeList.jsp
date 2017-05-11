<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.NoticeDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="ac.kr.ft.com.dto.NoticeComDTO"%>


<%
	List<NoticeDTO> rList = (List<NoticeDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<NoticeDTO>();

	}

	String searchBox = (String) request.getAttribute("searchBox");
	String searchText = (String) request.getAttribute("searchText");
	String searchParameter = "";

	if (searchText != null && searchBox != null) {
		searchParameter = "searchBox=" + searchBox + "&searchText=" + searchText;
	}

	System.out.println(searchParameter);
%>

<!DOCTYPE html>
<html lang="ko">
<head>

<title>���Ǫ��Ʈ��</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-

scalable=0">

<link rel="stylesheet" href="/css/style.css?ver=2">
<script src="/bower_components/jquery/dist/jquery.min.js"></script>

<script type="text/javascript">
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

		xmlHttpPost("/notice/guestNoticeIndex.do", searchParameter,
				"viewResult");

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
			tag += "   <span class='w70'><span class='title ep'>";
			tag += "    <a href=\"guestnoticeDetail.do?notice_seq="+ jsonObj.list[i].NOTICE_SEQ + "\">";
			tag += "     " + jsonObj.list[i].TITLE + "</span></a><br/>";
			tag += "      <span class='desc'>" + jsonObj.list[i].USER_NAME+ "&nbsp;&nbsp;"+"<b>|</b>"+"&nbsp;&nbsp;";
			tag += "     " + jsonObj.list[i].REG_DT + "&nbsp;"+" | "+"&nbsp;";
			tag += "      ��ȸ" + jsonObj.list[i].READ_CNT + "</span></span>";
			tag += "     <div class=\"icon icon-comment\"><span>";
			if(jsonObj.list[i].CNT==""){
				tag+= "0";
			}else{
				tag+=jsonObj.list[i].CNT;
			}
			tag += "</span></div>";
			tag += "</li>";

		}

		$("#replyListArea").html(tag);

		varCommentListCnt = jsonObj.listCnt;

		curViewSize = jsonObj.list.length; //���� ����Ʈ ���� ������Ʈ

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
			tag += "   <span class='w70'><span class='title ep'>";
			tag += "    <a href=\"guestnoticeDetail.do?notice_seq="+ jsonObj.list[i].NOTICE_SEQ + "\">";
			tag += "     " + jsonObj.list[i].TITLE + "</span></a><br/>";
			tag += "      <span class='desc'>" + jsonObj.list[i].USER_NAME+ "&nbsp;&nbsp;"+"<b>|</b>"+"&nbsp;&nbsp;";
			tag += "     " + jsonObj.list[i].REG_DT + "&nbsp;"+" | "+"&nbsp;";
			tag += "      ��ȸ" + jsonObj.list[i].READ_CNT + "</span></span>";
			tag += "     <div class=\"icon icon-comment\"><span>";
			if(jsonObj.list[i].CNT==""){
				tag+= "0";
			}else{
				tag+=jsonObj.list[i].CNT;
			}
			tag += "</span></div>";
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

		var actionUrl = "/notice/guestNoticeIndex.do"; //ȣ�� url 

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

	//���ȭ�� �̵�
	function doReg() {
		location.href = "/notice/guestnoticeForm.do";

	}
</script>

<script type="text/javascript">
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
					<span>��������</span>

				</header>
				<form id="search" name="search" method="post"
					action="/notice/guestnoticeList.do">
					<!-- group -->
					<div class="group">
						<div id="search">
						 <div class="input_select phone w25">
                           		<select id="searchBox" name="searchBox">
                              		<option value="">����</option>
                              		<option value="TITLE" >����</option>
                              		<option value="CONTENTS">����</option>
                           		</select>
                        	</div>
							<div class="input_row w45">
								<span class="input_box"> <input type="text"
									id="searchText" name="searchText" placeholder="���� / ����"
									class="input_email" value=''>
								</span>
							</div>
							<input type="button" title="�˻�" value="�˻�"
								class="btn_small w10 inline" onclick="doSearchForm()" />
						</div>
					</div>
				</form>
				<div class='board_desc'>
					<h3>
						<strong>�湮�� �̻� �бⰡ ������ �Խ����Դϴ�.</strong>
					</h3>
				</div>
				<form id="f" name="f" action="busideleteCheck.do" method="post">
					<ul class='member'>
					</ul>
					<!-- list -->
					<ul class='board' id="replyListArea">

					</ul>


					<input id="btnMoreView" type="button" title="������" value="������"
						onclick="moreViewComment()" class="btn_white">
					<!-- list -->


				</form>
			</div>
		</div>
		<!-- login -->


		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>