package ac.kr.ft.com.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.SalesDTO;
import ac.kr.ft.com.persistance.mapper.SalesMapper;
import ac.kr.ft.com.service.ISalesService;
import ac.kr.ft.com.util.CmmUtil;

@Service("SalesService")
public class SalesService implements ISalesService {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name="SalesMapper")
	private SalesMapper salesMapper;
	
	@Override
	public SalesDTO getBusiSalesList(SalesDTO pDTO) throws Exception{
		
		SalesDTO rDTO = salesMapper.getBusiSalesListCnt(pDTO);	
		log.info("SalesMapper.getBusiSalesListCnt!!");

		rDTO.setrList(salesMapper.getBusiSalesList(pDTO));
		log.info("SalesMapper.getBusiSalesList!!");
		
		return rDTO;
	}
	
	@Override
	public JSONObject getBusiSalesDetail(SalesDTO pDTO) throws Exception{

		//��Ʈ�� �׸��� ���� ���� ����!
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<SalesDTO> rlist = salesMapper.getBusiSalesDetail(pDTO);
		
		if (rlist==null){
			rlist = new ArrayList<SalesDTO>();
			
		}
		
		Iterator<SalesDTO> it = rlist.iterator();
		
		jsonObject.put("element", "morris-area-chart");
		jsonObject.put("xkey", "period");
		jsonObject.put("pointSize", 2);
		jsonObject.put("hideHover", "auto");
		jsonObject.put("resize", true);
		
		jsonArray.add("�н���");
		jsonArray.add("�н�ƮǪ����");
		jsonArray.add("Ŀ������");
		
		jsonObject.put("ykeys", jsonArray);
		jsonObject.put("labels", jsonArray);
		
		jsonArray = new JSONArray();
		
		while(it.hasNext()){
			SalesDTO rDTO = (SalesDTO)it.next();
			
			if(rDTO == null){
				rDTO = new SalesDTO();
			}
			
			JSONObject comJson = new JSONObject();
			
			comJson.put("days", CmmUtil.nvl(rDTO.getYyyymm()));
			comJson.put("�н���", CmmUtil.nvl(rDTO.getSt_cd_cs100005()));
			comJson.put("�н�ƮǪ����", CmmUtil.nvl(rDTO.getSt_cd_cs100006()));
			comJson.put("Ŀ������", CmmUtil.nvl(rDTO.getSt_cd_cs100009()));
			
			jsonArray.add(comJson);
		}
		
		jsonObject.put("data", jsonArray);
		
		//��Ʈ�� �׸��� ���� ���� ��!		
		
		return jsonObject;
	}
	
	@Override
	public SalesDTO getBusiSalesDonutsChart(SalesDTO pDTO) throws Exception{
		
		log.info("SalesMapper.getBusiSalesDonutsChart!!");

		SalesDTO rDTO = salesMapper.getBusiSalesDonutsChart(pDTO);	

		return rDTO;
	}
	
	@Override
	public SalesDTO getBusiSalesNmInfo(SalesDTO pDTO) throws Exception{
		
		log.info("SalesMapper.getBusiSalesNmInfo!!");
		
		SalesDTO rDTO = salesMapper.getBusiSalesNmInfo(pDTO);	
		
		return rDTO;
	}
	
	
	//��� ��� ������(����������, �ű� â�� ���� ���� ����Ʈ)
	public List<SalesDTO> getBusiSalesBarChart(SalesDTO pDTO) throws Exception{
	
		return salesMapper.getBusiSalesBarChart(pDTO);
		
	}
	
	
	@Override
	public JSONObject getBusiFestivaSalesNmInfo(SalesDTO pDTO) throws Exception{

		//��Ʈ�� �׸��� ���� ���� ����!
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<SalesDTO> rlist = salesMapper.getBusiFestivaSalesNmInfo(pDTO);
		
		if (rlist==null){
			rlist = new ArrayList<SalesDTO>();
			
		}
		
		Iterator<SalesDTO> it = rlist.iterator();
		
		jsonObject.put("element", "morris-area-chart");
		jsonObject.put("xkey", "period");
		jsonObject.put("pointSize", 2);
		jsonObject.put("hideHover", "auto");
		jsonObject.put("resize", true);
		
		jsonArray.add("�н���");
		jsonArray.add("�н�ƮǪ����");
		jsonArray.add("Ŀ������");
		
		jsonObject.put("ykeys", jsonArray);
		jsonObject.put("labels", jsonArray);
		
		jsonArray = new JSONArray();
		
		while(it.hasNext()){
			SalesDTO rDTO = (SalesDTO)it.next();
			
			if(rDTO == null){
				rDTO = new SalesDTO();
			}
			
			JSONObject comJson = new JSONObject();
			
			comJson.put("days", CmmUtil.nvl(rDTO.getYyyymm()));
			comJson.put("�н���", CmmUtil.nvl(rDTO.getSt_cd_cs100005()));
			comJson.put("�н�ƮǪ����", CmmUtil.nvl(rDTO.getSt_cd_cs100006()));
			comJson.put("Ŀ������", CmmUtil.nvl(rDTO.getSt_cd_cs100009()));
			
			jsonArray.add(comJson);
		}
		
		jsonObject.put("data", jsonArray);
		
		//��Ʈ�� �׸��� ���� ���� ��!		
		
		return jsonObject;
	}	
	
	//���� ��� ������(�⺻)-������Ʈ
	@Override
	public SalesDTO getBusiFestivaSalesNmInfoDonuts(SalesDTO pDTO) throws Exception{
		
		log.info("SalesMapper.getBusiFestivaSalesNmInfoDonuts!!");

		SalesDTO rDTO = salesMapper.getBusiFestivaSalesNmInfoDonuts(pDTO);	

		return rDTO;
	}
	
	//���� ��� ������(����������, �ű� â�� ���� ���� ����Ʈ)
	public List<SalesDTO> getFestivaSalesNmInfoBarChart(SalesDTO pDTO) throws Exception{
		log.info("SalesMapper.getFestivaSalesNmInfoBarChart!!");
	
		return salesMapper.getFestivaSalesNmInfoBarChart(pDTO);
		
	}	
	
	
}
