<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>    

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
<!-- �߰��� ������ -->
	<script type="text/javascript">
	
		function doAction1() {
//*f�� form �±� ���� id��*//
			
			var f = document.getElementById("f");
			
			if (f.user_name.value==""){alert("�̸��� �Է��Ͻñ� �ٶ��ϴ�.");f.user_name.focus();return;}
			
			if (f.email1.value==""){alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�.");f.email1.focus();return;}
			if (f.email2.value==""){alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�.");f.email2.focus();return;}
			
			if (f.tel_1.value==""){alert("�ڵ��� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.");f.tel_1.focus();return;}
			if (f.tel_2.value==""){alert("�ڵ��� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.");f.tel_2.focus();return;}
			if (f.tel_3.value==""){alert("�ڵ��� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.");f.tel_3.focus();return;}
			
			if (f.title.value==""){alert("������ �Է��Ͻñ� �ٶ��ϴ�.");f.title.focus();return;}
			
			//���� �Է����� �ٷ� ����.			
			if (f.contents.value==""){alert("������ �Է��Ͻñ� �ٶ��ϴ�.");f.contents.focus();return;}
		
			if (calBytes(f.title.value) > 100) {
				alert("������ �ִ� 100Bytes���� �Է� �����մϴ�.");
				f.title.focus();
				return;
			}
 
		 	if (calBytes(f.contents.value) > 4000) {
				alert("������ �ִ� 4,000Bytes���� �Է� �����մϴ�.");
				f.contents.focus();
				return;
			}   
		
		 f.target = "ifrProc";
		 f.submit();
		}
		
		//�̸��� ����� �� ��������(����ü, ������ �̸��� ��)
		function doChangeEmail(f, val){
			
			//���� �Է��� �����Ͽ��ٸ�, ���� �Էµ� ���� �����.
			if (val=="etc"){
				f.email2.value = "";
				f.email2.focus();
				
			//�׷��� ������, ���õ� ���� �Է� �޵��� �Ѵ�.
			}else{
				f.email2.value = val;
			}
		}
		
/* 		//�������� üũ ���� Ȯ��
		function chkRadioCtrYn(){
			alert("������ chkRadioCtrYn �� ")
			
			var ctrYn = document.f.getElementsByName('ctr_yn') ; //���� ��ü ��������
			var res = false; //��ȯ�� �����(���õǾ����� true, ���þȵǸ� false)
			
			//���� ��ư ��ü����ŭ �ݺ��� ������
			for (var i=0;i<ctrYn.length;i++){
				
				//���� ��ư�� üũ�Ǿ��ٸ�..
				if (ctrYn[i].checked){
					res = true;
				}
			}
			return res;
		}
		 */
		
/* 		function chkRadio() {
			alert("üũ���� ������?")
			var ctr_yn = document.getElementById('ctr_yn');
			var res = false;

			for(var i=0;i<ctr_yn.length;i++){
				if(ctr_yn.checked){
					res=true;
				}
			}
			return res;
		} */
		
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
		
		function doKeyOnlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.KeyCode;
			if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
				return true;
			}else{
				return false;
			}
		}
		
		//���� ���� ����Ʈ ������ üũ�ϱ�(����Ʈ�� ����)
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
		
	</script>
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
                        <div class="panel-heading">�ֹ��ϱ�
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
 
								<form name="f" id="f" method="post" action="/ctr/ctrReg.do" >
								<table border="1" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<col width="150px" />
									<col width="150px" />
									<col width="150px" />
									<col width="150px" />
									<tr>
										<td align="center" style="width :120px"><b>ȸ���̸�</b></td>
										<td colspan="3"><input type="text" name="user_name" maxlength="20" class="form-control" style="width :250px"/></td>
									</tr>
									
									<tr>
										<td align="center"><b>�̸���</b></td>
										<td colspan="3">
										<input type="text" name="email1" maxlength="20" class="form-control" style="width :120px"/>
										@
										<input type="text" name="email2" maxlength="20" class="form-control" style="width :120px" />
										
										<select name="email3" onchange="doChangeEmail(this.form, this.value)" class="form-control" style="display:;width :120px">
											<option value="etc">�����Է�</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
											<option value="empal.com">empal.com</option>
											<option value="hanafos.com">hanafos.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="paran.com">paran.com</option>
											<option value="korea.com">korea.com</option>
											<option value="freechal.com">freechal.com</option>
										</select>
										 
										
										</td>	
									</tr>
									<tr>
										<td align="center"><b>�޴���ȭ</b></td>
										
										<td colspan="3">
										<select name="tel_1" class="form-control" style="display:;width :80px">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="016">017</option>
											<option value="016">018</option>
											<option value="019">019</option>
										</select>
										-
										<input type="text" name="tel_2" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="form-control" style="width :80px"/> 
										-
										<input type="text" name="tel_3" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="form-control" style="width :80px"/>
										</td>		
									</tr>
									
										
									<tr>
										<td align="center" ><b>����</b></td>
										<td colspan="3">
											<input type="text" name="title" maxlength="100" class="form-control" style= "width:340px"/>
										</td>
									</tr>
						<!-- 			<tr>										
									 	<td align="center"><b>��������</b></td>
									    <td colspan="3"> �� 	<input type="radio" name="ctr_yn" id="ctr_yn" value="1">
										    			�ƴϿ� <input type="radio" name="ctr_yn" id="ctr_yn" value="2"></td> 
									</tr> 
									 -->
									<tr>
										<td align="center"><b>����</b></td>
										<td colspan="4">
										<textarea name="contents" rows="10" cols="68" maxlength="4000" class="form-control"></textarea></td>
									</tr>
								
                                    </tbody>
                                </table>
                                </form>
	                            <p align="right">
									<input type="button" value="���" onclick="doAction1()" class="btn btn-outline btn-success"/>
									<input type="button" value="���" onclick="location.href='/ctr/ctrList.do'" class="btn btn-outline btn-default"/>
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
    