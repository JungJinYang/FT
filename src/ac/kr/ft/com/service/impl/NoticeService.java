package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.NoticeComDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import ac.kr.ft.com.persistance.mapper.NoticeMapper;
import ac.kr.ft.com.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NoticeMapper")
	private NoticeMapper noticedao;

	@Override
	public List<NoticeDTO> getNoticeList() throws Exception {

		return noticedao.getNoticeList();
	}

	@Override
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDto, NoticeComDTO noticee) throws Exception {

		// ��ȸ�� �ø���
		noticedao.updateCntUppder(noticeDto);

		// ������ ��������
		NoticeDTO rDTO = noticedao.getNoticeDetail(noticeDto);

		// ��� ����Ʈ ��������
		rDTO.setrList(noticedao.getNoticeComList(noticee));

		return rDTO;
	}

	@Override
	public NoticeDTO getNoticeDetailInfo(NoticeDTO noticeDto) throws Exception {

		return noticedao.getNoticeDetail(noticeDto);
	}

	@Override
	public boolean createNoticeInfo(NoticeDTO noticeDto) throws Exception {

		int a = noticedao.createNoticeInfo(noticeDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteNoticeInfo(NoticeDTO noticeDto) throws Exception {
		int b = noticedao.deleteCommentInfo(noticeDto);
		int a = noticedao.deleteNoticeInfo(noticeDto);

		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateNoticeInfo(NoticeDTO noticeDto) throws Exception {
		int a = noticedao.updateNoticeInfo(noticeDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public void updateCntUpper(NoticeDTO noticeDto) throws Exception {
		noticedao.updateCntUppder(noticeDto);
	}

	@Override
	public void updatecomUppder(NoticeComDTO noticee) throws Exception {
		noticedao.updatecomUppder(noticee);
	}

	@Override
	public boolean deleteAllCheckList(NoticeDTO noticeDto) throws Exception {
		int b = noticedao.deleteAllCheckListComment(noticeDto);
		int a = noticedao.deleteAllCheckList(noticeDto);
		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}



	// ��� ����
	@Override
	public boolean deleteCommentInfo(NoticeDTO noticeDto) throws Exception {
		int a = noticedao.deleteCommentInfo(noticeDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean createComment(NoticeComDTO noticee) throws Exception {

		log.info("Service : createComment Start!");
		int a = noticedao.createComment(noticee);

		log.info("Service a : " + a);
		log.info("Service : createComment End!");

		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateComment(NoticeComDTO noticee) throws Exception {

		int a = noticedao.updateComment(noticee);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteComment(NoticeComDTO noticee) throws Exception {
		int a = noticedao.deleteComment(noticee);
		if (a != 0) {
			return true;
		}
		return false;
	}

	
	
	// ��� ����Ʈ
	@Override
	public NoticeComDTO getNoticeComList(NoticeComDTO noticee) throws Exception {

		// ��� ����Ʈ �� ��������
		NoticeComDTO rDTO = noticedao.getNoticeComListCnt(noticee);

		// ��� ����Ʈ ��������
		rDTO.setrList(noticedao.getNoticeComList(noticee));

		return rDTO;
	}
	
	
	
	@Override
	public NoticeDTO busiNoticeDetail(NoticeDTO noticeDto) throws Exception {

		// ��ȸ�� �ø���
		noticedao.updateCntUppder(noticeDto);

		// ������ ��������
		NoticeDTO rDTO = noticedao.getNoticeDetail(noticeDto);

		return rDTO;
	}

	
	
	/*
	 * #########################################################################
	 * #### # ����� ���� ���� #
	 * #########################################################################
	 * ####
	 */

	// �Խ��� ����Ʈ(�����)
	@Override
	public NoticeDTO getBusiList(NoticeDTO noticeDto) throws Exception {

		NoticeDTO rDTO = noticedao.getBusiListCnt(noticeDto);

		rDTO.seteList(noticedao.getBusiList(noticeDto));
		
		return rDTO;

	}

	// ��� ����Ʈ(�����)
	@Override
	public NoticeComDTO getBusiCommentList(NoticeComDTO noticee) throws Exception {

		// �Խ��� ����Ʈ �� ��������
		NoticeComDTO rDTO = noticedao.getBusiCommentListCnt(noticee);

		// �Խ��� ����Ʈ ��������
		rDTO.setrList(noticedao.getBusiCommentList(noticee));
			
		return rDTO;
	}

	/*
	 * #########################################################################
	 * #### # ����� ���� �� #
	 * #########################################################################
	 * ####
	 */

	/*
	 * #########################################################################
	 * #### # ����� ���� ���� #
	 * #########################################################################
	 * ####
	 */

	@Override
	public NoticeDTO getGuestList(NoticeDTO noticeDto) throws Exception {
		
		
		return null;
	}
	
	
	
	/*
	 * #########################################################################
	 * #### # ����� ���� �� #
	 * #########################################################################
	 * ####
	 */
	
	
}
