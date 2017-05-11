package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.SalesDTO;
import config.Mapper;

@Mapper("SalesMapper")
public interface SalesMapper {

	//��� ��� ���� ����Ʈ ��ȸ  �ϱ�
	List<SalesDTO> getBusiSalesList(SalesDTO pDTO)	throws Exception;
	
	//��� ��� ���� ����Ʈ �� ��������
	SalesDTO getBusiSalesListCnt(SalesDTO pDTO) throws Exception;
	
	//��� ��� ������(�⺻)-�н���, �н�ƮǪ����, Ŀ������ ������� ��������
	List<SalesDTO> getBusiSalesDetail(SalesDTO pDTO) throws Exception;
	
	//��� ��� ������-���� ��Ʈ
	SalesDTO getBusiSalesDonutsChart(SalesDTO pDTO) throws Exception;
	
	//��� ��� ������(��� �̸���������)
	SalesDTO getBusiSalesNmInfo(SalesDTO pDTO) throws Exception;
	
	//��� ��� ������(����������, �ű� â�� ���� ���� ����Ʈ)
	List<SalesDTO> getBusiSalesBarChart(SalesDTO pDTO)	throws Exception;	
	
	//���� ��� ������(�⺻)-�н���, �н�ƮǪ����, Ŀ������ ������� ��������
	List<SalesDTO> getBusiFestivaSalesNmInfo(SalesDTO pDTO) throws Exception;
	
	//���� ��� ������(�⺻)-������Ʈ
	SalesDTO getBusiFestivaSalesNmInfoDonuts(SalesDTO pDTO) throws Exception;
	
	//���� ��� ������(�⺻)-����Ʈ
	List<SalesDTO> getFestivaSalesNmInfoBarChart(SalesDTO pDTO) throws Exception;
	
}

