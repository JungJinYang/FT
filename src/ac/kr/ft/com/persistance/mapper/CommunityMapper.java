package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.CommunityComDTO;
import ac.kr.ft.com.dto.CommunityDTO;
import config.Mapper;

@Mapper("CommunityMapper")
public interface CommunityMapper {

    List<CommunityDTO> getCommunityList() 					throws Exception;
 

    CommunityDTO getCommunityDetail(CommunityDTO communityDto)		throws Exception;

    
    int createCommunityInfo(CommunityDTO communityDto)			throws Exception;

	int deleteCommunityInfo(CommunityDTO communityDto)			throws Exception;

	int updateCommunityInfo(CommunityDTO communityDto)			throws Exception;

	void updateCntUppder(CommunityDTO communityDto) 		throws Exception;
	
	int deleteAllCheckList(CommunityDTO communityDto)		throws Exception;
	
	int deleteCommentInfo(CommunityDTO communityDto)		throws Exception; //��� ����

	void updatecomUppder(CommunityComDTO comDto)			throws Exception; //��۹�ȣ ����
	
	
	int deleteAllCheckListComment(CommunityDTO communityDto)  throws Exception;

	//��� ���
	int createComment(CommunityComDTO comDto)				 throws Exception;
		
	//��� ���� �Ѱ��Ѱ� ����
	int deleteComment(CommunityComDTO comDto) 			 throws Exception;

	//��� ����
	int updateComment(CommunityComDTO comDto) 			 throws Exception;

	
	//�Խ��� �� ��� ����Ʈ
	List<CommunityComDTO> getCommunityComList(CommunityComDTO comDto) throws Exception;
	
	//�Խ��� �� ��� ũ�� ��������
	CommunityComDTO getCommunityComListCnt(CommunityComDTO comDto)   throws Exception;
	
	
	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	//�Խ��� ����Ʈ
	List<CommunityDTO> getBusiList(CommunityDTO communityDto)			throws Exception;
	
	//�Խ��� ����Ʈ ũ�� ��������
	CommunityDTO getBusiListCnt(CommunityDTO communityDto) 				throws Exception;
	
	//��� ����Ʈ
	List<CommunityComDTO> getBusiCommentList(CommunityComDTO comDto)	throws Exception;
	
	//��� ����Ʈ ũ�� ��������
	CommunityComDTO getBusiCommentListCnt(CommunityComDTO comDto)		throws Exception;	
	
	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */	
	
}
