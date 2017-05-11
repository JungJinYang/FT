package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.NoticeComDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import config.Mapper;

@Mapper("NoticeMapper")
public interface NoticeMapper {

    List<NoticeDTO> getNoticeList() 					throws Exception;
 

    NoticeDTO getNoticeDetail(NoticeDTO noticeDto)		throws Exception;

    
    int createNoticeInfo(NoticeDTO noticeDto)			throws Exception;

	int deleteNoticeInfo(NoticeDTO noticeDto)			throws Exception;

	int updateNoticeInfo(NoticeDTO noticeDto)			throws Exception;

	void updateCntUppder(NoticeDTO noticeDto) 		throws Exception;
	
	int deleteAllCheckList(NoticeDTO noticeDto)		throws Exception;
	
	int deleteCommentInfo(NoticeDTO noticeDto)		throws Exception; //��� ����

	void updatecomUppder(NoticeComDTO noticee)			throws Exception; //��۹�ȣ ����
	
	
	int deleteAllCheckListComment(NoticeDTO noticeDto)  throws Exception;

	//��� ���
	int createComment(NoticeComDTO noticee)				 throws Exception;
		
	//��� ���� �Ѱ��Ѱ� ����
	int deleteComment(NoticeComDTO noticee) 			 throws Exception;

	//��� ����
	int updateComment(NoticeComDTO noticee) 			 throws Exception;

	
	//�Խ��� �� ��� ����Ʈ
	List<NoticeComDTO> getNoticeComList(NoticeComDTO noticee) throws Exception;
	
	//�Խ��� �� ��� ũ�� ��������
	NoticeComDTO getNoticeComListCnt(NoticeComDTO noticee)   throws Exception;
	
	
	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	//�Խ��� ����Ʈ
	List<NoticeDTO> getBusiList(NoticeDTO noticeDto)			throws Exception;
	
	//�Խ��� ����Ʈ ũ�� ��������
	NoticeDTO getBusiListCnt(NoticeDTO noticeDto) 				throws Exception;
	
	//��� ����Ʈ
	List<NoticeComDTO> getBusiCommentList(NoticeComDTO noticee)	throws Exception;
	
	//��� ����Ʈ ũ�� ��������
	NoticeComDTO getBusiCommentListCnt(NoticeComDTO noticee)		throws Exception;	
	
	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */	
	
}