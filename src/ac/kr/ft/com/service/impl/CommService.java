package ac.kr.ft.com.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.ComDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import ac.kr.ft.com.dto.VisitorDTO;
import ac.kr.ft.com.persistance.mapper.CommMapper;
import ac.kr.ft.com.service.ICommService;

@Service("CommService")
public class CommService implements ICommService{
	@Resource(name="CommMapper")
	private CommMapper commMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public void setVisitor() throws Exception {
		VisitorDTO visitorDto = commMapper.getTodayVisitor();
		if(visitorDto == null){
			visitorDto = new VisitorDTO();
		}
		if(visitorDto.getTo_code() == null){
			visitorDto.setTo_code("0");
		}
		// to_code�� 1�̸� today�� ������ ������
		if(visitorDto.getTo_code().equals("1")){
			// update����
			int visitor_cnt = (Integer.parseInt(visitorDto.getVisitor_cnt()))+1;
			visitorDto.setVisitor_cnt(""+visitor_cnt);
			// 0�� �ƴϸ� ���� �߻�
			if(commMapper.visitorUpdate(visitorDto) !=0){
				log.info("�湮�ڼ� ���");
			}else{
				log.info("�湮�ڼ� ��½���");
			}
		}else{
			// to_code�� 0�̸� insert
			if(commMapper.visitorInsert() != 0){
				log.info("TODAY ����");
			}else{
				log.info("TODAY ���� ����");
			}
		}
	}

	@Override
	public VisitorDTO getVisitorDto() throws Exception {
		return commMapper.getVisitorDto();
	}

	@Override
	public ComDTO getComDto() throws Exception {
		ComDTO resultCom = new ComDTO();
		
		ComDTO ctrRDto = commMapper.getCtrR_cnt();
		// null ����ó��
		if(ctrRDto == null){
			ctrRDto = new ComDTO();
		}
		if(ctrRDto.getCtrR_cnt() == null){
			ctrRDto.setCtrR_cnt("0");
		}
		log.info("ctrR_cnt:"+ctrRDto.getCtrR_cnt());
		
		ComDTO cntDto = commMapper.getCommunityCnt();
		if(cntDto == null){
			cntDto = new ComDTO();
		}
		if(cntDto.getCommunity_cnt() == null){
			cntDto.setCommunity_cnt("0");
		}
		log.info("ctrComm_cnt:"+cntDto.getCommunity_cnt());
		
		resultCom.setCtrR_cnt(ctrRDto.getCtrR_cnt());
		resultCom.setCommunity_cnt(cntDto.getCommunity_cnt());
		
		return resultCom;
	}

	@Override
	public List<ComDTO> getCommentList() throws Exception {
		return commMapper.getCommentList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getJsonObject() throws Exception {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<ComDTO> list = commMapper.getJsonList();
		Iterator<ComDTO> it = list.iterator();
		
		jsonObject.put("element", "morris-area-chart");
		jsonObject.put("xkey", "period");
		jsonObject.put("pointSize", 2);
		jsonObject.put("hideHover", "auto");
		jsonObject.put("resize", true);
		
		jsonArray.add("�湮�� ��");
		jsonArray.add("���ο� ����");
		jsonArray.add("���ο� �ֹ�");
		
		jsonObject.put("ykeys", jsonArray);
		jsonObject.put("labels", jsonArray);
		
		jsonArray = new JSONArray();
		
		while(it.hasNext()){
			ComDTO comDto = (ComDTO)it.next();
			
			if(comDto == null){
				comDto = new ComDTO();
			}
			
			JSONObject comJson = new JSONObject();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			Date reg_date = dateFormat.parse(comDto.getReg_dt());
			dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			comJson.put("days", dateFormat.format(reg_date));
			comJson.put("�湮�� ��", comDto.getVisitor_cnt());
			comJson.put("���ο� ����", comDto.getCommunity_cnt());
			comJson.put("���ο� �ֹ�", comDto.getCtrR_cnt());
			
			jsonArray.add(comJson);
		}
		
		jsonObject.put("data", jsonArray);
		
		return jsonObject;
	}

	@Override
	public List<ComDTO> getNewList() throws Exception {
		// TODO Auto-generated method stub
		return commMapper.getNewList();
	}


}
