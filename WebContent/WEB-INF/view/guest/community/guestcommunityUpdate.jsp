<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CommunityDTO"%>
<%
	CommunityDTO communityDto = (CommunityDTO) request.getAttribute("communityDto");

	if (communityDto == null) {
		communityDto = new CommunityDTO();
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>라오푸드트럭</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">

<script type="text/javascript">
function doAction3(){
	var f = document.getElementById("f");
	
	
	if (f.title.value == "") {
		alert("제목을 입력하시길 바랍니다.");
		f.title.focus();
		return false;
	}

	if (f.contents.value == "") {
		alert("내용을 입력하시길 바랍니다.");
		f.contents.focus();
		return false;
	}
	if (calBytes(f.contents.value) > 4000) {
        alert("내용은 최대 4000Bytes까지 입력 가능합니다.");
        f.contents.focus();
        return;
     }   
     if (calBytes(f.title.value) > 100) {
         alert("제목은 최대 100Bytes까지 입력 가능합니다.");
         f.title.focus();
         return;
      }

    f.submit()
	return true;
}
function calBytes(str) {

	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;
	var onechar;
	
	for (i = 0; i < strCnt; i++) {
		onechar = tmpStr.charAt(i);
		if (escape(onechar).length > 4) {
			tcount += 2;
		} else {
			tcount += 1;
		}
	}
	return tcount;
}


function doFileUpload() {

	var cw = screen.availWidth; //화면 넓이
	var ch = screen.availHeight; //화면 높이

	var sw = 500; //띄울 창의 넓이
	var sh = 400; //띄울 창의 높이

	var ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
	var mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치

	window.open("/file/FileUploadSingPOP.do?jObj=fileGRP&vObj=doUploadOK",
			"UPLOAD_POP", "width=" + sw + ",height=" + sh + ",top=" + mt
					+ ",left=" + ml + ",resizable=no,scrollbars=yes");
}

//이미지 첨부가 완료되면 실행될 함수
function doUploadOK() {

	alert("doUploadOK");
	var btnImg = document.getElementById("btnImg");

	btnImg.value = "업로드 완료";
	btnImg.disabled;

}
</script>

<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
    <%@include file="/guestinc/appheader.jsp"%>
 	<!-- E: HEADER -->
	<%@include file="/guestinc/appmenu.jsp"%>
    <!-- S: CONTENT -->
    <!-- join -->
    
    <form name="f" id="f" method="post" action="guestupdate.do">
    <input type="hidden" name="fileGRP" id="fileGRP"  />
    	<%
		//저장된 파일의 파일그룹 아이디
								%>
    
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>고객 커뮤니티 수정</span></header>
			<div class="section">
                <!-- group -->
               <div class="input_row">
					<span class="input_box">
						<label class="lbl" >제목</label>
						<input type="text" placeholder="제목" name="title" class="input_area" maxlength="50"
					value="<%=CmmUtil.nvl(communityDto.getTitle())%>">
					</span>
				</div>
	
				<div class="group">
					<div class="input_row id_check">
						<span class="input_box">
							<label class="lbl">이미지</label>
						</span>	
					</div>
				
				<input type="button" title="첨부" id="fileGRP" value="수정" onclick="doFileUpload()" class="btn_small check white"/>
				</div>
                <!-- group -->
				<div class="input_content">
					<span class="input_box">
                        <textarea name="contents" maxlength="2000" ><%=CmmUtil.nvl(communityDto.getContents())%></textarea>
					</span>
				</div>
            </div>
        </div>
    </div>
    <div class="content wrapper50">
	    <input type="button" title="확인" value="확인"  onclick="doAction3()" class="btn_half left">
	    <input type="button" title="취소" value="취소"  onclick="location.href='guestcommunityList.do'" class="btn_half left">
    </div>
   <input type="hidden" name="cmt_seq" value="<%=CmmUtil.nvl(communityDto.getCmt_seq())%>">
    </form>
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
   <%@include file="/guestinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
<iframe name="ifrProc" style="display: none"></iframe>
</body>
</html>