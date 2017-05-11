<%@page import="ac.kr.ft.com.dto.ScheduleDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	ScheduleDTO scheduleDto = (ScheduleDTO)request.getAttribute("scheduleDto");
	if(scheduleDto==null){
		scheduleDto = new ScheduleDTO();
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
    
    
	<title>����</title>
	<%@include file="/inc/top.jsp" %>
	<script type="text/javascript">
		function calendar() {
			location.href="/schedule/calendar.do";
		}
		
		function check(f) {
			if(f.title.value==""){
				alert("������ �Է����ּ���");
				f.title.focus();
				return false;
			}
			
			if(f.pl_dt1.value==""){
				alert("��¥�� �Է����ּ���");
				f.pl_dt1.focus();
				return false;
			}
			
			if(!isValidDate(f.pl_dt1.value)){
				alert("��¥�� �ٽ� �Է����ּ���");
				f.pl_dt1.focus();
				return false;
			}
			
			if(f.pl_dt2.value!=""){
				if(!isValidDate(f.pl_dt2.value)){
					alert("��¥�� �ٽ� �Է����ּ���");
					f.pl_dt2.focus();
					return false;
				}else if(f.pl_dt1.value > f.pl_dt2.value){
					alert("��¥�� �ٽ� �Է����ּ���");
					f.pl_dt2.focus();
					return false;
				}
			}
			
			if(f.contents.value==""){
				alert("������ �Է����ּ���");
				f.contents.focus();
				return false;
			}
			
			return true;
		}
		
		function doKeyOnlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.KeyCode;
			
			if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
				return true;
			}else{
				return false;
			}
			
		}
		
		function isValidDate(param) {
	        try{
	 
	            // �ڸ����� ����������
	            if( isNaN(param) || param.length!=8 ) {
	                return false;
	            }
	             
	            var year = Number(param.substring(0, 4));
	            var month = Number(param.substring(4, 6));
	            var day = Number(param.substring(6, 8));
	 
	            var dd = day / 0;
	 
	             
	            if( month<1 || month>12 ) {
	                return false;
	            }
	             
	            var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	            var maxDay = maxDaysInMonth[month-1];
	             
	            // ���� üũ
	            if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
	                maxDay = 29;
	            }
	             
	            if( day<=0 || day>maxDay ) {
	                return false;
	            }
	            return true;
	        } catch (err) {
	            return false;
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
                    <h1 class="page-header">����</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">����
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            	<form name="f" action="scheduleUpdateProc.do" method="post" onsubmit="return check(this)">
                            		<input type="hidden" value="<%=scheduleDto.getSch_seq() %>" name="sch_seq" />
                            		<table width="100%" class="table table-striped table-bordered">
                            			<tr>
                            				<td align="center" valign="middle">�� ��</td>
                            				<td><input type="text" name="title"  class="form-control" value="<%=scheduleDto.getTitle() %>"/></td>
                            			</tr>
                            			
                            			<tr>
                            				<td align="center">�� ¥</td>
                            				<td>
                            					<input type="text" name="pl_dt1" maxlength="8" style="width:150px;" placeholder="yyyymmdd" value="<%=scheduleDto.getPl_dt1() %>" onclick="return doKeyOnlyNumber(event);"/>&nbsp;&nbsp;~&nbsp;&nbsp;
                            					<input type="text" name="pl_dt2" maxlength="8" style="width:150px;" placeholder="yyyymmdd" value="<%=scheduleDto.getPl_dt2() %>" onclick="return doKeyOnlyNumber(event);" />
                            				</td>
                            			</tr>
                            			
                            			<tr>
                            				<td align="center">�� ��</td>
                            				<td><textarea class="form-control" name="contents" cols="80" rows="15"><%=scheduleDto.getContents() %></textarea></td>
                            			</tr>
                            			
                            			<tr>
                            				<td colspan="2" align="center">
                            					<input type="submit" value="����" class="btn btn-outline  btn-warning"/>
                            					<input type="button" value="���" onclick="location.href='/schedule/scheduleDetail.do?sch_seq=<%=scheduleDto.getSch_seq() %>'" class="btn btn-outline  btn-danger"/>
                            				</td>
                            			</tr>
                            		</table>
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
    