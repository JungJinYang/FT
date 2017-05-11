package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;

public interface IMenuService {
	List<MenuInfoDTO> getMENUList() throws Exception;

	MenuInfoDTO getMENUDetail(MenuInfoDTO menuinfoDto, MenuComDTO menuu) throws Exception;

	boolean createMENUInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean deleteMENUInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean updateMENUInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean deleteAllCheckList(MenuInfoDTO menuinfoDto) throws Exception;

	// ��۹�ȣ ����
	void updatecomUppder(MenuComDTO menuu) throws Exception;

	MenuInfoDTO getMenuDetailInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean createComment(MenuComDTO menuu) throws Exception;

	boolean deleteComment(MenuComDTO menuu) throws Exception;

	boolean updateComment(MenuComDTO menuu) throws Exception;

	// �Խ��ǰ� ��� �Բ� �����
	boolean deleteCommentInfo(MenuInfoDTO menuinfoDto) throws Exception;

	// ��� ����Ʈ ��������
	MenuComDTO getMenuComList(MenuComDTO menuu) throws Exception;

	//�޴���
	MenuInfoDTO BusiMenuDetail(MenuInfoDTO menuinfoDto) throws Exception;

	MenuInfoDTO UserMenuDetail(MenuInfoDTO menuinfoDto) throws Exception;

	/*
	 * #########################################################################
	 * #### # ����� ���� ���� (���۽�) #
	 * #########################################################################
	 * ####
	 */

	

	MenuComDTO getBusiCommentList(MenuComDTO menuu) throws Exception;

	
	/*
	 * #########################################################################
	 * #### # ����� ���� �� #
	 * #########################################################################
	 * ####
	 */

	/*
	 * #########################################################################
	 * #### # ����� ���� ���� (���۽�) #
	 * #########################################################################
	 * ####
	 */

	

	MenuComDTO getUserCommentList(MenuComDTO menuu) throws Exception;

	
	/*
	 * #########################################################################
	 * #### # ����� ���� �� #
	 * #########################################################################
	 * ####
	 */
}
