<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		xmlHttpPost("/sales/busiSalesList.do","start_page=1&end_page=11", "viewResult");
		
	}else{
		xmlHttpPost("/sales/busiSalesList.do","1=1", "viewResult");
		
	}
	
}

//�Խù� ����Ʈ ��ȸ ��ó��
function viewResult(result) {
	var jsonObj = eval("("+ result +")");
	tag = "";
	
	//�迭����ŭ �ݺ��ϱ�
	for (var i=0;i<jsonObj.list.length;i++){
		tag +="<div class='tb_section'>";
		tag +="   <span class='w31'>"+ s++ + "</span>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].SALES_NM + "</span>";
		tag +="   <a href=\"/sales/busiSalesDetail.do?sales_cd="+ jsonObj.list[i].SALES_CD +"&cal=<%=CmmUtil.nvl(request.getParameter("cal"))%>\">  ";
		tag +="   <span class='w31'>"+ jsonObj.list[i].ST_CD2 + "</span></a>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].ST_CD1 + "</span>";
		tag +="</div>" 
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
		tag +="   <span class='w31'>"+ s++ + "</span>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].SALES_NM + "</span>";
		tag +="   <a href=\"/sales/busiSalesDetail.do?sales_cd="+ jsonObj.list[i].SALES_CD +"&cal=<%=CmmUtil.nvl(request.getParameter("cal"))%>\">  ";
		tag +="   <span class='w31'>"+ jsonObj.list[i].ST_CD2 + "</span></a>";
		tag +="   <span class='w31'>"+ jsonObj.list[i].ST_CD1 + "</span>";
		tag +="</div>" 
		
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
	
	var actionUrl = "/sales/busiSalesList.do"; //ȣ�� url 
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
        	<header><span><a href=/busi/rankcondition.do>���ռ��� ����(���)</a></span></header>
			<div class="section">
                <div class='tb_fs'>
                    <div class='tb_section ranking'>
                    <div class='tb_section'>
                        <span class='w31' ><b>����</b></span>
                        <span class='w31'><b>���θ�</b></span>
                        <span class='w31'><b>Ȱ����</b></span>
                        <span class='w31'><b>����</b></span>
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
