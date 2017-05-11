<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>���Ǫ��Ʈ��</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">

   <script type="text/javascript">
   
   

   function doAction10() {
      var f = document.getElementById("f");
      if (f.title.value==""){
         alert("�������� ������ ���ε��Ͻñ� �ٶ��ϴ�.");
         f.title.focus();
         return;
      }
      if (f.contents.value==""){
         alert("������ ���ε��Ͻñ� �ٶ��ϴ�.");
         f.contents.focus();
         return
      }
      
      if (f.fileGRP.value==""){
         alert("�������� ������ ���ε��Ͻñ� �ٶ��ϴ�.");
         
         return
      } if (calBytes(f.title.value) > 100) {
           alert("������ �ִ� 100Bytes���� �Է� �����մϴ�.");
           f.title.focus();
           return;
        }

         if (calBytes(f.contents.value) > 4000) {
           alert("������ �ִ� 4000Bytes���� �Է� �����մϴ�.");
           f.contents.focus();
           return;
        }    
     
      
      f.submit();
   
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
   //���� ���ε�
   function doFileUpload() {

      var cw = screen.availWidth; //ȭ�� ����
      var ch = screen.availHeight; //ȭ�� ����

      var sw = 500; //��� â�� ����
      var sh = 400; //��� â�� ����

      var ml = (cw - sw) / 2; //��� �������� â�� x��ġ
      var mt = (ch - sh) / 2; //��� �������� â�� y��ġ

      window.open("/file/FileUploadSingPOP.do?jObj=fileGRP", "UPLOAD_POP",
            "width=" + sw + ",height=" + sh + ",top=" + mt + ",left=" + ml
                  + ",resizable=no,scrollbars=yes");
   }
   //�̹��� ÷�ΰ� �Ϸ�Ǹ� ����� �Լ�
   function doUploadOK() {

      alert("doUploadOK");
      var btnImg = document.getElementById("btnImg");

      btnImg.value = "���ε� �Ϸ�";
      btnImg.disabled;

   }
</script>
       
<%@include file="/busiinc/apptop.jsp" %>


</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
   <%@include file="/busiinc/appheader.jsp"%>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <%@include file="/busiinc/appmenu.jsp"%>
    <!-- join -->
    
    
     <form name="f" id="f" method="post" action="/hyg/busihygInsert.do">
    <div class="content" style="display:block;">
        <div class="content_wrapper">
           <header><span>������ ���</span></header>
         <div class="section">
                <!-- group -->
               <div class="input_row">
               <span class="input_box">
                  <label class="lbl" >����</label>
                  <input type="text" maxlength="50" placeholder="����" class="input_area" name="title" >
               </span>
            </div>
   
            <div class="group">
               <div class="input_row id_check">
                  <span class="input_box">
                     <label class="lbl">�̹���</label>
                  </span>   
               </div>
               <input type="hidden" name="fileGRP" id="fileGRP" /> 
               <input type="button"  id="btnImg" value="���" onclick="doFileUpload()" class="btn_small check white"/>
            </div>
                <!-- group -->
            <div class="input_content input_box" style="height:600px";>
                        <textarea name="contents" maxlength="2000"  placeholder="����" style="height:600px"   ></textarea>
            </div>
            </div>
        </div>
    </div>
    <div class="content wrapper50">
       <input type="button"  value="���" class="btn_half left" onclick="doAction10()">
       <input type="button"  value="���" class="btn_half left" onclick="location.href='/hyg/busiHygList.do'">
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
    