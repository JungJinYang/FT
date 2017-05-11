<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>    
<%

List<CtrDTO> rList = (List<CtrDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<CtrDTO>();
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

    <title>�����͸�</title>

	<%@include file="/inc/top.jsp" %>
</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">�����͸� ����</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">��㹮��
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            
							<script type="text/javascript">
							
							//��ü ���� ����
						function checkboxChange(f, cObj) {
								
								var cbox = document.getElementsByName("del_chk");
								
								//��ü ������ ���
								if(cObj.checked) {
									for(var i= 0; i<cbox.length;i++) {
										cbox[i].checked = true;
										
									}
								
								//��ü ���������� ���
								} else {
									for(var i = 0; i<cbox.length;i++) {
										cbox[i].checked = false ;
										
									}									
								}
							}
							
							
							function checkcheck() {
								var check = document.f.del_chk;
								if(check.length>=1){
									for( var i=0; i<check.length;i++){
										if(check[i].checked){
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
								
								if(check.length){
									for( var i=0; i<check.length;i++){
										if(check[i].checked){
											checked = true;
											break; //�ϳ��� ���õ� ���� �ִٸ�, ��� for�� �� �ʿ� ����
										}
									}
								}
								
								if (checked){
									if(confirm("�����Ѱ��� �����Ͻðڽ��ϱ�?")){
										f.action="/ctr/updateCheck.do";
										f.submit(); //�� submit;
									}
									
								}else{
									alert("�ϳ��� ���õ� ���� �����ϴ�.");
									
								}
							}
							
							function userdel_check() {
								var checked = false; //üũ ���� Ȯ�� ����
								var check = document.getElementsByName("del_chk");
								var f = document.getElementById("f"); //����ü
								
								if(check.length){
									for( var i=0; i<check.length;i++){
										if(check[i].checked){
											checked = true;
											break; //�ϳ��� ���õ� ���� �ִٸ�, ��� for�� �� �ʿ� ����
										}
									}
								}
								
								//���õ� �׸��� �ִٸ�..
								if (checked){
									if(confirm("�����Ѱ��� �����Ͻðڽ��ϱ�?")){
										f.submit(); //�� submit;
									}
									
								}else{
									alert("�ϳ��� ���õ� ���� �����ϴ�.");
									
								}
							}

							</script>
                            
                            <form name="f" id="f" method="post" action="deleteAllCheckList.do">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" name="all" onclick="checkboxChange(this.form, this)"/></th>
                                            <th>��ȣ</th>
                                            <th>����</th>
                                            <th>�ۼ���</th>
                                            <th>�����</th>
                                            <th>�����Ȳ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            
									    <%
										Iterator<CtrDTO> it = rList.iterator();
										while(it.hasNext()){
											CtrDTO ctrDTO = (CtrDTO)it.next();
											
											if (ctrDTO==null){
												ctrDTO = new CtrDTO();
											}
										%>
										
                                        
                                        <tr class="even gradeA">
                                            <td><input type="checkbox" name="del_chk" value="<%=CmmUtil.nvl(ctrDTO.getCtr_seq())%>"/></td>
				                            <td><%=CmmUtil.nvl(ctrDTO.getCtr_seq())%></td>
                                            <td><a href="/ctr/ctrDetail.do?ctr_seq=<%=CmmUtil.nvl(ctrDTO.getCtr_seq())%>"><%=CmmUtil.nvl(ctrDTO.getTitle())%></a></td>
                                            <td><%=CmmUtil.nvl(ctrDTO.getUser_name())%></td>
                                            <td class="center"><%=CmmUtil.nvl(ctrDTO.getReg_dt())%></td>
                                            
                                            <%-- <td class="center"><%=CmmUtil.nvl(ctrDTO.getProgress())%></td> --%>
                                            
                                             <td  align="right">
                                               <select class="form-control" name="pro_<%=CmmUtil.nvl(ctrDTO.getCtr_seq()) %>" id="auth_<%=CmmUtil.nvl(ctrDTO.getCtr_seq()) %>">
                                                    
                                                     <!-- 
                                                     Register = ��û 
                                                     Register Success = �����Ϸ�
                                                     Progressing = ������
                                                     Trade Success = �ŷ��Ϸ�
                                                      -->
                                                     
                                                     <% if(CmmUtil.nvl(ctrDTO.getProgress()).equals("R")){
                                                        out.print("<option value='R'>��û</option>");
                                                        out.print("<option value='RS'>�����Ϸ�</option>");
                                                        out.print("<option value='P'>������</option>");
                                                        out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                                                     }else if(CmmUtil.nvl(ctrDTO.getProgress()).equals("RS")){
                                                         out.print("<option value='RS'>�����Ϸ�</option>");
                                                    	 out.print("<option value='R'>��û</option>");
                                                         out.print("<option value='P'>������</option>");
                                                         out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                                                     }else if(CmmUtil.nvl(ctrDTO.getProgress()).equals("P")){
                                                         out.print("<option value='P'>������</option>");
                                                    	 out.print("<option value='R'>��û</option>");
                                                         out.print("<option value='RS'>�����Ϸ�</option>");
                                                         out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                                                     }else if(CmmUtil.nvl(ctrDTO.getProgress()).equals("TS")){
                                                         out.print("<option value='TS'>�ŷ��Ϸ�</option>");
                                                    	 out.print("<option value='R'>��û</option>");
                                                         out.print("<option value='RS'>�����Ϸ�</option>");
                                                         out.print("<option value='P'>������</option>");
                                                     }else{
                                                        out.print("����");
                                                     }
                                                        %>
                                                 
                                               </select>
                                              
                                               <%-- <input type="button" value="����" onclick="updateOne(<%=CmmUtil.nvl(ctrDTO.getCtr_seq())%>)" class="btn btn-success"/> --%>
                                            </td>
                                            
                                        </tr>
                                      
										<%                                        													
										}
										%>
                                    </tbody>
                                </table>
                               
                                </form>
	                            <p align="right">
	                            	<a href="/ctr/ctrRegform.do"><button class="btn btn-outline btn-success"  align="right">�۾���</button></a>
	                                <button type="button" value="����" onclick="userupdate_check()" align="right" class="btn btn-outline btn-warning">����</button>
	                                <input type="button" value="����" align="right" class="btn btn-outline btn-danger" onclick="userdel_check()">
	                            </p>   
	                            
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
    