package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import ac.kr.ft.com.persistance.mapper.MenuMapper;
import ac.kr.ft.com.service.IMenuService;

@Service("MenuService")
public   class MenuService implements IMenuService {
	private Logger log = Logger.getLogger(this.getClass());
	

	@Resource(name = "MenuMapper")
	private MenuMapper menuMapper;
	
	@Override
	public List<MenuInfoDTO> getMENUList() throws Exception {
		return menuMapper.getMENUList();
	}

	@Override
	public MenuInfoDTO getMENUDetail(MenuInfoDTO menuinfoDto, MenuComDTO menuu) throws Exception {

		// ������ ��������
		MenuInfoDTO rDTO = menuMapper.getMENUDetail(menuinfoDto);

		// ��� ����Ʈ ��������
		rDTO.setrList(menuMapper.getMenuComList(menuu));

		return rDTO;

	}

	@Override
	public MenuInfoDTO getMenuDetailInfo(MenuInfoDTO menuInfoDTO) throws Exception {

		return menuMapper.getMENUDetail(menuInfoDTO);
	}

	@Override
	public boolean createMENUInfo(MenuInfoDTO menuinfoDto) throws Exception {
		int a = menuMapper.createMENUInfo(menuinfoDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteMENUInfo(MenuInfoDTO menuinfoDto) throws Exception {
		int b = menuMapper.deleteCommentInfo(menuinfoDto);
		int a = menuMapper.deleteMENUInfo(menuinfoDto);
		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateMENUInfo(MenuInfoDTO menuinfoDto) throws Exception {
		int a = menuMapper.updateMENUInfo(menuinfoDto);
		if (a != 0) {
			return true;
		}
		return false;
	}
	@Override
	public void updatecomUppder(MenuComDTO menuu) throws Exception {
		menuMapper.updatecomUppder(menuu);
	}

	@Override
	public boolean deleteAllCheckList(MenuInfoDTO menuinfoDto) throws Exception {
		int b = menuMapper.deleteAllCheckListComment(menuinfoDto);
		int a = menuMapper.deleteAllCheckList(menuinfoDto);
		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

	// ��� ����Ʈ
	@Override
	
	 public MenuComDTO getMenuComList(MenuComDTO menuu) throws Exception {
		//��� ����Ʈ �� ��������
		MenuComDTO rDTO = menuMapper.getMenuComListCnt(menuu);
		
		//��� ����Ʈ ��������
		rDTO.setrList(menuMapper.getMenuComList(menuu));
		
		return rDTO;
	 }

	
	// ��� ����
		@Override
		public boolean deleteCommentInfo(MenuInfoDTO menuinfoDto) throws Exception {
			int a = menuMapper.deleteCommentInfo(menuinfoDto);
			if (a != 0) {
				return true;
			}
			return false;
		}
		
		@Override
		public boolean createComment(MenuComDTO menuu) throws Exception {
			log.info("Service : createComment Start!");
			
			  int a = menuMapper.createComment(menuu);

			  log.info("Service a : " + a);
			  log.info("Service : createComment End!");

			  if (a != 0) {
			   return true;
			  }
			  return false;
			 }

		@Override
		public boolean updateComment(MenuComDTO menuu) throws Exception {

			int a = menuMapper.updateComment(menuu);
			if (a != 0) {
				return true;
			}
			return false;
		}

		@Override
		public boolean deleteComment(MenuComDTO menuu) throws Exception {
			int a = menuMapper.deleteComment(menuu);
			if (a != 0) {
				return true;
			}
			return false;
		}
		@Override
		 public MenuInfoDTO BusiMenuDetail(MenuInfoDTO menuInfoDTO) throws Exception {

		  
		  // ������ ��������
			MenuInfoDTO rDTO = menuMapper.getMENUDetail(menuInfoDTO);

		  return rDTO;
		 }
		
		
		@Override
		 public MenuInfoDTO UserMenuDetail(MenuInfoDTO menuInfoDTO) throws Exception {

		  
		  // ������ ��������
			MenuInfoDTO rDTO = menuMapper.getMENUDetail(menuInfoDTO);

		  return rDTO;
		 }

		 /*
		  * #########################################################################
		  * #### # ����� ���� ���� #
		  * #########################################################################
		  * ####
		  */

		

	

		 // ��� ����Ʈ(�����)
		 @Override
		 public MenuComDTO getBusiCommentList(MenuComDTO menuu) throws Exception {
			
		  // �Խ��� ����Ʈ �� ��������
			 
		  MenuComDTO rDTO = menuMapper.getBusiCommentListCnt(menuu);

		  // �Խ��� ����Ʈ ��������
		  rDTO.setrList(menuMapper.getBusiCommentList(menuu));

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

		

	

		 // ��� ����Ʈ(�����)
		 @Override
		 public MenuComDTO getUserCommentList(MenuComDTO menuu) throws Exception {
			
		  // �Խ��� ����Ʈ �� ��������
			 
		  MenuComDTO rDTO = menuMapper.getUserCommentListCnt(menuu);

		  // �Խ��� ����Ʈ ��������
		  rDTO.setrList(menuMapper.getUserCommentList(menuu));

		  return rDTO;
		 }

		
}

		

		 /*
		  * #########################################################################
		  * #### # ����� ���� �� #
		  * #########################################################################
		  * ####
		  */
		 
		 
		 
		 
		 
		 

	



