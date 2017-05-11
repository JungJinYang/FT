<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.EventDTO"%>
<%@page import="java.util.List"%>    
<%
List<EventDTO> rList = (List<EventDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<EventDTO>();
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

    <title>�̺�Ʈ�����Խ���</title>

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

	<%@include file="/inc/top.jsp" %>

</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">�̺�Ʈ ����</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">�̺�Ʈ���
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                           
                            <form id="f" name="f" action="deleteCheck.do">
                                
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                         
               <th width="90"><input type="checkbox" name="all" onclick="checkboxChange(this.form, this)"/> ��ü </th>
                                         <th width="100">�۹�ȣ</th>
                                            <th width="300">����</th>
                                            <th width="100">ȸ���̸�</th>
                                            <th width="100">�����</th>
                                            <th width="100">��ȸ��</th>
                                         
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
									    <%
										Iterator<EventDTO> it = rList.iterator();
										while(it.hasNext()){
											EventDTO eventDTO = (EventDTO)it.next();
											
											if (eventDTO==null){
												eventDTO = new EventDTO();
											}
										%>
										
                                        <tr class="even gradeA">
                                        
                                 <td><input type="checkbox" name="del_chk" value="<%=CmmUtil.nvl(eventDTO.getEnt_seq())%>"/></td>       
                                 
                                            <td><%=CmmUtil.nvl(eventDTO.getEnt_seq())%></td>
                                            <td><a href="eventDetail.do?ent_seq=<%=CmmUtil.nvl(eventDTO.getEnt_seq())%>"><%=CmmUtil.nvl(eventDTO.getTitle())%></a></td>
                                            <td><%=CmmUtil.nvl(eventDTO.getUser_name())%></td>
                                           
                                            <td class="center"><%=CmmUtil.nvl(eventDTO.getReg_dt())%></td>                                      
                                            <td class="center"><%=CmmUtil.nvl(eventDTO.getRead_cnt())%></td>
                                      
                                      
                                      
                                      
                                </tr>
										<%                                        													
										}
										%>
                                    </tbody>
                                </table>
                                
                                
                                
                                
                                
                                </form>
	                            <p align="right">
	                           	    <a href="eventInsert.do"><button type="button" class="btn btn-outline btn-success" >�۾���</button></a>
	                             <input type="button" value="����"  class="btn btn-outline btn-danger" onclick="userdel_check()">
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