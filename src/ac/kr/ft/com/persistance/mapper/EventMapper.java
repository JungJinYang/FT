package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.EventComDTO;
import ac.kr.ft.com.dto.EventDTO;
import config.Mapper;

@Mapper("EventMapper")
public interface EventMapper {

    List<EventDTO> getEventList() 					throws Exception;
 

    EventDTO getEventDetail(EventDTO eventDto)		throws Exception;

    
    int createEventInfo(EventDTO eventDto)			throws Exception;

	int deleteEventInfo(EventDTO eventDto)			throws Exception;

	int updateEventInfo(EventDTO eventDto)			throws Exception;

	void updateCntUppder(EventDTO eventDto) 		throws Exception;
	
	int deleteAllCheckList(EventDTO eventDto)		throws Exception;
	
	int deleteCommentInfo(EventDTO eventDto)		throws Exception; //��� ����

	void updatecomUppder(EventComDTO evee)			throws Exception; //��۹�ȣ ����
	
	
	int deleteAllCheckListComment(EventDTO eventDto)  throws Exception;

	//��� ���
	int createComment(EventComDTO evee)				 throws Exception;
		
	//��� ���� �Ѱ��Ѱ� ����
	int deleteComment(EventComDTO evee) 			 throws Exception;

	//��� ����
	int updateComment(EventComDTO evee) 			 throws Exception;

	
	//�Խ��� �� ��� ����Ʈ
	List<EventComDTO> getEventComList(EventComDTO evee) throws Exception;
	
	//�Խ��� �� ��� ũ�� ��������
	EventComDTO getEventComListCnt(EventComDTO evee)   throws Exception;
	
	
	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	//�Խ��� ����Ʈ
	List<EventDTO> getBusiList(EventDTO eventDto)			throws Exception;
	
	//�Խ��� ����Ʈ ũ�� ��������
	EventDTO getBusiListCnt(EventDTO eventDto) 				throws Exception;
	
	//��� ����Ʈ
	List<EventComDTO> getBusiCommentList(EventComDTO evee)	throws Exception;
	
	//��� ����Ʈ ũ�� ��������
	EventComDTO getBusiCommentListCnt(EventComDTO evee)		throws Exception;	
	
	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */	
	
}
