package ac.kr.ft.com.service;

import java.util.List;

import org.json.simple.JSONObject;

import ac.kr.ft.com.dto.SalesDTO;

public interface ISalesService {
	
	//��� ��� ���� ����Ʈ ��ȸ  �ϱ�
	SalesDTO getBusiSalesList(SalesDTO pDTO) throws Exception;
	
	//��� ��� ���� ������
	JSONObject getBusiSalesDetail(SalesDTO pDTO) throws Exception;
	
	//��� ��� ������-���� ��Ʈ
	SalesDTO getBusiSalesDonutsChart(SalesDTO pDTO) throws Exception;
	
	//��� ��� ������(��� �̸���������)
	SalesDTO getBusiSalesNmInfo(SalesDTO pDTO) throws Exception;
	
	//��� ��� ������(����������, �ű� â�� ���� ���� ����Ʈ)
	List<SalesDTO> getBusiSalesBarChart(SalesDTO pDTO)	throws Exception;		
	
	
	
	
	//���� ��� ������(�⺻)-�н���, �н�ƮǪ����, Ŀ������ ������� ��������
	JSONObject getBusiFestivaSalesNmInfo(SalesDTO pDTO) throws Exception;
	
	//���� ��� ������(�⺻)-������Ʈ
	SalesDTO getBusiFestivaSalesNmInfoDonuts(SalesDTO pDTO) throws Exception;	
	
	//���� ��� ������(�⺻)-����Ʈ
	List<SalesDTO> getFestivaSalesNmInfoBarChart(SalesDTO pDTO) throws Exception;
}
