package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.ComDTO;
import ac.kr.ft.com.dto.EmpDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import ac.kr.ft.com.dto.VisitorDTO;
import config.Mapper;

@Mapper("CommMapper")
public interface CommMapper {

	VisitorDTO getTodayVisitor() throws Exception;

	int visitorUpdate(VisitorDTO visitorDto) throws Exception;

	int visitorInsert() throws Exception;

	VisitorDTO getVisitorDto() throws Exception;

	ComDTO getCtrR_cnt() throws Exception;

	ComDTO getCommunityCnt() throws Exception;

	List<ComDTO> getCommentList() throws Exception;

	List<ComDTO> getJsonList() throws Exception;
	
	//�������� �ҷ�����
	List<ComDTO> getNewList() throws Exception;
	
	//�̺�Ʈ ����Ʈ �ҷ�����
	
}
