package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.NoticeComDTO;
import ac.kr.ft.com.dto.NoticeDTO;

public interface INoticeService {
	//������ �� �Խ��� ����Ʈ
	List<NoticeDTO> getNoticeList() throws Exception;

	//������ �� �Խ��� �󼼺���
	NoticeDTO getNoticeDetail(NoticeDTO noticeDto, NoticeComDTO noticee) throws Exception;

	//�۵���ϱ� ����Ʈ 
	boolean createNoticeInfo(NoticeDTO noticeDto) throws Exception;

	
	boolean deleteNoticeInfo(NoticeDTO noticeDto) throws Exception;

	boolean updateNoticeInfo(NoticeDTO noticeDto) throws Exception;

	void updateCntUpper(NoticeDTO noticeDto) throws Exception;

	boolean deleteAllCheckList(NoticeDTO noticeDto) throws Exception;

	// ��۹�ȣ ����
	void updatecomUppder(NoticeComDTO noticee) throws Exception;

	NoticeDTO getNoticeDetailInfo(NoticeDTO noticeDto) throws Exception;

	boolean createComment(NoticeComDTO noticee) throws Exception;

	boolean deleteComment(NoticeComDTO noticee) throws Exception;

	boolean updateComment(NoticeComDTO noticee) throws Exception;
	
	// �Խ��ǰ� ��� �Բ� �����
	boolean deleteCommentInfo(NoticeDTO noticeDto) throws Exception;
	
	//�Խ��� ��� ����Ʈ ��������
	NoticeComDTO getNoticeComList(NoticeComDTO noticee) throws Exception;

	// �̺�Ʈ �󼼺���
	NoticeDTO busiNoticeDetail(NoticeDTO noticeDto) throws Exception;
	

	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	
	NoticeDTO getBusiList(NoticeDTO noticeDto) throws Exception;
	
	
	NoticeComDTO getBusiCommentList(NoticeComDTO noticee) throws Exception;

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
	NoticeDTO getGuestList(NoticeDTO noticeDto) throws Exception;
	
	

	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */
	
	
}