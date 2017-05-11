<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>    
<%
//���� ���ε� ��� ������ ���� ���� ��ü
String jObj = CmmUtil.nvl((String)request.getParameter("jObj"));
String vObj = CmmUtil.nvl((String)request.getParameter("vObj"));
%>    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>���� ���ε� �˾�</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script type="text/javascript">
	
		//���� ���ε�
		function doFileUpload() {
			var f = document.getElementById("form");
			
			if (f.fileUpload.value==""){alert("���ε��� ������ �����Ͻñ� �ٶ��ϴ�.");f.fileUpload.focus();return;}
			
			//�̹��� ���� Ȯ���� üũ
			if (doImgFileCheck(f.fileUpload.value)==false){alert("�̹������� (.jpg, .png, .gif)�� ���ε� �����մϴ�.");f.fileUpload.focus();return;}
			
			f.submit();
			
		}

		//�̹��� ���� Ȯ���� üũ
		function doImgFileCheck(fileNm) {
						 
			if (fileNm != "") {
			 
			    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
			 
			    if (ext == "jpeg" || ext == "gif" || ext == "jpg" || ext == "png") {
			        return true;
			        
			    }else{
			        return false;
			    }
			}
		}

		
	</script>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">���� ���ε�</h3>
                    </div>
                    <div class="panel-body">
                        <form name="form" id="form" method="post" enctype="multipart/form-data" action="/file/FileUploadProc.do" target="ifrProcPOP">
                        <input type="hidden" name="jObj" value="<%=jObj %>" />
                        <input type="hidden" name="vObj" value="<%=vObj %>" />
                            <fieldset>
                                <div class="form-group">
                                    <input type="file" name="fileUpload" class="form-control" />
                                </div>
                                <a href="javascript:doFileUpload()" class="btn btn-lg btn-success btn-block">���� ���ε�</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

	<iframe name="ifrProcPOP" style="display:none"></iframe>
</body>

</html>
