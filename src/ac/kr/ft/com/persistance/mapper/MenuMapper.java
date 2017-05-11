package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import config.Mapper;
//���� ICtrDao�� ����

@Mapper("MenuMapper")
public interface MenuMapper {
//	@Autowired
//	private SqlSessionTctrlate sqlSession;
//	private final String NS = "ac.kr.ft.com.persistance.sqlmap.ComSqlMap.";
	
	List<MenuInfoDTO> getMENUList();

	MenuInfoDTO getMENUDetail(MenuInfoDTO menuinfoDto)throws Exception;

	int createMENUInfo(MenuInfoDTO menuinfoDto)throws Exception;

	int deleteMENUInfo(MenuInfoDTO menuinfoDto)throws Exception;

	int updateMENUInfo(MenuInfoDTO menuinfoDto)throws Exception;
	
	int deleteAllCheckList(MenuInfoDTO menuinfoDto)throws Exception;

	

	int deleteCommentInfo(MenuInfoDTO menuinfoDto)throws Exception; //�۰���� ����

	void updatecomUppder(MenuComDTO menuu)throws Exception; //��۹�ȣ ����
	
	
	int deleteAllCheckListComment(MenuInfoDTO menuinfoDto)throws Exception;
	
	
	//�󼼴�� ����Ʈ
	List<MenuComDTO> getMenuComList(MenuComDTO menuu)throws Exception;
	// ��� ����Ʈ ũ�� ��������
	MenuComDTO getMenuComListCnt(MenuComDTO menuu)throws Exception;
	
	//��� ���
	int createComment(MenuComDTO menuu) throws Exception;
		
	//��� ���� �Ѱ��Ѱ� ����
	int deleteComment(MenuComDTO menuu) throws Exception;

	//��� ����
	int updateComment(MenuComDTO menuu) throws Exception;



	
	
	
	List<MenuInfoDTO> getBusiList()throws Exception; 
	


	/*
	#############################################################################
	#							����� ���� ����									#
	#############################################################################
	 */
	
	//��� ����Ʈ
	List<MenuComDTO> getBusiCommentList(MenuComDTO menuu)throws Exception;
	
	//��� ����Ʈ ũ�� ��������
	MenuComDTO getBusiCommentListCnt(MenuComDTO menuu)throws Exception;	
	

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
	
	//��� ����Ʈ
	List<MenuComDTO> getUserCommentList(MenuComDTO menuu)throws Exception;
	
	//��� ����Ʈ ũ�� ��������
	MenuComDTO getUserCommentListCnt(MenuComDTO menuu)throws Exception;	
	

	/*
	#############################################################################
	#							����� ���� ��									#
	#############################################################################
	 */	
	


}



