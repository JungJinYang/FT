<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%
   FestivalDTO festivalDTO = (FestivalDTO) request.getAttribute("festivalDTO");

   if (festivalDTO == null) {
      festivalDTO = new FestivalDTO();
   }
   
   String reg_dt = CmmUtil.nvl(festivalDTO.getReg_dt());
   String chg_dt = CmmUtil.nvl(festivalDTO.getChg_dt());
%>
<!DOCTYPE html>
<html lang="en">
 
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>������������-</title>

<%@include file="/inc/top.jsp"%>


<script type="text/javascript">
   function doAction(gubun) {
      var f = document.getElementById("form1");
      if (gubun == "U") {
         f.action = "festupdate.do";
         f.submit();
      } else if (gubun == "D") {
         if (confirm("�����Ͻðڽ��ϱ�?")) {
            f.action = "festdelete.do";
            f.submit();
         }
      }
   }
</script>
</head>

<body>

   <div id="wrapper">

      <%@include file="/inc/menu.jsp"%>

      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">�������� ����</h1>
            </div>
            <!-- /.col-lg-12 -->
         </div>
         <!-- /.row -->
         <div class="row">
            <div class="col-lg-12">
               <div class="panel panel-default">
                  <div class="panel-heading">��������</div>
                  <!-- /.panel-heading -->
                  <div class="panel-body">
                     <div class="dataTable_wrapper">

                        <form name="form1" id="form1" method="post">
                           <input type="hidden" name=fst_seq
                              value="<%=CmmUtil.nvl(festivalDTO.getFst_seq())%>" />
                           <table align="center" style="width: 100%" border="1"
                              class="table table-striped table-bordered table-hover">
                              <col width="12.5%">
                              <col width="12.5%">
                              <col width="12.5%">
                              <col width="12.5%">
                              <col width="12.5%">
                              <col width="12.5%">
                              <col width="12.5%">
                              <col width="12.5%">
                              <col width="12.5%">
                              <tr>
                                 <td align="center"><b>�����</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getReg_user_name())%></td>
                                 <td align="center"><b>�����</b></td>
                                 <td colspan="3">
                                 <%if(reg_dt.length()==8){ %>
			                    	<%=reg_dt.substring(0,4)%>�� <%=reg_dt.substring(4,6)%>�� <%=reg_dt.substring(6)%>��
		                    	<%}else{ %>
			                    		
		                    	<%} %>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center"><b>������</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getChg_user_name())%></td>
                                 <td align="center"><b>������</b></td>
                                 <td colspan="3">
                                 <%if(chg_dt.length()==8){ %>
			                    	<%=chg_dt.substring(0,4)%>�� <%=chg_dt.substring(4,6)%>�� <%=chg_dt.substring(6)%>��
		                    	<%}else{ %>
			                    		
		                    	<%} %>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center"><b>��,��</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getCity())%></td>
                                 <td align="center"><b>��,��,��</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getLocal())%></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>������</b></td>
                                 <td colspan="7"><%=CmmUtil.nvl(festivalDTO.getAttractions())%></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>�����<br/>����</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getPay())%></td>
                                 <td align="center"><b>�̿밴</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getNation())%></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>1��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getJan(), "0")) + " ��"%></td>
                                 <td align="center"><b>2��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getFeb(), "0")) + " ��"%></td>
                                 <td align="center"><b>3��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getMar(), "0")) + " ��"%></td>
                                 <td align="center"><b>4��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getApr(), "0")) + " ��"%></td>
                              </tr>
                              <tr>

                                 <td align="center"><b>5��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getMay(), "0")) + " ��"%></td>
                                 <td align="center"><b>6��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getJun(), "0")) + " ��"%></td>
                                 <td align="center"><b>7��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getJul(), "0")) + " ��"%></td>
                                 <td align="center"><b>8��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getAug(), "0")) + " ��"%></td>
                              </tr>
                              <tr>

                                 <td align="center"><b>9��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getSep(), "0")) + " ��"%></td>
                                 <td align="center"><b>10��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getOct(), "0")) + " ��"%></td>
                                 <td align="center"><b>11��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getNov(), "0")) + " ��"%></td>
                                 <td align="center"><b>12��</b></td>
                                 <td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getDec(), "0")) + " ��"%></td>
                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b>���� ����</b></td>
                                 <td align="center" colspan="7" height="100px"><img src="<%=CmmUtil.nvl(festivalDTO.getFile_name())%>" /></td>
                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b><br/>��������</b></td>
                                 <td align="center" colspan="7" height="100px"><%=CmmUtil.nvl(festivalDTO.getFst_exp())%></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>������<br/>���μ�</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getFst_host())%></td>
                                 <td align="center"><b>�����<br/>����ó</b></td>
                                 <td colspan="3"><%=CmmUtil.nvl(festivalDTO.getHostph_1())%>
                                    -<%=CmmUtil.nvl(festivalDTO.getHostph_2())%> -<%=CmmUtil.nvl(festivalDTO.getHostph_3())%>
                                 </td>
                              </tr>
                              </tbody>
                           </table>

                           <p align="right">
                              <input type="button" class="btn btn-outline btn-warning"
                                 value="����" onclick="doAction('U')" /> <input type="button"
                                 class="btn btn-outline btn-default" value="���"
                                 onclick="location.href='/fest/festlist.do'" />


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