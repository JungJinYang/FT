<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.HygDTO"%>
<%@page import="java.util.List"%>    
<%
List<HygDTO> rList = (List<HygDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<HygDTO>();
}

int listCnt = rList.size(); //����Ʈ ũ��
%>      
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>��������</title>

	<%@include file="/inc/top.jsp" %>



		<script type="text/javascript">

			function doDeleteList() {
				
				var checked = false; //üũ�� ���¿���
				var check = document.getElementsByName("chkMenu");
				var check = document.getElementsByName("chkMenu");
				
				for( var i=0; i<check.length;i++){
					if(check[i].checked){
						checked = true;
					}
				}
				
				if (checked){
					if (confirm("�����Ͻðڽ��ϱ�?")){
						var f = document.getElementById("f");
						f.submit();
					}
					
				}else{
					alert("�ϳ� �̻� üũ���ֽñ� �ٶ��ϴ�.");
					
				}
			}
			
			
			
		</script>
		
</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">����������</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">����������
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
								<form name="f" id="f" method="post" action="deleteAllCheckList.do">
                                <table width="100%" border="0">
                                	<tr>
								    <%
								    int idx = 0;//�ݺ� Ƚ��
								    boolean tr = false; //3��° �׸��� �Ѿ�� true ����
									Iterator<HygDTO> it = rList.iterator();
									while(it.hasNext()){
										HygDTO hygDTO = (HygDTO)it.next();
										
										if (hygDTO==null){
											hygDTO = new HygDTO();
										}
										
										idx++; //�ݺ�Ƚ�� ����

										if (idx>3){
											tr = true;
										}
									
										System.out.println("idx%3 : "+ idx%3);
										System.out.println("tr : "+ tr);
										
										//�ݺ�Ƚ���� 3���� ũ��, 3���� �������� TR�߰�
										if (tr && idx%3==1){
											
											System.out.println("AAAAAAAAAAA");
											
											out.println("</tr>");
											out.println("<tr>");
											
										}
										
										
									%>
										<td>
											<table >
												<tr>
													<td><input type="checkbox" name="chkMenu" value="<%=CmmUtil.nvl(hygDTO.getHgn_seq())%>"/></td>
													<td align="center">
													<a href="/hyg/hygDetail.do?hgn_seq=<%=CmmUtil.nvl(hygDTO.getHgn_seq())%>">
													
													<img src="<%=CmmUtil.nvl(hygDTO.getFile_name())%>"
															width="200px" height="300px" /></a>
															<br/>
														 <b><p class="text-muted"><%=CmmUtil.nvl(hygDTO.getTitle())%></p></b>
														
														<br/>
													</td>
												
												
												
												
												
												</tr>
											</table>										
										</td>
										
									<%
									}
									%>
									</tr>
                                </table>
								</form>
	                            <p align="right">
	                           	    <button type="button" class="btn btn-outline btn-success" onclick="location.href='/hyg/hygReg.do'">���</button></a>
									<button type="button" class="btn btn-outline btn-danger" onclick="doDeleteList()">����</button>
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
    