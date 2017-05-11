<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>    
<%
FestivalDTO festivalDTO = (FestivalDTO)request.getAttribute("festivalDTO"); 

if (festivalDTO==null){
   festivalDTO = new FestivalDTO();
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

    <title>�����������</title>

   <%@include file="/inc/top.jsp" %>

<!-- �߰��� ������ -->
   <script type="text/javascript">
   
   var SetComma = function(str) {

       var regMustNumberComma = /^[\t|0-9|,]+$/;
       str = str.replace(/,/g,'');

       var retValue = "";
           for( i = 1; i <= str.length; i++ ) {
               if( i > 1 && (i%3) == 1 )
                   retValue = str.charAt(str.length - i) + "," + retValue;
               else
                   retValue = str.charAt(str.length - i) + retValue;
           }
        
           if( regMustNumberComma.test(retValue) == false ) {
               alert("���ڸ� �Է��Ͻ� �� �ֽ��ϴ�.");
               return "";
           }
           return retValue;

   }
   var SetComma1 = function(str) {

       var regMustNumberComma = /^[\t|0-9]+$/;
       str = str.replace(/,/g,'');

       var retValue = "";
           for( i = 1; i <= str.length; i++ ) {
               if( i > 1 && (i%3) == 1 )
                   retValue = str.charAt(str.length - i) + retValue;
               else
                   retValue = str.charAt(str.length - i) + retValue;
           }
        
           if( regMustNumberComma.test(retValue) == false ) {
               alert("���ڸ� �Է��Ͻ� �� �ֽ��ϴ�.");
               return "";
           }
           return retValue;

   }
   
   
   
   function doAction() {
      var f = document.getElementById("f");

      if (f.menu_name.value == "") {
         alert("�޴��̸��� �Է��Ͻñ� �ٶ��ϴ�.");
         f.menu_name.focus();
         return;
      }
      if (f.price.value == "") {
         alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
         f.price.focus();
         return;
      }
      if (f.menu_int.value == "") {
         alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
         f.menu_int.focus();
         return;
      }
      if (f.country_info.value == "") {
         alert("�������� �Է��Ͻñ� �ٶ��ϴ�.");
         f.country_info.focus();
         return;
      }
      if (f.fileGRP.value == "") {
         alert("�޴� ������ ���ε��Ͻñ� �ٶ��ϴ�.");
         return;
      }

      f.target = "ifrProc";
      f.submit();
   
   
   
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

      var btnImg = document.getElementById("btnImg");

      btnImg.value = "���ε� �Ϸ�";
      btnImg.disabled;

   }
   
   
   
   
   </script>
   
</head>

<body>

    <div id="wrapper">

   <%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">����������� ����</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">�����������
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
 
                        <form name="f" id="f" method="post" action="/fest/festInsert.do" onsubmit="return doAction(this)">
                           <table align="center" style="width: 100%" border="1"
                              class="table table-striped table-bordered table-hover">
                              <tr>
                                 <td align="center"><b>��,��</b></td>
                                 <td colspan="3"><input type="text" name="city" maxlength="10" class="form-control"/></td>
                                 <td align="center"><b>��,��,��</b></td>
                                 <td colspan="3"><input type="text" name="local" maxlength="10" class="form-control"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>������</b></td>
                                 <td colspan="7"><input type="text" name="attractions"  maxlength="25" class="form-control"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>����� ����</b></td>
                                 <td colspan="3"><input type="text" name="pay" maxlength="2" class="form-control"/></td>
                                 <td align="center"><b>�̿밴</b></td>
                                 <td colspan="3"><input type="text" name="nation" maxlength="3"class="form-control"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>1��</b></td>
                                 <td><input type="text" name="jan" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>2��</b></td>
                                 <td><input type="text" name="feb" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>3��</b></td>
                                 <td><input type="text" name="mar" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>4��</b></td>
                                 <td><input type="text" name="apr" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                              </tr>
                              <tr>

                                 <td align="center"><b>5��</b></td>
                                 <td><input type="text" name="may" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>6��</b></td>
                                 <td><input type="text" name="jun" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>7��</b></td>
                                 <td><input type="text" name="jul" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>8��</b></td>
                                 <td><input type="text" name="aug" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                              </tr>
                              <tr>
                                 <td align="center"><b>9��</b></td>
                                 <td><input type="text" name="sep" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>10��</b></td>
                                 <td><input type="text" name="oct" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>11��</b></td>
                                 <td><input type="text" name="nov" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>12��</b></td>
                                 <td><input type="text" name="dec" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b>���� ����</b></td>
                                 <td colspan="7" height="100px"><input type="hidden" name="fileGRP" id="fileGRP"/> 
                                 <input type="button" id="btnImg" value="���" onclick="doFileUpload()" />
</td>
                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b><br/>��������</b></td>
                                 <td align="center" colspan="7" height="100px" maxlength="2000"><textarea name="fst_exp" rows="20" cols="100" style="overflow:auto" class="form-control"></textarea> </td>
                              </tr>
                              <tr>
                                 <td align="center"><b>������ ���μ�</b></td>
                                 <td colspan="3"><input type="text" name="fst_host" maxlength="80" class="form-control"/></td>
                                 <td align="center"><b>����� ����ó</b></td>
                                 <td colspan="3">
                                 <input style="width:100px" type="text" name="hostph_1" maxlength="3" class="form-control" onkeyup="this.value=SetComma1(this.value)"/><b> - </b>
                                 <input style="width:100px" type="text" name="hostph_2" maxlength="4" class="form-control" onkeyup="this.value=SetComma1(this.value)"/><b> - </b>
                                 <input style="width:100px" type="text" name="hostph_3" maxlength="4" class="form-control" onkeyup="this.value=SetComma1(this.value)"/>
                                 </td>
                              </tr>
                              </tbody>
                           </table>
                               <p align="right">
                           <input type="submit" value="���" class="btn btn-outline btn-success" onclick="doAction()"/>
                           <input type="button" value="���" class="btn btn-outline btn-default" onclick="location.href='/fest/festlist.do'"/>
                               </p>
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

   <!-- ���� ó���� -->
   
   <iframe name="ifrProc" style="display:none"></iframe>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>