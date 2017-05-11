<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <title>���Ǫ��Ʈ��</title>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>

<script type="text/javascript">
/*
######################################## ###############
#	�Խñ� ������ ���� ����	
#######################################################
*/
var s=1;
//�ѹ��� ������ ��� ����
	if(window.innerHeight >= 700){
		var viewSize = 10; 
	}else{
		var viewSize = 5;
	}
var curViewSize = 0; //���� ��� ����
var varCommentListCnt = 0; //��� �� ����

//������ �Խñ� ����(��� �̾ ���)
var tag = "";

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
				alert('����: ' + actionUrl + '�� �������� �ʽ��ϴ�.');
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
//����ǰ� viewResult�� �ݹ�
	/* if (�º��̸� 1,11 ������̸� 1,6) */
	        if(window.innerHeight >= 700){
	xmlHttpPost("/fest/busiFestivalIndex.do","start_page=1&end_page=11", "viewResult");	
	        }else{
		xmlHttpPost("/fest/busiFestivalIndex.do","", "viewResult");	
	        }
}


//�Խù� ����Ʈ ��ȸ ��ó��
function viewResult(result) {
	
	var jsonObj = eval("("+ result +")");
	tag = "";
	//�迭����ŭ �ݺ��ϱ�
	for (var i=0;i<jsonObj.list.length;i++){
		//��ü�� ���� �ƴ϶��.....
		tag +="<div class='tb_section'>";
		tag +="   <span class='w31'>"+ s++ + "</span>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</span>";
		tag +=" <a href=\"busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"\">  ";
		tag +="   <span class='w31'>"+ jsonObj.list[i].Attractions + "</span></a>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].Nation + "</span>";
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
	 
	//�迭����ŭ �ݺ��ϱ�
	for (var i=0;i<jsonObj.list.length;i++){
		
		//��ü�� ���� �ƴ϶��.....
 	
		tag +="<div class='tb_section'>";
		tag +="   <span class='w31'>"+ s++ + "</span>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</span>";
		tag +=" <a href=\"busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"\">  ";
		tag +="   <span class='w31'>"+ jsonObj.list[i].Attractions + "</span></a>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].Nation + "</span></a>";
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
	var actionUrl = "/fest/busiFestivalIndex.do"; //ȣ�� url 
	var submitParameter ="start_page="+ start_page + "&end_page="+ end_page; 
	
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
        	<header><span><a href=/fest/busiFestlist.do>��������</a></span></header>
			<div class="section">
                <div class='tb_fs'>
                	<div class='tb_section ranking'>
                        <span class='w31'>��ȣ</span>
                        <span class='w31'>������</span>
                        <span class='w31'>������</span>
                        <span class='w31'>�̿밴</span>
                    </div>
                
            
                
                
                
                <ul class='tb_section ranking' id="replyListArea">
                
                
                
                </ul>
                </div>
                </div>
                
                        
                       
       
               
 
    <!-- join -->
    <!-- E: CONTENT -->
			
				<input id="btnMoreView" type="button" title="������" value="������" onclick="moreViewComment()" class="btn_white">

		</div>
        </div>
        

    <!-- S: FOOTER -->
     		<%@include file="/busiinc/appfooter.jsp"%>

    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
