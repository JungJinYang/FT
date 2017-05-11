<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CommunityDTO"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.CommunityComDTO"%>
<%
	CommunityComDTO resultDTO = (CommunityComDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new CommunityComDTO();
		
	}
	
	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //��� ����Ʈ ��
	
	List<CommunityComDTO> rList = (List<CommunityComDTO>)resultDTO.getrList(); //��� ����Ʈ
     
	if (rList == null) {
		rList = new ArrayList<CommunityComDTO>();
	}
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\", \"list\":[");

int idx=0; //�ε���

Iterator<CommunityComDTO> it = rList.iterator();
while(it.hasNext()){
	CommunityComDTO rDTO = (CommunityComDTO)it.next();
	
	if (rDTO==null){
		rDTO = new CommunityComDTO();
	}

	idx++; //�ε��� ����

	out.println("{");
	out.println("\"CMT_SEQ\":\""+ CmmUtil.nvl(rDTO.getCmt_seq()) +"\",");
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
