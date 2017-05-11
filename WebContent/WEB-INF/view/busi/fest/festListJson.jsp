<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@page import="java.util.List"%>
<%

   FestivalDTO reList = (FestivalDTO)request.getAttribute("rList");
//FestivalDTO festDTO = (FestivalDTO)request.getAttribute("rDTO");
 
if (reList == null) {
	reList = new FestivalDTO();
}
int ListCnt = Integer.parseInt(CmmUtil.nvl(reList.getCnt(),"0")); 

List<FestivalDTO> rList = (List<FestivalDTO>)reList.geteList(); //��� ����Ʈ

if (rList == null) {
	rList = new ArrayList<FestivalDTO>();
} 

%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\",\"list\":[");
int idx=0; //�ε���

Iterator<FestivalDTO> it = rList.iterator();
while(it.hasNext()){
	FestivalDTO rDTO = (FestivalDTO)it.next();
	
	if (rDTO==null){
		rDTO = new FestivalDTO();
	}
	
	idx++; //�ε��� ����
	
	out.println("{");
	out.println("\"FST_SEQ\":\""+ CmmUtil.nvl(rDTO.getFst_seq()) +"\",");
	out.println("\"City\":\""+ CmmUtil.nvl(rDTO.getCity()) +"\",");
	out.println("\"Local\":\""+ CmmUtil.nvl(rDTO.getLocal()) +"\",");
	out.println("\"Attractions\":\""+ CmmUtil.nvl(rDTO.getAttractions()) +"\",");
	out.println("\"Nation\":\""+ CmmUtil.nvl(rDTO.getNation()) +"\"");
	out.println("}");
	
	//����Ʈũ��� �ε����� ���ٸ� "," ��¾���
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>

