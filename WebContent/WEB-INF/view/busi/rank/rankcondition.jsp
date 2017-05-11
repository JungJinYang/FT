<%@ page language="java" pageEncoding="EUC-KR"
	contentType="text/html; charset=EUC-KR"%>
	    <%@ page import="java.util.*, java.text.*"  %>
	
<!DOCTYPE html>
<html lang="en">
<head> 

<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<link rel="stylesheet" href="/css/style.css?ver=2">

<title>���Ǫ��Ʈ��</title>
<script type="text/javascript">
	function changeSelect(city) {

		var local = document.getElementById("f").local;

		var opt = $("#local option").length;

		var num = null;
		var vnum = null;

		if (city.value == "B0001") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "������", "�����", "������", "���빮��", "���ʱ�", "��걸",
					"���α�", "�߱�");
			vnum = new Array("X", "C0001", "C0002", "C0003", "C0004", "C0005",
					"C0006", "C0007", "C0008");
		}

		else if (city.value == "B0002") {
			num = null;
			vnum = null;

			num = new Array("��ü����", "��ȭ��", "����", "����", "����", "������", "������",
					"�߱�");
			vnum = new Array("X", "C0009", "C0010", "C0011", "C0012", "C0013",
					"C0014", "C0015");
		}

		else if (city.value == "B0003") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "����", "����", "��õ��", "�����", "���ֽ�", "������",
					"������", "�����ֽ�", "����õ��", "������", "������", "�Ȼ��", "�ȼ���", "���ֽ�",
					"���ֽ�", "��õ��", "�����", "���ν�", "��õ��", "���ֽ�", "��õ��", "ȭ����");
			vnum = new Array("X", "C0016", "C0017", "C0018", "C0019", "C0020",
					"C0021", "C0022", "C0023", "C0024", "C0025", "C0026",
					"C0027", "C0028 ", " C0029 ", " C0030 ", " C0031",
					" C0032 ", " C0033 ", " C0034 ", " C0035 ", " C0036 ",
					" C0037 ");
		}

		else if (city.value == "B0004") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "������", "����", "���ؽ�", "��ô��", "���ʽ�", "�籸��",
					"��籺", "������", "���ֽ�", "������", "������", "ö����", "��õ��", "�¹��",
					"��â��", "ȫõ��", "Ⱦ����");
			vnum = new Array("X", "C0038", "C0039", "C0040", "C0041", "C0042",
					"C0043", "C0044", "C0045", "C0046", "C0047", "C0048",
					"C0049", "C0050 ", " C0051 ", " C0052 ", " C0053",
					" C0054 ");
		}

		else if (city.value == "B0005") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "������", "����", "���ϱ�", "������", "�ؿ�뱸");
			vnum = new Array("X", "C0055", "C0056", "C0057", "C0058", "C0059");
		}

		else if (city.value == "B0006") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "����", "�޼���", "�޼���", "����", "�ϱ�", "������", "�߱�");
			vnum = new Array("X", "C0060", "C0061", "C0062", "C0063", "C0064",
					"C0065", "C0066");
		}

		else if (city.value == "B0007") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "����", "����", "�ϱ�");
			vnum = new Array("C0067", "C0068", "C0069");
		}

		else if (city.value == "B0008") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "����", "����", "������", "�߱�");
			vnum = new Array("X", "C0070", "C0071", "C0072", "C0073");
		}

		else if (city.value == "B0009") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "����", "����", "���ֱ�");
			vnum = new Array("X", "C0074", "C0075", "C0076");
		}

		else if (city.value == "B0010") {
			num = null;
			vnum = null;
			num = new Array("����Ư����ġ��");
			vnum = new Array("C0077");
		}

		else if (city.value == "B0011") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "����", "���ֽ�", "�ݻ걺", "����", "������", "���ɽ�",
					"�ο���", "�����", "��õ��", "�ƻ��", "���걺", "õ�Ƚ�", "û�籺", "�¾ȱ�",
					"ȫ����", "���걺", "�ܾ籺", "������", "������", "��õ��", "������", "��õ��",
					"����", "��õ��", "û�ֽ�", "���ֽ�");
			vnum = new Array("X", "C0078", "C0079", "C0080", "C0081", "C0082",
					"C0083", "C0084", "C0085", "C0086", "C0087", "C0088",
					"C0089", " C0090 ", " C0091 ", " C0092 ", " C0093 ",
					" C0094 ", " C0095 ", " C0096 ", " C0097 ", " C0098 ",
					" C0099 ", " C0100", " C0101 ", " C0102 ", "C0103");
		}

		else if (city.value == "B0012") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "������", "���ﱺ", "���", "�����", "���ʱ�", "���ֽ�",
					"��籺", "������", "���ȱ�", "������", "��õ��", "�žȱ�", "������", "������",
					"���ϱ�", "�ϵ���", "�强��", "���ﱺ", "������", "����", "�س���", "ȭ����",
					"��â��", "�����", "������", "������", "���ֱ�", "�ξȱ�", "��â��", "���ֱ�",
					"�ͻ��", "�ӽǱ�", "�����", "���ֽ�", "������", "���ȱ�");
			vnum = new Array("X", "C0104", "C0105", "C0106", "C0107", "C0108",
					"C0109", "C0110", "C0111", "C0112", "C0113", "C0114",
					"C0115", "C0116 ", " C0117", " C0118 ", " C0119 ",
					" C0120 ", " C0121 ", " C0122 ", " C0123 ", " C0124 ",
					" C0125 ", " C0126 ", " C0127 ", " C0128 ", "C0129",
					"C0130", "C0131", "C0132", "C0133", "C0134", "C0135",
					"C0136", "C0137", "C0138", "C0139");
		}

		else if (city.value == "B0013") {
			num = null;
			vnum = null;
			num = new Array("��ü����", "������", "��â��", "����", "���ؽ�", "���ر�", "�о��",
					"��õ��", "��û��", "����", "�Ƿɱ�", "���ֽ�", "â�籺", "�뿵��", "����â����",
					"�ϵ���", "�Ծȱ�", "�Ծ籺", "��õ��", "����", "���ֽ�", "��ɱ�", "���̽�",
					"������", "��õ��", "�����", "��ȭ��", "���ֽ�", "���ֱ�", "�ȵ���", "������",
					"���籺", "���ֽ�", "��õ��", "��õ��", "�︪��", "������", "�Ǽ���", "û����",
					"û�۱�", "ĥ�", "���׽�");
			vnum = new Array("X", "C0140", "C0141", "C0142", "C0143", "C0144",
					"C0145", "C0146", "C0147 ", "C0148", "C0149", "C0150",
					"C0151", "C0152 ", " C0153 ", " C0154", " C0155 ",
					" C0156", " C0157", " C0158", " C0159 ", " C0160 ",
					" C0161", " C0162 ", " C0163 ", " C0164 ", " C0165 ",
					" C0166 ", " C0167 ", " C0168 ", " C0169 ", " C0170",
					" C0171 ", " C0172 ", " C0173 ", " C0174 ", " C0175 ",
					" C0176", "C0177", "C0178", "C0179", "C0180");
		}

		local.length = 0;

		for (var k = 0; k < num.length; k++) {
			local.options[k] = new Option(num[k], vnum[k]);
		}

	}

	function doAction(f) {
		
		var i = 0;
		var sType = document.getElementsByName("sType") ; //���� ��ü ��������
		var res = ""; //üũ�� ��
		
		//���� ��ư ��ü����ŭ �ݺ��� ������
		for (var i=0;i<sType.length;i++){
			
			//���� ��ư�� üũ�Ǿ��ٸ�..
			if (sType[i].checked){
				res = sType[i].value;
			}
			
		}
		
		//��� �м�
		if (res=="A"){
			f.action = "/sales/busiSalesInfo.do"
			
		}else {
			if (f.nation.value == "D0003" && f.pay.value == "S") {
				if (!confirm("�����ܱ��� �� ����Ḧ ��ü�� �ϼ̽��ϴ�. �����Ͻðڽ��ϱ�?")) {
					return false;
				}
				
			} else if (f.nation.value == "D0003") {
				if (!confirm("�����ܱ����� ��ü�� �ϼ̽��ϴ�. �����Ͻðڽ��ϱ�?")) {
					return false;
					
				}
				
			} else if (f.pay.value == "S") {
				if (!confirm("����Ḧ ��ü �ϼ̽��ϴ�. �����Ͻðڽ��ϱ�?")) {
					return false;
					
				}
			}
			
			f.action = "/busi/ranklist.do"
		}

		return true;
	}
	
	//��ȸ ���� ����
	function doCheckSearch(sType, f){
		
		//����̶��....
		if (sType=="A"){
			f.city.disabled=true;
			f.local.disabled=true;
			f.nation.disabled=true;
			f.calender.disabled=true;
			f.pay.disabled=true;
			document.getElementById("fest").style.display = "none"; // ������
		}else{
			f.city.disabled=false;
			f.local.disabled=false;
			f.nation.disabled=false;
			f.calender.disabled=false;
			f.pay.disabled=false;
			document.getElementById("fest").style.display = ""; // ������
		}
	

		
		
	}
	
	//ȭ�� �ε��� ����
	function doOnload(){
		var f = document.getElementById("f");
		
		doCheckSearch("A", f)
	}
</script>
<%@include file="/busiinc/apptop.jsp"%>
</head>
<%
java.util.Calendar cal2 = java.util.Calendar.getInstance();
java.util.Calendar cal3 = java.util.Calendar.getInstance();
java.util.Calendar cal4 = java.util.Calendar.getInstance();
java.util.Calendar cal5= java.util.Calendar.getInstance();
java.util.Calendar cal6 = java.util.Calendar.getInstance();
java.util.Calendar cal7 = java.util.Calendar.getInstance();
java.util.Calendar cal8 = java.util.Calendar.getInstance();
java.util.Calendar cal = java.util.Calendar.getInstance();
java.text.DateFormat format = new java.text.SimpleDateFormat("YYYY.MM.dd");

/* cal.add(cal.DATE, -7); */ // 7��(������)�� ����
String dateStr = format.format(cal.getTime());



cal2.add(cal2.DATE, +2);
String dateStr2 = format.format(cal2.getTime());

cal3.add(cal3.DATE, +3);
String dateStr3 = format.format(cal3.getTime());


cal4.add(cal4.DATE, +4);
String dateStr4 = format.format(cal4.getTime());

cal5.add(cal5.DATE, +5);
String dateStr5 = format.format(cal5.getTime());

cal6.add(cal6.DATE, +6);
String dateStr6 = format.format(cal6.getTime());

cal7.add(cal7.DATE, +7);
String dateStr7 = format.format(cal7.getTime());

cal8.add(cal8.DATE, +8);
String dateStr8 = format.format(cal8.getTime());

%>
<body onload="doOnload()">


		<!-- S: WRAPPER -->
		<div class="wrapper">
			<!-- S: HEADER -->
			<%@include file="/busiinc/appheader.jsp"%>
			<!-- E: HEADER -->
			<%@include file="/busiinc/appmenu.jsp"%>
			<!-- S: CONTENT -->
			<!-- join -->
			<form name="f" id="f" method="post" action="/busi/ranklist.do" onsubmit="return doAction(this)">
			<div class="content" style="display: block;">
				<div class="content_wrapper">
					<header>
						<span><a href=/busi/rankcondition.do>���ռ��� ��ȸ</a></span>
					</header>
					<div class="section1">
						<!-- group -->
						<b>���</b> <input type="radio" name="sType" value="A" onclick="doCheckSearch('A', this.form)" checked />
						<b>����</b><input type="radio" name="sType" value="B" onclick="doCheckSearch('B', this.form)" />
						</span><br /><br /> 
						<div id="fest">
						<span class="peak">��, �� <br />
						<br /> <select name="city" size="1" onchange="changeSelect(this)"
							style="width: 200px" class="only">
								<option value="B0001" selected>����Ư����</option>
								<option value="B0002">��õ������</option>
								<option value="B0003">��⵵</option>
								<option value="B0004">������</option>
								<option value="B0005">�λ걤����</option>
								<option value="B0006">�뱸������</option>
								<option value="B0007">���ֱ�����</option>
								<option value="B0008">����������</option>
								<option value="B0009">��걤����</option>
								<option value="B0010">����Ư����ġ��</option>
								<option value="B0011">��û��</option>
								<option value="B0012">����</option>
								<option value="B0013">���</option>
						</select>
						</span><br /> 
						<span class="peak">��,��,�� <br />
						<br /> <select name="local" size="1" style="width: 200px"
							class="only">
								<option value="X" selected>��ü����</option>
								<option value="C0001">������</option>
								<option value="C0002">�����</option>
								<option value="C0003">������</option>
								<option value="C0004">���빮��</option>
								<option value="C0005">���ʱ�</option>
								<option value="C0006">��걸</option>
								<option value="C0007">���α�</option>
								<option value="C0008">�߱�</option>
						</select> <br />
						</span> <span class="peak">�ִ� ���� ��<br />
						<br /> <select name="calender" size="1" style="width: 200px"
							class="only">
								<option value="jan" selected>1��</option>
								<option value="feb">2��</option>
								<option value="mar">3��</option>
								<option value="apr">4��</option>
								<option value="may">5��</option>
								<option value="jun">6��</option>
								<option value="jul">7��</option>
								<option value="aug">8��</option>
								<option value="sep">9��</option>
								<option value="oct">10��</option>
								<option value="nov">11��</option>
								<option value="dec">12��</option>
						</select>
						</span><br /> <span class="peak">�����ܱ���<br />
						<br /> <select name="nation" size="1" style="width: 200px"
							class="only">
								<option value="D0003" selected>��ü</option>
								<option value="D0001">������</option>
								<option value="D0002">�ܱ���</option>
						</select>
						</span><br /> <span class="peak">����� ����<br />
						<br /> <select name="pay" size="1" style="width: 200px"
							class="only">
								<option value="S" selected>��ü</option>
								<option value="F0001">����</option>
								<option value="F0002">����</option>
						</select></span>
						</div>
						<br /> <span class="peak">�Ǹ� ������ ����<br /><br />
						<!-- <br /> <select name="pay" size="1" style="width: 200px"
							class="only">
								<option value="S" selected>��ü</option>
								<option value="F0001">����</option>
								<option value="F0002">����</option> -->
								<select name="cal" size="1" style="width:200px" class="only">
                                 			<option value="<%=dateStr2 %>" selected > <%=dateStr2 %></option>
                                 			<option value="<%=dateStr3 %>"  > <%=dateStr3 %></option>
                                 			<option value="<%=dateStr4 %>"  > <%=dateStr4 %></option>
                                 			<option value="<%=dateStr5 %>"  > <%=dateStr5 %></option>
                                 			<option value="<%=dateStr6 %>"  > <%=dateStr6 %></option>
                                 			<option value="<%=dateStr7 %>"  > <%=dateStr7 %></option>
                                 			<option value="<%=dateStr8 %>"  > <%=dateStr8 %></option>
                                 			
                                 	</select>
						</span>

					</div>
				</div>

			</div>
			<div class="content wrapper50">
				<input type="submit" title="��ȸ" value="���ռ��� ��ȸ" class="btn_global">
			</div>
			<!-- E: CONTENT -->

			<!-- S: FOOTER -->
			<%@include file="/busiinc/appfooter.jsp"%>
			<!-- E: FOOTER -->
				</form>
			
		</div>
		<!-- E: WRAPPER -->


</body>
</html>
