<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.NoticeComDTO"%>
<%
	NoticeComDTO resultDTO = (NoticeComDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new NoticeComDTO();
		
	}
	
	
	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //��� ����Ʈ ��

	
	List<NoticeComDTO> rList = (List<NoticeComDTO>)resultDTO.getrList(); //��� ����Ʈ
	
	if (rList == null) {
		rList = new ArrayList<NoticeComDTO>();
	}
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\", \"list\":[");

int idx=0; //�ε���

Iterator<NoticeComDTO> it = rList.iterator();
while(it.hasNext()){
	NoticeComDTO rDTO = (NoticeComDTO)it.next();
		
	if (rDTO==null){
		rDTO = new NoticeComDTO();
	}
	
	idx++; //�ε��� ����
	
	
	out.println("{");
	out.println("\"USER_NO\":\""+ CmmUtil.nvl(rDTO.getUser_no()) +"\",");
	out.println("\"NOTICE_SEQ\":\""+ CmmUtil.nvl(rDTO.getNotice_seq()) +"\",");
	out.println("\"COMT_SEQ\":\""+ CmmUtil.nvl(rDTO.getCom_seq()) +"\",");
	out.println("\"CONTENTS\":\""+ CmmUtil.nvl(rDTO.getContents()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"REG_DT\":\""+ CmmUtil.nvl(rDTO.getReg_dt()) +"\"");
	out.println("}");
	
	//����Ʈũ��� �ε����� ���ٸ� "," ��¾���
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>
