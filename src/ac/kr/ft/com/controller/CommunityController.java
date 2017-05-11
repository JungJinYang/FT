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
import org.springframework.util.ResizableByteArrayOutputStream;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ac.kr.ft.com.dto.CommunityComDTO;
import ac.kr.ft.com.dto.CommunityDTO;
import ac.kr.ft.com.service.ICommunityService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class CommunityController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "CommunityService")
	private ICommunityService com;
	
	@RequestMapping("community")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {
		
		return "/community/samplePage";
	}
	
	//�Խ��� ����Ʈ ��Ʈ�ѷ�
	@RequestMapping("community/communityList")
	public String getCommunityList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("Welcome community/communityList !!");
		List<CommunityDTO> rList = com.getCommunityList();
		model.addAttribute("rList", rList);
		return "/community/communityList";
	}

	//�Խ��� �� ���� ��Ʈ�ѷ�
	@RequestMapping("community/communityDetail")
	public String getCommunityDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome community/communityDetail !!");

		CommunityDTO communityDto = new CommunityDTO();
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));

		// ��� ����Ʈ
		CommunityComDTO comDto = new CommunityComDTO();
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));

		communityDto = com.getCommunityDetail(communityDto, comDto);
		
		model.addAttribute("communityDto", communityDto);	
		log.info("END community/communityDetail !!");
		return "/community/communityDetail";
	}

	
	/**
	 * �Խ��� ��� �ʱ� ����Ʈ ��������
	 * */
	@RequestMapping("community/CommentList")
	public String CommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome community/CommentList !!");
		
		request.setCharacterEncoding("EUC-KR");
		
		log.info("cmt_seq : "+ CmmUtil.nvl(request.getParameter("cmt_seq")));
		
		// ��� ����Ʈ
		CommunityComDTO pDTO = new CommunityComDTO();
				
		pDTO.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	
		CommunityComDTO rDTO = com.getCommunityComList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
	
		log.info("End community/CommentList !!");
		
		return "/community/CommunityComJSON";
	}
	
	
	/**
	 * ���ȭ�� �����ֱ�
	 */
	@RequestMapping("community/communityInsert")
	public String insertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		log.info("Welcome community/communityInsertForm");

		return "/community/communityInsert";
	}

	
	/**
	 * ��ϵ����� db�����ϱ�
	 * 
	 **/
	@RequestMapping("community/insert")
	public String insertCommunityInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
				
		log.info("Welcome community/communityinsert");	
	
		CommunityDTO communityDto = new CommunityDTO();
	
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
		
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		communityDto.setTitle(title);
		communityDto.setContents(contents);
		communityDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		communityDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		communityDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		communityDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		communityDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
			
		// menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		//communityDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("reg_user_no")));

		if (com.createCommunityInfo(communityDto)) {
			model.addAttribute("msg", "����� �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "����� �����Ͽ����ϴ�");
		}

		log.info("End community/communityInsert !!");

		return "/community/communityMsgToList";
	}

	//�Խ��� ������Ʈ �ϴ� ��� �����ִ� ��Ʈ�ѷ�
	@RequestMapping("community/communityupdateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow community/updateForm !!");
		CommunityDTO communityDto = new CommunityDTO();
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		communityDto = com.getCommunityDetailInfo(communityDto);
		communityDto.setContents(CmmUtil.nvl(communityDto.getContents().replaceAll("<br>", "\r\n")));
		model.addAttribute("communityDto", communityDto);
		return "/community/communityUpdate";
	}

	//�Խ��� ������Ʈ ��Ʈ�ѷ�
	@RequestMapping("community/update")
	public String updateCommunityInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("cmt_seq=" + CmmUtil.nvl(request.getParameter("cmt_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")).replaceAll("<br>", "\r\n"));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("reg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		response.setCharacterEncoding("EUC-KR");
		CommunityDTO communityDto = new CommunityDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
	
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
		
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		communityDto.setTitle(title);
		communityDto.setContents(contents);
		communityDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		communityDto.setChg_user_no(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NO")));
		communityDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		communityDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby community/update !!");

		if (com.updateCommunityInfo(communityDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �����Ͽ����ϴ�");
		}
		model.addAttribute("url", "communityList.do");
		return "/redirect";
	}

	//�Խ��� ���� ��Ʈ�ѷ�
	@RequestMapping("community/delete")
	public String deleteCommunityInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		CommunityDTO communityDto = new CommunityDTO();
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		if (com.deleteCommunityInfo(communityDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}else{
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}
		model.addAttribute("url", "communityList.do");
		return "/redirect";
	}
	
	//üũ�ڽ� ���� ��Ʈ�ѷ�
	@RequestMapping("community/deleteCheck")
	public String deleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		String[] del_chk = request.getParameterValues("del_chk");

		CommunityDTO pDTO = new CommunityDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (com.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");

		} else {
			model.addAttribute("msg", "������ �Ϸ��ϼ̽��ϴ�");

		}

		pDTO = null;

		model.addAttribute("url", "/community/communityList.do");
		return "/redirect";
	}

	// ��� ��� ��Ʈ�ѷ�
	@RequestMapping("community/insertComment")
	public String insertComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome community/insertComment");

		String res = ""; //ó�� ���
		CommunityComDTO comDto = new CommunityComDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		comDto.setContents(contents);;
		comDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		comDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		comDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

			if (com.createComment(comDto)){
				//��� ����
				res = "1";
				
			}else{
				
				//��� ����
				res = "0";
				
			}
			log.info("Welcome byby/insertComment");
			model.addAttribute("res", res);
			return "/community/CommentProc";
	}

	
	
	// ��� ���� ��Ʈ�ѷ�
	@RequestMapping("community/deleteComment")
	public String deleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hi community/deleteComment ");
		
		log.info(CmmUtil.nvl(request.getParameter("cmt_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		
		
		String res = ""; 
		
		CommunityComDTO comDto = new CommunityComDTO();
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		comDto.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		if (com.deleteComment(comDto)) {
			//��� ����
			res = "1";
			
		}else{
			//��� ����
			res = "0";
			
		}		
		log.info("END community/deleteComment ");
	
		model.addAttribute("res", res);
		
		return "/community/CommentProc";
	}

	

	
	// ��� ���� ��Ʈ�ѷ�
	@RequestMapping("community/updateComment")
	public String updateComment(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		log.info("hellow community/updateComment");
	
		log.info("cmt_seq=" + CmmUtil.nvl(request.getParameter("cmt_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info("User_no=" +CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		log.info("Chg_dt="+CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info("Chg_user_no"+CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
		String res = ""; //ó�� ���
	
	
		CommunityComDTO comDto = new CommunityComDTO();
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		comDto.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		comDto.setContents(contents);
		comDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		comDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		comDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
		
	

		if (com.updateComment(comDto)) {
			//���� ����
			res = "1";
			
		}else{
			//���� ����
			res = "0";
			
		}
		
		log.info("byby community/update !!");
		model.addAttribute("res", res);
		return "/community/CommentProc";
	}
	
	
	
	/*
	 * #########################################################################
	 * # # ������ �� �� #
	 * #########################################################################
	 * #
	 * 
	 */

	/*
	 * #########################################################################
	 * # # ����ڿ� ���� #
	 * #########################################################################
	 * 
	 * 
	 */

	
	// ����� Ŀ�´�Ƽ ����Ʈ ��������
	@RequestMapping("community/busicommunityList") // board.html
	public String getCommunity(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome community/busiCommunityList !!");
		request.setCharacterEncoding("EUC-KR");

		if (request.getParameter("searchBox") != null && !request.getParameter("searchBox").equals("")) {
			String searchBox = request.getParameter("searchBox");
			String searchText = request.getParameter("searchText");
			if (searchText == null) {
				searchText = "";
			}
			model.addAttribute("searchBox", searchBox);
			log.info("searchBox :" + searchBox);
			model.addAttribute("searchText", searchText);
			log.info("searchText :" + searchText);
		}
		
		log.info("End community/busiCommunityList !!");
        return "/busi/community/busicommunityList";
	}

	
	/**
	 * �Խ��� �ʱ� ����Ʈ ��������
	 * */
				   
	@RequestMapping("community/busiCommunityIndex")
	public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome community/busiCommunityIndex !!");
		
		request.setCharacterEncoding("UTF-8");
		
		// �Խ��� ����Ʈ
		CommunityDTO pDTO = new CommunityDTO();
		
		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"),"1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"),"6"));     
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));
		
		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());
		
		CommunityDTO rDTO= com.getBusiList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
		
		log.info("End community/busiCommunityIndex !!");
	
		
		return "/busi/community/CommunityListJSon";
	}
	
	
	//���⼭ ��۽���
	//����� Ŀ�´�Ƽ ����
	@RequestMapping("community/busicommunityDetail")
	public String busiCommunityDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {

		log.info("Welcome community/Detail !!");

		CommunityDTO communityDto = new CommunityDTO();
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		
		// ��� ����Ʈ
		CommunityComDTO comDto = new CommunityComDTO();
		response.setCharacterEncoding("EUC-KR");
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));

		communityDto = com.busiCommunityDetail(communityDto);
		
		model.addAttribute("communityDto", communityDto);
		
		log.info("End community/communityDetail !!");
		
		return "/busi/community/busicommunityDetail";
	}

	
	
	/**
	 * �۾��� ����ϱ�
	 */
	@RequestMapping("community/busicommunityForm")
	public String BusiMenuReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome community/busicommunityForm !!");

		return "/busi/community/busicommunityInsert";
	}

	/**
	 * ��ϵ����� db �����ϱ�'
	 */
	@RequestMapping("community/busiInsert")
	public String createBusiMenuInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
	
		log.info("Welcome community/BusiCommunityInsert !!");

		request.setCharacterEncoding("EUC-KR");
		
		log.info("cmt_seq : " + CmmUtil.nvl(request.getParameter("cmt_seq")));
		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("read_cnt : " + CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info("user_no : " + CmmUtil.nvl(request.getParameter("user_no")));
		log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("reg_dt : " + CmmUtil.nvl(request.getParameter("reg_dt")));

		CommunityDTO communityDto = new CommunityDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
				
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		communityDto.setTitle(title);
		communityDto.setContents(contents);
		communityDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		communityDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		communityDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		communityDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		communityDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		
		if (com.createCommunityInfo(communityDto)) {
			model.addAttribute("msg", "����� �Ϸ�Ǽ̽��ϴ�");
		} else {
			model.addAttribute("msg", "����� �����Ͽ����ϴ�");
		}
		// request.setAttribute("url", "detail.do?ctr_seq=1");

		log.info("End menu/BusicommunityInsert !!");

		return "/busi/community/CommunityMsgToList";
	}	
	
	
	// �Խñ� ����
	@RequestMapping("community/busidelete")
	public String deleteBusiCommunityInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {	
		log.info("hellow community/busidelete!!");
		CommunityDTO communityDto = new CommunityDTO();
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		if (com.deleteCommunityInfo(communityDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}
		model.addAttribute("url", "busicommunityList.do");
		return "/redirect";
	
	}
	
	
	// �Խñ� ������Ʈȭ�� �����ִ°�
	@RequestMapping("community/busicommunityupdateForm")
	public String busiupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow busicommunity/updateForm !!");
		CommunityDTO communityDto = new CommunityDTO();
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		communityDto  = com.getCommunityDetailInfo(communityDto);
		communityDto.setContents(communityDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("communityDto", communityDto);
		return "busi/community/busicommunityUpdate";
	}

	
	
	// �Խñ� ������ DB�� �ԷµǴ°�
	@RequestMapping("community/busiupdate")
	public String busiupdateCommunityInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("cmt_seq=" + CmmUtil.nvl(request.getParameter("cmt_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")).replaceAll("\r\n", "<br>"));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("reg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("reg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));
	
		CommunityDTO communityDto = new CommunityDTO();
	
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
			
		communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		communityDto.setTitle(title);
		communityDto.setContents(contents);
		communityDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		communityDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		communityDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		communityDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby community/update !!");

		if (com.updateCommunityInfo(communityDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �����Ͽ����ϴ�");
		}
		model.addAttribute("url", "busicommunityList.do");
		return "/redirect";
	}
	
	
	
	/**
	 * ��� �ʱ� ����Ʈ ��������
	 * */
	@RequestMapping("community/busiCommentList")
	public String getBusiCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome community/busiCommentList !!");
		
		request.setCharacterEncoding("UTF-8");
		
		log.info("cmt_seq : "+ CmmUtil.nvl(request.getParameter("cmt_seq")));
		log.info("start_page_size : "+ CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : "+ CmmUtil.nvl(request.getParameter("end_page_size")));
		
		// ��� ����Ʈ
		CommunityComDTO pDTO = new CommunityComDTO();
			
		pDTO.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"),"1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"),"6"));

		CommunityComDTO rDTO = com.getBusiCommentList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
	
		log.info("End community/busiCommentList !!");
		
		return "/busi/community/CommentListJSON";
	}
	
	
	/**
	 * ��� ���
	 * */
	@RequestMapping("community/busiInsertComment")
	public String busiinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");		
		log.info("Welcome community/busiInsertComment");
		
		String res = ""; //ó�� ���
		CommunityComDTO comDto = new CommunityComDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		log.info(CmmUtil.nvl(request.getParameter("cmt_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		comDto.setContents(contents);
		comDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		comDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (com.createComment(comDto)){
			//��� ����
			res = "1";
			
		}else{
			
			//��� ����
			res = "0";
			
		}
	
		model.addAttribute("res", res);
		
		return "/busi/community/CommentProc";
	}
	

	
	/**
	 * ��� ����
	 * */	
	@RequestMapping("community/busiUpdateComment")
	public String busiUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("busiUpdateComment");	
		String res = ""; //ó�� ���
		
		CommunityComDTO comDto = new CommunityComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		comDto.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		comDto.setContents(contents);
		comDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		comDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		comDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		
		if (com.updateComment(comDto)){
			//���� ����
			res = "1";
			
		}else{
			//���� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/community/CommentProc";
		
	}
	
	
	/**
	 * ��� ����
	 * */	
	@RequestMapping("community/busiDeleteComment")
	public String busideleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("hi community/busideleteComment ");
		
		String res = ""; //ó�� ���
		
		CommunityComDTO comDto = new CommunityComDTO();
		comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
		comDto.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		
		if (com.deleteComment(comDto)){
			//��� ����
			res = "1";
			
		}else{
			//��� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/community/CommentProc";
		
	}	
    
	// üũ�ڽ� ���� ��Ʈ�ѷ�
		@RequestMapping("community/busideleteCheck")
		public String busideleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
				throws Exception {

			log.info("Hellow community/busideleteCheck");

			String[] del_chk = request.getParameterValues("del_chk");

			for (String a : del_chk) {
				System.out.println(a);
			}
			CommunityDTO pDTO = new CommunityDTO();

			pDTO.setAllCheckSeq(del_chk);

			if (com.deleteAllCheckList(pDTO)) {
				model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");

			} else {
				model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");

			}
			log.info("byby community/busideleteCheck");
			pDTO = null;

			model.addAttribute("url", "busicommunityList.do");
			return "/redirect";
		}

	
	
/*
 * ########################################################################## 
 * 
 * ����� �� ��
 * 
 * ##########################################################################
 * 
 */

/*
 * ########################################################################## 
 * 
 * ����� �� ����
 * 
 * ##########################################################################
 * 
 */

// ����� Ŀ�´�Ƽ ����Ʈ ��������
@RequestMapping("community/guestcommunityList") // board.html
public String getguestCommunity(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	log.info("Welcome community/guestCommunityList !!");
	request.setCharacterEncoding("EUC-KR");

	if (request.getParameter("searchBox") != null && !request.getParameter("searchBox").equals("")) {
		log.info("aaa");
		String searchBox = request.getParameter("searchBox");
		String searchText = request.getParameter("searchText");
		if (searchText == null) {
			searchText = "";
		}
		model.addAttribute("searchBox", searchBox);
		log.info("searchBox :" + searchBox);
		model.addAttribute("searchText", searchText);
		log.info("searchText :" + searchText);
	}
	
	log.info("End community/guestCommunityList !!");
    return "/guest/community/guestcommunityList";
}


/**
 * �Խ��� �ʱ� ����Ʈ ��������
 * */
			   
@RequestMapping("community/guestCommunityIndex")
public String getguestIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
	log.info("Welcome community/guestCommunityIndex !!");
	
	request.setCharacterEncoding("UTF-8");
	
	// �Խ��� ����Ʈ
	CommunityDTO pDTO = new CommunityDTO();
	
	pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"),"1"));
	pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"),"6"));
    
	pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
	pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));
	
	log.info("SearchBox : " + pDTO.getSearchBox());
	log.info("SearchText : " + pDTO.getSearchText());
	
	CommunityDTO rDTO= com.getBusiList(pDTO);
	
	model.addAttribute("rDTO", rDTO);
	
	log.info("End community/guestCommunityIndex !!");

	
	return "/guest/community/CommunityListJSon";
}


//���⼭ ��۽���
//����� Ŀ�´�Ƽ ����
@RequestMapping("community/guestcommunityDetail")
public String guestCommunityDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {

	log.info("Welcome community/Detail !!");

	CommunityDTO communityDto = new CommunityDTO();
	communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	communityDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	
	// ��� ����Ʈ
	CommunityComDTO comDto = new CommunityComDTO();
	comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	comDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	communityDto = com.busiCommunityDetail(communityDto);
	
	model.addAttribute("communityDto", communityDto);
	
	log.info("End community/communityDetail !!");
	
	return "/guest/community/guestcommunityDetail";
}



/**
 * �۾��� ����ϱ�
 */
@RequestMapping("community/guestcommunityForm")
public String guestMenuReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
	log.info("Welcome community/guestcommunityForm !!");

	return "/guest/community/guestcommunityInsert";
}

/**
 * ��ϵ����� db �����ϱ�'
 */
@RequestMapping("community/guestInsert")
public String createguestMenuInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
		ModelMap model) throws Exception {

	log.info("Welcome community/guestCommunityInsert !!");

	//request.setCharacterEncoding("EUC-KR");
	
	CommunityDTO communityDto = new CommunityDTO();
	
	String contents =CmmUtil.nvl(request.getParameter("contents"));
	
	contents = contents.replaceAll("\r\n", "<br>");
	contents = contents.replaceAll("& #39;","'");
	contents = contents.replaceAll("& #40;","(");
	contents = contents.replaceAll("& #41;",")");
	contents = contents.replaceAll("& lt;","<");
	contents = contents.replaceAll("& gt;",">");
	
	String title =CmmUtil.nvl(request.getParameter("title"));
	
	title = title.replaceAll("\r\n", "<br>");
	title = title.replaceAll("& #39;","'");
	title = title.replaceAll("& #40;","(");
	title = title.replaceAll("& #41;",")");
	title = title.replaceAll("& lt;","<");
	title = title.replaceAll("& gt;",">");
	
	communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	communityDto.setTitle(title);
	communityDto.setContents(contents);
	communityDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
	communityDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
	communityDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

	communityDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	communityDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

	// select seq�� �� �޾ƿͼ� view���� detail�� ������
	// �̰Ŵ�ſ� ��.����

	log.info("cmt_seq : " + CmmUtil.nvl(request.getParameter("cmt_seq")));
	log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
	log.info("read_cnt : " + CmmUtil.nvl(request.getParameter("read_cnt")));
	log.info("user_no : " + CmmUtil.nvl(request.getParameter("user_no")));
	log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));
	log.info("reg_dt : " + CmmUtil.nvl(request.getParameter("reg_dt")));


	if (com.createCommunityInfo(communityDto)) {
		model.addAttribute("msg", "����� �Ϸ�Ǿ����ϴ�");
	} else {
		model.addAttribute("msg", "����� �����Ͽ����ϴ�");
	}
	// request.setAttribute("url", "detail.do?ctr_seq=1");

	log.info("End community/guestcommunityInsert !!");

	return "/guest/community/CommunityMsgToList";
}	


// �Խñ� ����
@RequestMapping("community/guestdelete")
public String deleteguestCommunityInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {	
	log.info("hellow community/guestdelete!!");
	CommunityDTO communityDto = new CommunityDTO();
	communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	if (com.deleteCommunityInfo(communityDto)) {
		model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
	} else {
		model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
	}
	model.addAttribute("url", "guestcommunityList.do");
	return "/redirect";

}


// �Խñ� ������Ʈȭ�� �����ִ°�
@RequestMapping("community/guestcommunityupdateForm")
public String guestupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
	log.info("hellow guestcommunity/updateForm !!");
	CommunityDTO communityDto = new CommunityDTO();
	communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	communityDto = com.getCommunityDetailInfo(communityDto);
	communityDto.setContents(communityDto.getContents().replaceAll("<br>", "\r\n"));
	model.addAttribute("communityDto", communityDto);
	return "guest/community/guestcommunityUpdate";
}



// �Խñ� ������ DB�� �ԷµǴ°�
@RequestMapping("community/guestupdate")
public String guestupdateCommunityInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
	try {
		request.setCharacterEncoding("EUC-KR");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	log.info("cmt_seq=" + CmmUtil.nvl(request.getParameter("cmt_seq")));
	log.info(CmmUtil.nvl(request.getParameter("title")));
	log.info(CmmUtil.nvl(request.getParameter("contents")));
	log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
	log.info(CmmUtil.nvl(request.getParameter("reg_user_no")));
	log.info(CmmUtil.nvl(request.getParameter("reg_dt")));
	log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
	log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
	log.info(CmmUtil.nvl(request.getParameter("fileGRP")));


	CommunityDTO communityDto = new CommunityDTO();

	String contents =CmmUtil.nvl(request.getParameter("contents"));
	
	contents = contents.replaceAll("\r\n", "<br>");
	contents = contents.replaceAll("& #39;","'");
	contents = contents.replaceAll("& #40;","(");
	contents = contents.replaceAll("& #41;",")");
	contents = contents.replaceAll("& lt;","<");
	contents = contents.replaceAll("& gt;",">");
	
	String title =CmmUtil.nvl(request.getParameter("title"));
	
	title = title.replaceAll("\r\n", "<br>");
	title = title.replaceAll("& #39;","'");
	title = title.replaceAll("& #40;","(");
	title = title.replaceAll("& #41;",")");
	title = title.replaceAll("& lt;","<");
	title = title.replaceAll("& gt;",">");
			
	communityDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	communityDto.setTitle(title);
	communityDto.setContents(contents);
	communityDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
	communityDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	communityDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
	communityDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

	log.info("byby community/update !!");

	if (com.updateCommunityInfo(communityDto)) {
		model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
	} else {
		model.addAttribute("msg", "������ �����Ͽ����ϴ�");
	}
	model.addAttribute("url", "guestcommunityList.do");
	return "/redirect";
}



/**
 * ��� �ʱ� ����Ʈ ��������
 * */
@RequestMapping("community/guestCommentList")
public String getguestCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
	log.info("Welcome community/guestCommentList !!");
	
	request.setCharacterEncoding("UTF-8");
	
	log.info("cmt_seq : "+ CmmUtil.nvl(request.getParameter("cmt_seq")));
	log.info("start_page_size : "+ CmmUtil.nvl(request.getParameter("start_page_size")));
	log.info("end_page_size : "+ CmmUtil.nvl(request.getParameter("end_page_size")));
	
	// ��� ����Ʈ
	CommunityComDTO pDTO = new CommunityComDTO();
		
	pDTO.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"),"1"));
	pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"),"6"));

	CommunityComDTO rDTO = com.getBusiCommentList(pDTO);
	
	model.addAttribute("rDTO", rDTO);

	log.info("End community/guestCommentList !!");
	
	return "/guest/community/CommentListJSON";
}


/**
 * ��� ���
 * */
@RequestMapping("community/guestInsertComment")
public String guestinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
		ModelMap model) throws Exception {
	request.setCharacterEncoding("UTF-8");
	
	log.info("Welcome community/guestInsertComment");

	String res = ""; //ó�� ���
	CommunityComDTO comDto = new CommunityComDTO();

	String contents =CmmUtil.nvl(request.getParameter("contents"));
	
	contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
	contents = contents.replaceAll("& #39;","'");
	contents = contents.replaceAll("& #40;","(");
	contents = contents.replaceAll("& #41;",")");
	contents = contents.replaceAll("& lt;","<");
	contents = contents.replaceAll("& gt;",">");
	
	log.info(CmmUtil.nvl(request.getParameter("cmt_seq")));
	log.info(CmmUtil.nvl(request.getParameter("contents")));
	
	comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	comDto.setContents(contents);
	comDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	comDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

	if (com.createComment(comDto)){
		//��� ����
		res = "1";
		
	}else{
		
		//��� ����
		res = "0";
		
	}

	model.addAttribute("res", res);
	
	return "/guest/community/CommentProc";
}



/**
 * ��� ����
 * */	
@RequestMapping("community/guestUpdateComment")
public String guestUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
	request.setCharacterEncoding("UTF-8");

	log.info("guestUpdateComment");
	
	String res = ""; //ó�� ���
	
	CommunityComDTO comDto = new CommunityComDTO();
	
	String contents =CmmUtil.nvl(request.getParameter("contents"));
	
	contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
	contents = contents.replaceAll("& #39;","'");
	contents = contents.replaceAll("& #40;","(");
	contents = contents.replaceAll("& #41;",")");
	contents = contents.replaceAll("& lt;","<");
	contents = contents.replaceAll("& gt;",">");
	
	comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	comDto.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
	comDto.setContents(contents);
	comDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	comDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	comDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
	
	if (com.updateComment(comDto)){
		//���� ����
		res = "1";
		
	}else{
		//���� ����
		res = "0";
		
	}
	
	model.addAttribute("res", res);
	
	return "/guest/community/CommentProc";
	
}


/**
 * ��� ����
 * */	
@RequestMapping("community/guestDeleteComment")
public String guestdeleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
		throws Exception {
	
	log.info("hi community/guestdeleteComment ");
	
	String res = ""; //ó�� ���
	
	CommunityComDTO comDto = new CommunityComDTO();
	comDto.setCmt_seq(CmmUtil.nvl(request.getParameter("cmt_seq")));
	comDto.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
	
	if (com.deleteComment(comDto)){
		//��� ����
		res = "1";
		
	}else{
		//��� ����
		res = "0";
		
	}
	
	model.addAttribute("res", res);
	
	return "/guest/community/CommentProc";
	
}	

}

/*
 * ########################################################################## 
 * 
 * ����� �� ��
 * 
 * ##########################################################################
 * 
 */
