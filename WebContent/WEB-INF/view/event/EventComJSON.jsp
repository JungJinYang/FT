<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.EventDTO"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.EventComDTO"%>
<%
	EventComDTO resultDTO = (EventComDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new EventComDTO();
		
	}
	
	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //��� ����Ʈ ��
	
	List<EventComDTO> rList = (List<EventComDTO>)resultDTO.getrList(); //��� ����Ʈ
     
	if (rList == null) {
		rList = new ArrayList<EventComDTO>();
	}
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\", \"list\":[");

int idx=0; //�ε���

Iterator<EventComDTO> it = rList.iterator();
while(it.hasNext()){
	EventComDTO rDTO = (EventComDTO)it.next();
	
	if (rDTO==null){
		rDTO = new EventComDTO();
	}

	idx++; //�ε��� ����

	out.println("{");
	out.println("\"ENT_SEQ\":\""+ CmmUtil.nvl(rDTO.getEnt_seq()) +"\",");
	out.println("\"COMT_SEQ\":\""+ CmmUtil.nvl(rDTO.getCom_seq()) +"\",");
	out.println("\"CONTENTS\":\""+ CmmUtil.nvl(rDTO.getContents()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"REG_DT\":\""+ CmmUtil.nvl(rDTO.getReg_dt()) +"\",");
	out.println("\"CHG_DT\":\""+ CmmUtil.nvl(rDTO.getChg_dt()) +"\"");
	out.println("}");
	
	//����Ʈũ��� �ε����� ���ٸ� "," ��¾���
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>

