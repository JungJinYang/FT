<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>
<%
	CtrDTO resultDTO = (CtrDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new CtrDTO();
	}
	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //����Ʈ ��
	
	List<CtrDTO> rList = (List<CtrDTO>)resultDTO.geteList(); //����Ʈ

	if (rList == null) {
		rList = new ArrayList<CtrDTO>();
	}
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\",\"list\":[");
int idx=0; //�ε���
System.out.println("����Ʈ������"+rList.size());

Iterator<CtrDTO> it = rList.iterator();
while(it.hasNext()){
	CtrDTO rDTO = (CtrDTO)it.next();
	
	if (rDTO==null){
		rDTO = new CtrDTO();
	}
	
	if(rDTO.getUser_name().length()>=7){
		rDTO.setUser_name(rDTO.getUser_name().substring(0,5)+"...");
	}

	idx++; //�ε��� ����
	
	out.println("{");
	out.println("\"CTR_SEQ\":\""+ CmmUtil.nvl(rDTO.getCtr_seq()) +"\",");
	out.println("\"TITLE\":\""+ CmmUtil.nvl(rDTO.getTitle()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"REG_DT\":\""+ CmmUtil.nvl(rDTO.getReg_dt()) +"\",");
	out.println("\"PROGRESS\":\""+ CmmUtil.nvl(rDTO.getProgress()) +"\"");
	out.println("}");
	
	//����Ʈũ��� �ε����� ���ٸ� "," ��¾���
System.out.println(ListCnt);
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>
