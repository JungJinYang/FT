package ac.kr.ft.com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ac.kr.ft.com.dto.CtrDTO;
import ac.kr.ft.com.dto.EventComDTO;
import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import ac.kr.ft.com.service.IMenuService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class MenuController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "MenuService")
	private IMenuService menu;
	
	
	@RequestMapping("menu")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {
		System.out.println("�����Ҳ�");
		return "/menu/samplePage";
	}
	

	/*
	 * ##########################################################################
	 * #						������ ��											#
	 * ##########################################################################
	 * 
	 * */	
	
	@RequestMapping("menu/menuList")
	public String getMENUList(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome menu/menuList !!"); 
		
		List<MenuInfoDTO> rList = menu.getMENUList();
		model.addAttribute("rList", rList);
		
		log.info("End menu/menuList !!"); 
		
		return "/menu/menuList";
	}
	

	@RequestMapping("menu/menuDetail")
	public String getMENUDetail(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		
		log.info("Welcome menu/menuDetail !!"); 
		
		
		
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		
		//��۸���Ʈ  
		MenuComDTO  menuu = new MenuComDTO();
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));

		menuinfoDto = menu.getMENUDetail(menuinfoDto, menuu);
		model.addAttribute("menuinfoDto",menuinfoDto);
		
		log.info("End menu/menuDetail !!"); 
		
		return "menu/menuDetail";
	}
	
	/**
	 * �Խ��� ��� �ʱ� ����Ʈ ��������
	 * */
	@RequestMapping("menu/CommentList")
	public String CommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome menu/CommentList !!");
		
		
		log.info("menu_seq : "+ CmmUtil.nvl(request.getParameter("menu_seq")));
		
		// ��� ����Ʈ
		MenuComDTO pDTO = new MenuComDTO();
		request.setCharacterEncoding("UTF-8");

				
		pDTO.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
	
		MenuComDTO rDTO = menu.getMenuComList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
	
		log.info("End menu/CommentList !!");
		
		return "/menu/CommentListJSON";
	}
	

	/**
	 * ���ȭ�� �����ֱ�
	 * */
  	@RequestMapping("menu/menuReg")
	public String insertForm(HttpServletRequest request,HttpServletResponse response, ModelMap model)throws Exception{
  		log.info("Welcome menu/menuReg !!"); 
  		
  		log.info("End menu/menuReg !!"); 
  		
  		return "/menu/menuReg";
	}
  	
	/**
	 * ��ϵ����� db �����ϱ�'
	 * */  	
	@RequestMapping("menu/menuInsert")
	public String createMENUInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		
		log.info("Welcome menu/menuInsert !!"); 
		
		
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		String menu_int = CmmUtil.nvl(request.getParameter("menu_int"));
		menu_int = menu_int.replaceAll("& #39;", "'");
		menu_int = menu_int.replaceAll("& #40;", "(");
		menu_int = menu_int.replaceAll("& #41;", ")");
		menu_int = menu_int.replaceAll("& lt;", "<");
		menu_int = menu_int.replaceAll("& gt;", ">");
		
		String menu_name = CmmUtil.nvl(request.getParameter("menu_name"));
		menu_name = menu_name.replaceAll("& #39;", "'");
		menu_name = menu_name.replaceAll("& #40;", "(");
		menu_name = menu_name.replaceAll("& #41;", ")");
		menu_name = menu_name.replaceAll("& lt;", "<");
		menu_name = menu_name.replaceAll("& gt;", ">");
		
		String country_info = CmmUtil.nvl(request.getParameter("country_info"));
		country_info = country_info.replaceAll("& #39;", "'");
		country_info = country_info.replaceAll("& #40;", "(");
		country_info = country_info.replaceAll("& #41;", ")");
		country_info = country_info.replaceAll("& lt;", "<");
		country_info = country_info.replaceAll("& gt;", ">");
		
		
		
		
		menuinfoDto.setMenu_name(menu_name);
		menuinfoDto.setMenu_int(menu_int);
		menuinfoDto.setCountry_info(country_info);
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuinfoDto.setPrice(CmmUtil.nvl(request.getParameter("price")));
		menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		menuinfoDto.setReg_user_no(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NO")));
		menuinfoDto.setChg_user_no(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NO")));
		menuinfoDto.setUser_no(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NO")));
		
		log.info("menu_seq : "+ CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info("menu_name : "+ CmmUtil.nvl(request.getParameter("menu_name")));
		log.info("menu_int : "+ CmmUtil.nvl(request.getParameter("menu_int")));
		log.info("price : "+ CmmUtil.nvl(request.getParameter("price")));
		log.info("fileGRP : "+ CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("country_info : "+ CmmUtil.nvl(request.getParameter("country_info")));
		
		
		//select seq�� �� �޾ƿͼ� view ���� detail�� ������
		//�̰Ŵ�ſ� ��.����
		if(menu.createMENUInfo(menuinfoDto)){
			request.setAttribute("msg", "��� �Ǿ����ϴ�");
		}else{
			request.setAttribute("msg", "������ ���� �Ǿ����ϴ�");
		}
		//request.setAttribute("url", "detail.do?ctr_seq=1");
		
		log.info("End menu/menuInsert !!"); 
		
		
		return "/menu/menuMsgToList";
	}
	
	@RequestMapping("menu/delete")
	public String deleteMENUInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome delete !!"); 
		//��� ����
		log.info("hellow menu/deletecomment!!");
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		 menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		if(menu.deleteMENUInfo(menuinfoDto)){
			request.setAttribute("msg", "������ �Ϸ� �Ǿ����ϴ�");
		}else{
			request.setAttribute("msg", "������ �Ϸ� �Ǿ����ϴ�");
		}
		request.setAttribute("url", "menuList.do");
		return "/redirect";
	}
	
	@RequestMapping("menu/updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info("asd:" + CmmUtil.nvl(request.getParameter("menu_seq")));
		menuinfoDto = menu.getMenuDetailInfo(menuinfoDto);
		menuinfoDto.setMenu_int(CmmUtil.nvl(menuinfoDto.getMenu_int().replaceAll("<br>", "\r\n")));
		menuinfoDto.setCountry_info(CmmUtil.nvl(menuinfoDto.getCountry_info().replaceAll("<br>", "\r\n")));
		model.addAttribute("menuinfoDto",menuinfoDto);
		return "/menu/menuUpdate";
	}
	
	@RequestMapping("menu/menuUpdate")
	public String updateMENUInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		
		String menu_int = CmmUtil.nvl(request.getParameter("menu_int"));
		menu_int = menu_int.replaceAll("<br>", "<\r\n>");
		menu_int = menu_int.replaceAll("& #39;", "'");
		menu_int = menu_int.replaceAll("& #40;", "(");
		menu_int = menu_int.replaceAll("& #41;", ")");
		menu_int = menu_int.replaceAll("& lt;", "<");
		menu_int = menu_int.replaceAll("& gt;", ">");
		
		
		String menu_name = CmmUtil.nvl(request.getParameter("menu_name"));
		menu_name = menu_name.replaceAll("<br>", "<\r\n>");
		menu_name = menu_name.replaceAll("& #39;", "'");
		menu_name = menu_name.replaceAll("& #40;", "(");
		menu_name = menu_name.replaceAll("& #41;", ")");
		menu_name = menu_name.replaceAll("& lt;", "<");
		menu_name = menu_name.replaceAll("& gt;", ">");
		
		String country_info = CmmUtil.nvl(request.getParameter("country_info"));
		country_info = country_info.replaceAll("<br>", "<\r\n>");
		country_info = country_info.replaceAll("& #39;", "'");
		country_info = country_info.replaceAll("& #40;", "(");
		country_info = country_info.replaceAll("& #41;", ")");
		country_info = country_info.replaceAll("& lt;", "<");
		country_info = country_info.replaceAll("& gt;", ">");
		
		
		
		
		menuinfoDto.setMenu_name(menu_name);
		menuinfoDto.setMenu_int(menu_int);
		menuinfoDto.setCountry_info(country_info);
		
		
		
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		//menuinfoDto.setMenu_name(CmmUtil.nvl(request.getParameter("menu_name")));
		//menuinfoDto.setMenu_int(CmmUtil.nvl(request.getParameter("menu_int")).replaceAll("<br>", "\r\n"));
		
		menuinfoDto.setPrice(CmmUtil.nvl(request.getParameter("price")));
		menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		//menuinfoDto.setCountry_info(CmmUtil.nvl(request.getParameter("country_info")).replaceAll("<br>", "\r\n"));
		menuinfoDto.setReg_user_no(CmmUtil.nvl(request.getParameter("ADMINUSER_NO")));
		menuinfoDto.setChg_user_no(CmmUtil.nvl(request.getParameter("ADMINUSER_NO")));

		
		if(menu.updateMENUInfo(menuinfoDto)){
			request.setAttribute("msg", "������ �Ϸ� �Ǿ����ϴ�");
		}else{
			request.setAttribute("msg", "������ ���� �Ǿ����ϴ�");
		}
		
		request.setAttribute("url", "menuList.do");
		
		return "/redirect";
	}
	
	
	@RequestMapping("menu/deleteAllCheckList")
	public String deleteAllCheckList(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome deleteAllCheckList !!"); 
		
		String[] allCheckSeq = request.getParameterValues("chkMenu");
		
		MenuInfoDTO pDTO = new MenuInfoDTO();
		
		pDTO.setAllCheckSeq(allCheckSeq);
		 
		if(menu.deleteAllCheckList(pDTO)){
			request.setAttribute("msg", "������ �Ϸ� �Ǿ����ϴ�");
			
		}else{
			request.setAttribute("msg", "������ �Ϸ� �Ǿ����ϴ�");
			
		}
		
		pDTO = null;
		
		request.setAttribute("url", "menuList.do");
		return "/redirect";
	}
	

	@RequestMapping("menu/InsertComment")
	public String insertComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Welcome menu/busiInsertComment");
		request.setCharacterEncoding("UTF-8");

		String res = ""; //ó�� ���
		MenuComDTO menuu = new MenuComDTO();

		log.info(CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setContents(CmmUtil.nvl(request.getParameter("contents"))
				.replaceAll("\r", "<br>")
				.replaceAll("\n", "<br>")
				.replaceAll("& lt;", "<")
				.replaceAll("& gt;", ">")
				.replaceAll("& #39;", "'")
				.replaceAll("& #40;", "(")
				.replaceAll("& #41;", ")"));
		menuu.setReg_user_no(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NO")));

		if (menu.createComment(menuu)){
			//��� ����
			res = "1";
			
		}else{
			
			//��� ����
			res = "0";
			
		}
	
		model.addAttribute("res", res);
		
		return "/menu/CommentProc";
	}
	

	// ��� ���� ��Ʈ�ѷ�
	@RequestMapping("menu/deleteComment")
	public String deleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("hi menu/deleteComment ");
		
		log.info(CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		
		
		String res = ""; 
		
		MenuComDTO menuu = new MenuComDTO();
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		if (menu.deleteComment(menuu)) {
			//��� ����
			res = "1";
			
		}else{
			//��� ����
			res = "0";
			
		}		
		log.info("END menu/deleteComment ");
	
		model.addAttribute("res", res);
		
		return "/menu/CommentProc";
	}

	

	// ��� ���� ��Ʈ�ѷ�
	@RequestMapping("menu/updateComment")
	public String updateComment(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
	
		
		
			request.setCharacterEncoding("UTF-8");
		
		log.info("menu/updateComment");
		

		
		log.info("menu_seq=" + CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info("User_no=" +CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		log.info("Chg_dt="+CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info("Chg_user_no"+CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

		String res = ""; //ó�� ���
		

		MenuComDTO menuu = new MenuComDTO();

		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		menuu.setContents(CmmUtil.nvl(request.getParameter("contents"))
				.replaceAll("\r", "<br>")
				.replaceAll("\n", "<br>")
				.replaceAll("& lt;", "<")
				.replaceAll("& gt;", ">")
				.replaceAll("& #39;", "'")
				.replaceAll("& #40;", "(")
				.replaceAll("& #41;", ")"));
		menuu.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		menuu.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		menuu.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
	
		log.info("byby event/update !!");

		if (menu.updateComment(menuu)) {
			//���� ����
			res = "1";
			
		}else{
			//���� ����
			res = "0";
			
		}

		model.addAttribute("res", res);
		return "/menu/CommentProc";
	}

	/*
	 * ##########################################################################
	 * #						������ �� ��										#
	 * ##########################################################################
	 * 
	 * */
	

	/*
	 * ##########################################################################
	 * #						����ڿ� ����										#
	 * ##########################################################################
	 * 
	 * */
	
	
	//����� �޴� ����Ʈ ��������
	@RequestMapping("menu/busiMenuList") //board.html
	public String getBusiMenuList(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome menu/busiMenuList !!"); 
		
		List<MenuInfoDTO> rList = menu.getMENUList();
		model.addAttribute("rList", rList);
		
		log.info("End menu/busiMenuList !!"); 
		
		return "/busi/menu/MenuList";
	}
	
	@RequestMapping("menu/BusiMenuDetail")
	public String BusiMenuDetail(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		
		log.info("Welcome menu/BusimenuDetail !!"); 
		
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		
		// ��� ����Ʈ
		MenuComDTO menuu = new MenuComDTO();
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));

		menuinfoDto = menu.BusiMenuDetail(menuinfoDto);
		
		model.addAttribute("menuinfoDto",menuinfoDto);
		
		log.info("End menu/menuDetail !!"); 
		
		return "/busi/menu/MenuDetail";
	}

	/**
	 * �޴� ����ϱ�
	 * */
  	@RequestMapping("menu/busiMenuReg")
	public String BusiMenuReg(HttpServletRequest request,HttpServletResponse response, ModelMap model)throws Exception{
  		log.info("Welcome menu/busiMenuReg !!"); 
  		
  		log.info("End menu/busiMenuReg !!"); 
  		
  		return "/busi/menu/addFood";
	}	
  	
  	
	/**
	 * ��ϵ����� db �����ϱ�'
	 * */  	
	@RequestMapping("menu/BusiMenuInsert")
	public String createBusiMenuInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		
		log.info("Welcome menu/BusiMenuInsert !!"); 
		
		
	
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		
		
		String menu_int = CmmUtil.nvl(request.getParameter("menu_int"));
		menu_int = menu_int.replaceAll("\r\n", "<br>");
		
		menu_int = menu_int.replaceAll("& #39;", "'");
		menu_int = menu_int.replaceAll("& #40;", "(");
		menu_int = menu_int.replaceAll("& #41;", ")");
		menu_int = menu_int.replaceAll("& lt;", "<");
		menu_int = menu_int.replaceAll("& gt;", ">");
		
		
		String country_info = CmmUtil.nvl(request.getParameter("country_info"));
		
		country_info = country_info.replaceAll("\r\n", "<br>");
		country_info = country_info.replaceAll("& #39;", "'");
		country_info = country_info.replaceAll("& #40;", "(");
		country_info = country_info.replaceAll("& #41;", ")");
		country_info = country_info.replaceAll("& lt;", "<");
		country_info = country_info.replaceAll("& gt;", ">");
		
		String menu_name = CmmUtil.nvl(request.getParameter("menu_name"));
		
		
		menu_name = menu_name.replaceAll("& #39;", "'");
		menu_name = menu_name.replaceAll("& #40;", "(");
		menu_name = menu_name.replaceAll("& #41;", ")");
		menu_name = menu_name.replaceAll("& lt;", "<");
		menu_name = menu_name.replaceAll("& gt;", ">");
		
		
		
		menuinfoDto.setMenu_name(menu_name);
		menuinfoDto.setMenu_int(menu_int);
		menuinfoDto.setCountry_info(country_info);
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuinfoDto.setPrice(CmmUtil.nvl(request.getParameter("price")));
		menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
	
		menuinfoDto.setReg_dt(CmmUtil.nvl((String)session.getAttribute("reg_dt")));
		menuinfoDto.setReg_user_no(CmmUtil.nvl((String)session.getAttribute("USER_NO")));
		//menuinfoDto.setChg_user_no(CmmUtil.nvl((String)session.getAttribute("USER_NO")));
		menuinfoDto.setUser_no(CmmUtil.nvl((String)session.getAttribute("USER_NO")));
		
		//menuinfoDto.setChg_user_no("");
		menuinfoDto.setReg_user_no("");
		log.info("menu_seq : "+ CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info("menu_name : "+ CmmUtil.nvl(request.getParameter("menu_name")));
		log.info("menu_int : "+ menu_int);
		log.info("price : "+ CmmUtil.nvl(request.getParameter("price")));
		log.info("fileGRP : "+ CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("country_info : "+ country_info);
		
		
		//select seq�� �� �޾ƿͼ� view ���� detail�� ������
		//�̰Ŵ�ſ� ��.����
		if(menu.createMENUInfo(menuinfoDto)){
			request.setAttribute("msg", "������ �Ϸ� �Ǿ����ϴ�.");
		}else{
			request.setAttribute("msg", "������ ���� �Ǿ����ϴ�.");
		}
		System.out.println("k");
		//request.setAttribute("url", "detail.do?ctr_seq=1");
		
		log.info("End menu/BusiMenuInsert !!"); 
		
		
		return "/busi/menu/menuMsgToList";
	}
	
	
	@RequestMapping("menu/busidelete")
	public String deleteBusiMENUInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome busi delete !!"); 
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		if(menu.deleteMENUInfo(menuinfoDto)){
			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}else{
			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}
		request.setAttribute("url", "busiMenuList.do");
		return "/redirect";
	}
	
	@RequestMapping("menu/busimenuupdateForm")
	public String updateBusiForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		
		log.info("Welcome menu/busiupdateForm !!"); 
		
		
		
		
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuinfoDto = menu. getMenuDetailInfo(menuinfoDto);
		
		menuinfoDto.setMenu_int(menuinfoDto.getMenu_int().replaceAll("<br>", "\r\n"));
		menuinfoDto.setCountry_info(menuinfoDto.getCountry_info().replaceAll("<br>", "\r\n"));
		
		model.addAttribute("menuinfoDto",menuinfoDto);
		
		
		log.info("End menu/busiupdateForm !!"); 
		
		return "/busi/menu/MenuUpdate";
		
	}
	
	
	
	@RequestMapping("menu/busimenuUpdate")
	public String updateBusiMENUInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome menu/busiupdate !!"); 
		
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String menu_int = CmmUtil.nvl(request.getParameter("menu_int"));
		menu_int = menu_int.replaceAll("\r\n", "<br>");
		
		menu_int = menu_int.replaceAll("& #39;", "'");
		menu_int = menu_int.replaceAll("& #40;", "(");
		menu_int = menu_int.replaceAll("& #41;", ")");
		menu_int = menu_int.replaceAll("& lt;", "<");
		menu_int = menu_int.replaceAll("& gt;", ">");
		
		
		String country_info = CmmUtil.nvl(request.getParameter("country_info"));
		
		country_info = country_info.replaceAll("\r\n", "<br>");
		country_info = country_info.replaceAll("& #39;", "'");
		country_info = country_info.replaceAll("& #40;", "(");
		country_info = country_info.replaceAll("& #41;", ")");
		country_info = country_info.replaceAll("& lt;", "<");
		country_info = country_info.replaceAll("& gt;", ">");
		
		String menu_name = CmmUtil.nvl(request.getParameter("menu_name"));
		
		
		menu_name = menu_name.replaceAll("& #39;", "'");
		menu_name = menu_name.replaceAll("& #40;", "(");
		menu_name = menu_name.replaceAll("& #41;", ")");
		menu_name = menu_name.replaceAll("& lt;", "<");
		menu_name = menu_name.replaceAll("& gt;", ">");
		
		
	
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		
		
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuinfoDto.setMenu_name(menu_name);
		menuinfoDto.setMenu_int(menu_int);
		menuinfoDto.setCountry_info(country_info);
		menuinfoDto.setPrice(CmmUtil.nvl(request.getParameter("price")));
		menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		menuinfoDto.setReg_user_no(CmmUtil.nvl(request.getParameter("reg_user_no")));
		menuinfoDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));

		log.info("menu_seq : "+ CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info("menu_name : "+ CmmUtil.nvl(request.getParameter("menu_name")));
		log.info("menu_int : "+ CmmUtil.nvl(request.getParameter("menu_int")));
		log.info("price : "+ CmmUtil.nvl(request.getParameter("price")));
		log.info("fileGRP : "+ CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("country_info : "+ CmmUtil.nvl(request.getParameter("country_info")));
		log.info("reg_user_no : "+ CmmUtil.nvl(request.getParameter("reg_user_no")));
		log.info("chg_user_no : "+ CmmUtil.nvl(request.getParameter("chg_user_no")));
		
		if(menu.updateMENUInfo(menuinfoDto)){
			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}else{
			request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}
		
		request.setAttribute("url", "busiMenuList.do");
		log.info("End menu/busiupdate!!"); 
		return "/redirect";
	}
	/**
	 * ��� �ʱ� ����Ʈ ��������
	 * */
	@RequestMapping("menu/busiCommentList")
	public String getBusiCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome menu/busiCommentList !!");
		

		log.info("menu_seq : "+ CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info("start_page_size : "+ CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : "+ CmmUtil.nvl(request.getParameter("end_page_size")));
		
		// ��� ����Ʈ
		MenuComDTO pDTO = new MenuComDTO();
		request.setCharacterEncoding("UTF-8");

		pDTO.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"),"1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"),"6"));

		MenuComDTO rDTO = menu.getBusiCommentList(pDTO);

		model.addAttribute("rDTO", rDTO);
		
		log.info("End menu/busiCommentList !!");
		request.setCharacterEncoding("UTF-8");

		return "/busi/menu/CommentListJSON";
	}
	
	
	/**
	 * ��� ���
	 * */
	@RequestMapping("menu/busiInsertComment")
	public String busiinsertComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome menu/busiInsertComment");

		String res = ""; //ó�� ���
		MenuComDTO menuu = new MenuComDTO();

		log.info(CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setContents(CmmUtil.nvl(request.getParameter("contents"))
		.replaceAll("\r", "<br>")
		.replaceAll("\n", "<br>")
		.replaceAll("& lt;", "<")
		.replaceAll("& gt;", ">")
		.replaceAll("& #39;", "'")
		.replaceAll("& #40;", "(")
		.replaceAll("& #41;", ")"));
		menuu.setReg_user_no(CmmUtil.nvl((String)session.getAttribute("USER_NO")));

		if (menu.createComment(menuu)){
			//��� ����
			res = "1";
			
		}else{
			
			//��� ����
			res = "0";
			
		}
	
		model.addAttribute("res", res);
		
		return "/busi/menu/CommentProc";
	}
	

	
	/**
	 * ��� ����
	 * */	
	@RequestMapping("menu/busiUpdateComment")
	public String busiUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		log.info("busiUpdateComment");
		
		String res = ""; //ó�� ���
		
		MenuComDTO menuu = new MenuComDTO();

		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		menuu.setContents(CmmUtil.nvl(request.getParameter("contents"))
		.replaceAll("\r", "<br>")
		.replaceAll("\n", "<br>")
		.replaceAll("& lt;", "<")
		.replaceAll("& gt;", ">")
		.replaceAll("& #39;", "'")
		.replaceAll("& #40;", "(")
		.replaceAll("& #41;", ")"));
		menuu.setUser_no(CmmUtil.nvl((String)session.getAttribute("USER_NO")));
		menuu.setChg_user_no(CmmUtil.nvl(request.getParameter("USER_NO")));
		menuu.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		if (menu.updateComment(menuu)){
			//���� ����
			res = "1";
			
		}else{
			//���� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/menu/CommentProc";
		
	}
	
	
	/**
	 * ��� ����
	 * */	
	@RequestMapping("menu/busiDeleteComment")
	public String busideleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("hi menu/busideleteComment ");
		
		String res = ""; //ó�� ���
		
		MenuComDTO menuu = new MenuComDTO();
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		
		if (menu.deleteComment(menuu)){
			//��� ����
			res = "1";
			
		}else{
			//��� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/menu/CommentProc";
		
	}

	
	
	
	
	
	


	
	/*
	 * ##########################################################################
	 * #						����� �� ��										#
	 * ##########################################################################
	 * 
	 * */		
	
	
	/*
	 * ##########################################################################
	 * #						����ڿ� ����									#
	 * ##########################################################################
	 * 
	 * */		
	
	
	@RequestMapping("menu/userMenuList")
	public String getUserMenuList(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome menu/busiMenuList !!"); 
		
		List<MenuInfoDTO> rList = menu.getMENUList();
		model.addAttribute("rList", rList);
		
		log.info("End menu/busiMenuList !!"); 
		
		return "/guest/menu/guestmenuList";
	}
	
	@RequestMapping("menu/userMenuDetail")
	public String getUserMenuDetail(HttpSession session,HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		
		log.info("Welcome menu/BusimenuDetail !!"); 
		
		
		MenuInfoDTO menuinfoDto = new MenuInfoDTO();
		menuinfoDto.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		
		// ��� ����Ʈ
		MenuComDTO menuu = new MenuComDTO();
		
		
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		menuinfoDto = menu.getMENUDetail(menuinfoDto, menuu);

		model.addAttribute("menuinfoDto", menuinfoDto);
		
	

		
		menuinfoDto = menu.getMENUDetail(menuinfoDto, menuu);
		model.addAttribute("menuinfoDto",menuinfoDto);
		
		log.info("End menu/menuDetail !!"); 
		
		return "/guest/menu/guestmenuDetail";
	}
	
	/**
	 * ��� �ʱ� ����Ʈ ��������
	 * */
	@RequestMapping("menu/userCommentList")
	public String getUserCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("Welcome menu/userCommentList !!");
		

		log.info("menu_seq : "+ CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info("start_page_size : "+ CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : "+ CmmUtil.nvl(request.getParameter("end_page_size")));
		
		// ��� ����Ʈ
		MenuComDTO pDTO = new MenuComDTO();
		

		pDTO.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"),"1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"),"6"));

		MenuComDTO rDTO = menu.getBusiCommentList(pDTO);

		model.addAttribute("rDTO", rDTO);
		
		log.info("End menu/busiCommentList !!");
		request.setCharacterEncoding("UTF-8");

		return "/guest/menu/CommentListJSON";
	}
	
	
	/**
	 * ��� ���
	 * */
	@RequestMapping("menu/userInsertComment")
	public String userinsertComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
	request.setCharacterEncoding("UTF-8");

		
		
		log.info("Welcome menu/userInsertComment");

		String res = ""; //ó�� ���
		MenuComDTO menuu = new MenuComDTO();


		log.info(CmmUtil.nvl(request.getParameter("menu_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setContents(CmmUtil.nvl(request.getParameter("contents"))
				.replaceAll("\r", "<br>")
				.replaceAll("\n", "<br>")
				.replaceAll("& lt;", "<")
				.replaceAll("& gt;", ">")
				.replaceAll("& #39;", "'")
				.replaceAll("& #40;", "(")
				.replaceAll("& #41;", ")"));
		menuu.setReg_user_no(CmmUtil.nvl((String)session.getAttribute("USER_NO")));

		if (menu.createComment(menuu)){
			//��� ����
			res = "1";
			
		}else{
			
			//��� ����
			res = "0";
			
		}
	
		model.addAttribute("res", res);
	
		log.info("End menu/userInsertComment");
		
		return "/guest/menu/CommentProc";
	}
	

	
	/**
	 * ��� ����
	 * */	
	@RequestMapping("menu/userUpdateComment")
	public String userUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		log.info("menu/userUpdateComment");
		
		String res = ""; //ó�� ���
		
		MenuComDTO menuu = new MenuComDTO();

		
		
		
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		menuu.setContents(CmmUtil.nvl(request.getParameter("contents"))
				.replaceAll("\r", "<br>")
				.replaceAll("\n", "<br>")
				.replaceAll("& lt;", "<")
				.replaceAll("& gt;", ">")
				.replaceAll("& #39;", "'")
				.replaceAll("& #40;", "(")
				.replaceAll("& #41;", ")"));
		menuu.setUser_no(CmmUtil.nvl((String)session.getAttribute("USER_NO")));
		menuu.setChg_user_no(CmmUtil.nvl(request.getParameter("USER_NO")));
		menuu.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		
		if (menu.updateComment(menuu)){
			//���� ����
			res = "1";
			
		}else{
			//���� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/guest/menu/CommentProc";
		
	}
	
	
	/**
	 * ��� ����.
	 * */	
	@RequestMapping("menu/userDeleteComment")
	public String userdeleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("hi menu/userdeleteComment ");
		
		String res = ""; //.ó�� ���
		
		MenuComDTO menuu = new MenuComDTO();
		menuu.setMenu_seq(CmmUtil.nvl(request.getParameter("menu_seq")));
		menuu.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		
		if (menu.deleteComment(menuu)){
			//��� ����
			res = "1";
			
		}else{
			//��� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/guest/menu/CommentProc";
		
	}

	
	
	

}
	
