<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%
	if (CmmUtil.nvl((String)session.getAttribute("USER_NO")) == null || CmmUtil.nvl((String)session.getAttribute("USER_NAME")).equals("")) {
%>
<div class="footer">
	<div class="share">
		<a onclick="facebook()"><img alt='���̽���' src="/img/facebook.png" /></a>
		&nbsp; <a onclick="instagram()"><img alt='�ν�Ÿ�׷�'
			src="/img/instagram.png" /></a> <br />
	</div>
	<div class='contact'>
		<img alt='���Ǫ��Ʈ���ΰ�' src="/img/logo.png" style="width:50px; height:40px;"/>
		<font size="2">
			<span>
			��ǥ�� : ���ֿ� &nbsp;���� : �̵��� ����<br/>
			��ȭ : 010-9120-0514<br/>
			����ڵ�Ϲ�ȣ : 231-07-00374 <br/>
			���� �ּ� : ����� ���빮�� �̹��� 86-9����
			</span>
		</font>
	</div>
</div>

<%
	} else {
%>

<div class="footer">
	<div class="share">
		<a onclick="facebook()"><img alt='���̽���' src="/img/facebook.png" /></a>
		&nbsp; <a onclick="instagram()"><img alt='�ν�Ÿ�׷�'
			src="/img/instagram.png" /></a> <br />
	</div>
	<div class='contact'>
		<img alt='���Ǫ��Ʈ���ΰ�' src="/img/logo.png" style="width:50px; height:40px;"/>
		<font size="2">
			<span>
			��ǥ�� : ���ֿ� &nbsp;���� : �̵��� ����<br/>
			��ȭ : 010-9120-0514<br/>
			����ڵ�Ϲ�ȣ : 231-07-00374 <br/>
			���� �ּ� : ����� ���빮�� �̹��� 86-9����
			</span>
		</font>
	</div>
	<button onclick="location.href='/user/appLogout.do'";>
		<span>�α׾ƿ�</span>
	</button>
</div>


<%
	}
%>