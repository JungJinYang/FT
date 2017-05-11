<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@page import="java.util.List"%>
<%
	String month = "";
	
	String city = CmmUtil.nvl((String)request.getAttribute("city"));
	String local = CmmUtil.nvl((String)request.getAttribute("local"));
	String nation = CmmUtil.nvl((String)request.getAttribute("nation"));
	String pay = CmmUtil.nvl((String)request.getAttribute("pay"));
	String calender = CmmUtil.nvl((String)request.getAttribute("calender"));
	String cal = CmmUtil.nvl((String)request.getAttribute("cal"));
	
	String para = "city="+ city + "&local=" + local + "&nation=" + nation + "&pay=" + pay + "&calender=" + calender ;
%>
<html lang="en">
<head>


    <title>���Ǫ��Ʈ��</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
/*
#######################################################
#	�Խñ� ������ ���� ����	
#######################################################
*/
var s= 1;
	if(window.innerHeight >= 700) {
		var viewSize = 10 ;
	}else{
		var viewSize = 5; 

	}
var curViewSize = 0; //���� ��� ����
var varCommentListCnt = 0; //��� �� ����

//������ �Խñ� ����(��� �̾ ���)
var tag = "";
	// ����ȭ���� ranklist1.jsp  �Ķ���� ���Ѿ���� ���� rankcondition.jsp 
	//rankcondition.jsp �����س� �� ���ױ׿� ���� - > ranklist1.jsp �γѾ �������������� 
	//���۽� ȣ�� url�� ->/rank/rankbusi.do ������Ʈ�ѷ����� �Ķ���� ���� ���õǾ����. ����
	///rank/rankbusi.do���� ��Ʈ�ѷ����� return ���ִ°��� RanklistJSON.jsp 

/*
#######################################################
#	�Խñ� ������ ���� ��
#######################################################
*/

//�ε��� �ڵ�����
function doOnload(){
	doCommList();

}
//ajax ȣ��(����Ʈ ȣ��)
function xmlHttpPost(actionUrl,submitParameter, resultFunction) {
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
function doCommList(){
 if(window.innerHeight >= 700){
			xmlHttpPost("/rank/rankbusi.do","start_page=1&end_page=11&<%=para%>", "viewResult");	
 }else{
			xmlHttpPost("/rank/rankbusi.do","<%=para %>", "viewResult");	

 }
}


//�Խù� ����Ʈ ��ȸ ��ó��
function viewResult(result) {
	var jsonObj = eval("("+ result +")");
	tag = "";
	
	//�迭����ŭ �ݺ��ϱ�
	for (var i=0;i<jsonObj.list.length;i++){
		//��ü�� ���� �ƴ϶��.....
	/* 	tag +="   <li class='rank'>"+ s++ + "</li>";
		tag +="   <li class='location'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</li>";
		tag +=" <a href=\"/fest/busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"\">  ";
		tag +="   <li class='date'>"+ jsonObj.list[i].Attractions + "</li></a>";
		tag +="   <li class='location'>"+ jsonObj.list[i].Calender + "&nbsp �� </li><br/>";
 */
		 tag +="<div class='tb_section'>";
	      tag +="   <span class='w33'>"+ s++ + "</span>";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</span>";
	      tag +=" <a href=\"/fest/busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"&cal=<%=cal%>"+"\">  ";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].Attractions + "</span></a>";
	      tag +="   <span class='w32'>"+ jsonObj.list[i].Calender + "&nbsp �� </span>";
	      tag +=" </div>" 
	}

	$("#replyListArea").html(tag);
	
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
		
		//��ü�� ���� �ƴ϶��.....
		 tag +="<div class='tb_section'>";
	      tag +="   <span class='w33'>"+ s++ + "</span>";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</span>";
	      tag +=" <a href=\"/fest/busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"&cal=<%=cal%>"+"\">  ";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].Attractions + "</span></a>";
	      tag +="   <span class='w32'>"+ jsonObj.list[i].Calender + "&nbsp �� </span>";
	      tag +=" </div>" 
		
	}
	
	$("#replyListArea").html(tag);
	


	varCommentListCnt = jsonObj.listCnt;

	curViewSize += jsonObj.list.length; //���� �Խñ� ���� ������Ʈ
	
	displayBtnMoreView();
	
}

//��� ������(��ܿ� ����� ������ŭ ������ ��� ���� ����)
function moreViewComment(){

	var start_page = parseInt(curViewSize) + 1; 
	var end_page = parseInt(curViewSize) + parseInt(viewSize) + 1;
	
	var actionUrl = "/rank/rankbusi.do"; //ȣ�� url 
	var submitParameter ="start_page="+ start_page + "&end_page="+ end_page+"&<%=para%>"; 
	
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
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span><a href=/busi/rankcondition.do>���ռ��� ����(����)</a></span></header>
			<div class="section">
                <div class='tb_fs'>
                    <div class='tb_section ranking'>
                       <div class='tb_section'>
                        <span class='w33' ><b>��ȣ</b></span>
                        <span class='w31'><b>������</b></span>
                        <span class='w31'><b>���� ������</b></span>
                        <span class='w32'><b><%
													if (calender.equals("jan")) {
														month = "1��";
														out.print(month);
													} else if (calender.equals("feb")) {
														month = "2��";
														out.print(month);
													} else if (calender.equals("mar")) {
														month = "3��";
														out.print(month);
													} else if (calender.equals("apr")) {
														month = "4��";
														out.print(month);
													} else if (calender.equals("may")) {
														month = "5��";
														out.print(month);
													} else if (calender.equals("jun")) {
														month = "6��";
														out.print(month);
													} else if (calender.equals("jul")) {
														month = "7��";
														out.print(month);
													} else if (calender.equals("aug")) {
														month = "8��";
														out.print(month);
													} else if (calender.equals("sep")) {
														month = "9��";
														out.print(month);
													} else if (calender.equals("oct")) {
														month = "10��";
														out.print(month);
													} else if (calender.equals("nov")) {
														month = "11��";
														out.print(month);
													} else {
														month = "12��";
														out.print(month);
													}
												
											%>&nbsp;(�̿밴)</b></span>
										</div>
                    </div>
                     <!-- list -->
                <ul class='tb_section ranking' id="replyListArea">                   
              
              
              
              
              
                </ul>
			
			
			
			
                <!-- list -->
                 
                </div>
            </div>
            <!-- navigator -->
				<input id="btnMoreView" type="button" title="������" value="������" onclick="moreViewComment()" class="btn_white">
                
    

            <!-- navigator -->
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
