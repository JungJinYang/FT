package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.EventComDTO;
import ac.kr.ft.com.dto.EventDTO;

public interface IEventService {
	//������ �� �Խ��� ����Ʈ
	List<EventDTO> getEventList() throws Exception;

	//������ �� �Խ��� �󼼺���
	EventDTO getEventDetail(EventDTO eventDto, EventComDTO evee) throws Exception;

	//�۵���ϱ� ����Ʈ 
	boolean createEventInfo(EventDTO eventDto) throws Exception;

	
	boolean deleteEventInfo(EventDTO eventDto) throws Exception;

	boolean updateEventInfo(EventDTO eventDto) throws Exception;

	void updateCntUpper(EventDTO eventDto) throws Exception;

	boolean deleteAllCheckList(EventDTO eventDto) throws Exception;

	// ��۹�ȣ ����
	void updatecomUppder(EventComDTO evee) throws Exception;

	EventDTO getEventDetailInfo(EventDTO eventDto) throws Exception;

	boolean createComment(EventComDTO evee) throws Exception;

	boolean deleteComment(EventComDTO evee) throws Exception;

	boolean updateComment(EventComDTO evee) throws Exception;
	
	// �Խ��ǰ� ��� �Բ� �����
	boolean deleteCommentInfo(EventDTO eventDto) throws Exception;
	
	//�Խ��� ��� ����Ʈ ��������
	EventComDTO getEventComList(EventComDTO evee) throws Exception;

	// �̺�Ʈ �󼼺���
	EventDTO busiEventDetail(EventDTO eventDto) throws Exception;
	
	
	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	EventDTO getBusiList(EventDTO eventDto) throws Exception;
	
	
	EventComDTO getBusiCommentList(EventComDTO evee) throws Exception;

	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */
	

	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	EventDTO getGuestList(EventDTO eventDto) throws Exception;
	
	
	
		
	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */
	
	
}
