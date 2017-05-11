<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%

UserDTO resultDTO = (UserDTO)request.getAttribute("rDTO");

if (resultDTO==null){
	resultDTO = new UserDTO();
	
}

int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //��� ����Ʈ ��

List<UserDTO> rList = (List<UserDTO>)resultDTO.getrList(); //��� ����Ʈ

if (rList == null) {
	rList = new ArrayList<UserDTO>();
}

%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\",\"list\":[");
int idx=0; //�ε���

Iterator<UserDTO> it = rList.iterator();
while(it.hasNext()){
	UserDTO rDTO = (UserDTO)it.next();
	if (rDTO==null){
		rDTO = new UserDTO();
	}
	
	idx++; //�ε��� ����
	
	out.println("{");
	out.println("\"USER_NO\":\""+ CmmUtil.nvl(rDTO.getUser_no()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"EMAIL1\":\""+ CmmUtil.nvl(rDTO.getEmail1()) +"\",");
	out.println("\"EMAIL2\":\""+ CmmUtil.nvl(rDTO.getEmail2()) +"\"");
	out.println("}");
	
	//����Ʈũ��� �ε����� ���ٸ� "," ��¾���
	if (idx!=ListCnt){
		out.println(",");
	}
}
out.println("]}");
%>

