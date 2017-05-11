<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>���Ǫ��Ʈ��</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    <link rel="stylesheet" href="/css/datepicker.css">
    
    
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".datepicker").datepicker({
				dateFormat : "yymmdd",
				monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��',],
				dayNamesMin : ['��','��','ȭ','��','��','��','��'],
				changeMonth : true,
				changeYear : true,
				showMonthAfterYear : true,
			});
		});
	</script>
	
	<script type="text/javascript">
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
			
			if(f.pl_dt2.value!=""){
				if(f.pl_dt1.value > f.pl_dt2.value){
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
	
	</script>
<%@include file="/busiinc/apptop.jsp"%>
</head>
<body>
<div class="wrapper">
    <!-- S: HEADER -->
		<%@include file="/busiinc/appheader.jsp"%>
	<!-- S: WRAPPER -->
	<!-- E: HEADER -->
		<%@include file="/busiinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->

    <!-- S: CONTENT -->
     <!-- join -->
     <form action="/busi/schedule/scheduleInsertProc.do" name="f" onsubmit="return check(this)" method="post">
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>��ġ �� ����</span></header>
			<div class="section">
                <!-- group -->
               <div class="input_row">
					<span class="input_box">
						<label class="lbl" >����</label>
						<input type="text" placeholder="����" class="input_area" value="" name="title">
					</span>
				</div>
	
				<div class="group">
					<a class="input_row date">
						<span class="input_box">
							<label class="lbl">������</label>
							<input type="text" placeholder="������" class="input_area datepicker" value="" name="pl_dt1">
						</span>	
					</a>
					
					<a class="input_row date">
						<span class="input_box">
							<label class="lbl">������</label>
							<input type="text" placeholder="������" class="input_area datepicker" value="" name="pl_dt2">
						</span>	
					</a>
				</div>
                <!-- group -->
				<div class="input_content">
					<span class="input_box">
                        <textarea name="contents"></textarea>
					</span>
				</div>
            </div>
        </div>
    </div>
    <div class="content wrapper50">
	    <input type="submit" title="Ȯ��" value="Ȯ��" class="btn_half left">
	    <input type="button" title="���" value="���" class="btn_half left" onclick="location.href='/busi/schedule/calendar.do'">
    </div>
    </form>
    <!-- E: CONTENT -->
    
    <!-- S: FOOTER -->
    	<%@include file="/busiinc/appfooter.jsp" %>
    <!-- E: FOOTER -->
</div>
</body>
</html>