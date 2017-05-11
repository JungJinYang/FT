<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<body>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: FLOAT -->
		<!-- �α��� �� -->
		<%
			if (CmmUtil.nvl((String)session.getAttribute("AUTH")).equals("U")) {
		%>

		<!-- �����  -->

		<div class="float" id='float' style='display: none;'>
			<div>
				<div class="content">
					<header>
						<span><strong><a style="color: #FFFFFF"
								;
								href="/user/guestUserDetail.do?user_no=<%=session.getAttribute("USER_NO")%>"><%=session.getAttribute("USER_NAME")%></a>��
								�ȳ��ϼ���!</strong><br />��ſ� �Ϸ� �Ǽ���!<br/><br/>
								���� ���ϸ��� : <strong><%=session.getAttribute("MILEAGE")%></strong></span>
					</header>
					<ul>
						<li><button>Ŀ�´�Ƽ</button></li>
						<li><a href="/notice/guestnoticeList.do"><button
									class='msub'>- ��������</button></a></li>
						<li><a href="/community/guestcommunityList.do"><button
									class='msub'>- �� Ŀ�´�Ƽ</button></a></li>
						<li><a href="/event/guestEventList.do"><button
									class='msub'>- �̺�Ʈ</button></a></li>
						<li><button>�޴�����</button></li>
						<li><a href="/menu/userMenuList.do"><button class='msub'>-
									�޴�</button></a></li>
						<li><a href="/hyg/userHygList.do"><button class='msub'>-
									����������</button></a></li>
						<li><button>�����͸�</button></li>
						<li><a href="/ctr/GuestctrList.do"><button class='msub'>-
									��㹮��</button></a></li>
						<li><a href="/ctr/GuestctrRegform.do"><button class='msub'>-
									�ֹ��ϱ�</button></a></li>
						<li><button>���� �� ��ġ ��ȸ</button></li>
						<li><a href="/guest/schedule/calendar.do"><button
									class='msub'>- ����</button></a></li>
						<li><a href="/busi/position/position.do"><button
									class='msub'>- ��ġ ��ȸ</button></a></li>
					</ul>
					<div>
						<a href="/user/appLogout.do"><input type="button" title="�α׾ƿ�"
							value="�α׾ƿ�" class="btn_global"></a>
					</div>
				</div>
			</div>
			<div class="dim"  onclick='closeFloatMenu();'>
				<a href="#" class="close"></a>
			</div>
		</div>

		<%
			} else if (CmmUtil.nvl((String)session.getAttribute("AUTH")).equals("") || CmmUtil.nvl((String)session.getAttribute("AUTH")) == null) {
		%>

		<!-- ��α���  -->

		<div class="float" id='float' style='display: none;'>
			<div>
				<div class="content">
					<div>
						<a href="/user/appLoginForm.do"><input type="button"
							title="�α���" value="�α���" class="btn_global"></a>
					</div>
					<ul>
						<li><button>Ŀ�´�Ƽ</button></li>
						<li><a href="/notice/guestnoticeList.do"><button
									class='msub'>- ��������</button></a></li>
						<li><a href="/community/guestcommunityList.do"><button
									class='msub'>- �� Ŀ�´�Ƽ</button></a></li>
						<li><a href="/event/guestEventList.do"><button
									class='msub'>- �̺�Ʈ</button></a></li>
						<li><button>�޴�����</button></li>
						<li><a href="/menu/userMenuList.do"><button class='msub'>-
									�޴�</button></a></li>
						<li><a href="/hyg/userHygList.do"><button class='msub'>-
									����������</button></a></li>
						<li><button>�����͸�</button></li>
						<li><a href="/ctr/GuestctrList.do"><button class='msub'>-
									��㹮��</button></a></li>
						<li><a href="/ctr/GuestctrRegform.do"><button class='msub'>-
									�ֹ��ϱ�</button></a></li>
						<li><button>���� �� ��ġ ��ȸ</button></li>
						<li><a href="/guest/schedule/calendar.do"><button
									class='msub'>- ����</button></a></li>
						<li><a href="/busi/position/position.do"><button
									class='msub'>- ��ġ ��ȸ</button></a></li>
					</ul>
					<div>
						<a href="/user/guestUserInsertForm.do"><input type="button"
							title="ȸ������" value="ȸ������" class="btn_tri"></a> <a
							href="/user/appIdFindForm.do"><input type="button"
							title="���̵� ã��" value="���̵� ã��" class="btn_tri"></a> <a
							href="/user/appPwFindForm.do"><input type="button"
							title="��й�ȣ ã��" value="��й�ȣ ã��" class="btn_tri"></a>
					</div>
				</div>
			</div>
			<div class="dim" onclick='closeFloatMenu();'>
				<a href="#" class="close"></a>
			</div>
		</div>

		<%
			} else {
		%>
		<script>
			alert('������ ���ų� �߸��� �����Դϴ�');
			history.go(-1);
		</script>
		<%
			}
		%>
	</div>
	<!-- E: WRAPPER -->
</body>

