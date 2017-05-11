<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@page import="java.util.List"%>
<%
	List<FestivalDTO> rankList = (List<FestivalDTO>) request.getAttribute("ranklist");

	if (rankList == null) {
		rankList = new ArrayList<FestivalDTO>();

	}
	String month = "";
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>���ռ������� ����</title>

<%@include file="/inc/top.jsp"%>

</head>

<body>

	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">���ռ������� ����</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">���ռ��� ����Ʈ</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table style="width: 100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>

										<tr>
											<th style="width: 150px">��ȣ</th>
											<th style="width: 200px">��,��</th>
											<th style="width: 200px">��,��,��</th>
											<th style="width: 200px">������</th>
											<th style="width: 200px">���� ��&nbsp;(<%
												Iterator<FestivalDTO> it1 = rankList.iterator();
												while (it1.hasNext()) {
													FestivalDTO festivalDTO = (FestivalDTO) it1.next();

													if (festivalDTO == null) {
														festivalDTO = new FestivalDTO();
													}

													if (CmmUtil.nvl(festivalDTO.getCalender()).equals("jan")) {
														month = "1��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("feb")) {
														month = "2��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("mar")) {
														month = "3��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("apr")) {
														month = "4��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("may")) {
														month = "5��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("jun")) {
														month = "6��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("jul")) {
														month = "7��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("aug")) {
														month = "8��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("sep")) {
														month = "9��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("oct")) {
														month = "10��";
														out.print(month);
														break;
													} else if (CmmUtil.nvl(festivalDTO.getCalender()).equals("nov")) {
														month = "11��";
														out.print(month);
														break;
													} else {
														month = "12��";
														out.print(month);
														break;
													}
												}
											%>)
											</th>
											<th align="center" style="width: 200px">�����ܱ���</th>
											<th align="center" style="width: 250px">����� ����</th>
										</tr>
									</thead>
									<tbody>
										<%
											Iterator<FestivalDTO> it = rankList.iterator();

											int i = 1;
											while (it.hasNext()) {
												FestivalDTO festivalDTO = (FestivalDTO) it.next();

												if (festivalDTO == null) {
													festivalDTO = new FestivalDTO();
												}
										%>

										<tr class="even gradeA">
											<td align="center"><%=i++%></td>
											<td align="center" ><%=CmmUtil.nvl(festivalDTO.getCity())%></td>
											<td align="center" ><%=CmmUtil.nvl(festivalDTO.getLocal())%></td>
											<td align="center"><a
												href="/fest/rankDetail.do?fst_seq=<%=CmmUtil.nvl(festivalDTO.getFst_seq())%>"><%=CmmUtil.nvl(festivalDTO.getAttractions())%></a></td>
											<td align="center" ><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getCntt(),"0"))%>&nbsp;��</td>
											<td align="center"><%=CmmUtil.nvl(festivalDTO.getNation())%></td>
											<td align="center" ><%=CmmUtil.nvl(festivalDTO.getPay())%></td>


										</tr>
										<%
											}
										%>
									</tbody>
								</table>
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