package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.CommunityComDTO;
import ac.kr.ft.com.dto.CommunityDTO;

public interface ICommunityService {
	//������ �� �Խ��� ����Ʈ
	List<CommunityDTO> getCommunityList() throws Exception;

	//������ �� �Խ��� �󼼺���
	CommunityDTO getCommunityDetail(CommunityDTO communityDto, CommunityComDTO comDto) throws Exception;

	//�۵���ϱ� ����Ʈ 
	boolean createCommunityInfo(CommunityDTO communityDto) throws Exception;

	
	boolean deleteCommunityInfo(CommunityDTO communityDto) throws Exception;

	boolean updateCommunityInfo(CommunityDTO communityDto) throws Exception;

	void updateCntUpper(CommunityDTO communityDto) throws Exception;

	boolean deleteAllCheckList(CommunityDTO communityDto) throws Exception;

	// ��۹�ȣ ����
	void updatecomUppder(CommunityComDTO comDto) throws Exception;

	CommunityDTO getCommunityDetailInfo(CommunityDTO communityDto) throws Exception;

	boolean createComment(CommunityComDTO comDto) throws Exception;

	boolean deleteComment(CommunityComDTO comDto) throws Exception;

	boolean updateComment(CommunityComDTO comDto) throws Exception;
	
	// �Խ��ǰ� ��� �Բ� �����
	boolean deleteCommentInfo(CommunityDTO communityDto) throws Exception;
	

	//�Խ��� ��� ����Ʈ ��������
	CommunityComDTO getCommunityComList(CommunityComDTO comDto) throws Exception;


	// �̺�Ʈ �󼼺���
	CommunityDTO busiCommunityDetail(CommunityDTO communityDto) throws Exception;
	

	

	
	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	CommunityDTO getBusiList(CommunityDTO communityDto) throws Exception;
	
	
	CommunityComDTO getBusiCommentList(CommunityComDTO comDto) throws Exception;

	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */
	
}
