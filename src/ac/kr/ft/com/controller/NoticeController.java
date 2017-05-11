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
import ac.kr.ft.com.dto.NoticeComDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import ac.kr.ft.com.service.INoticeService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService notice;
	
	@RequestMapping("notice")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {
		
		return "/notice/samplePage";
	}
	
	//�Խ��� ����Ʈ ��Ʈ�ѷ�
	@RequestMapping("notice/noticeList")
	public String getNoticeList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("Welcome notice/noticeList !!");
		List<NoticeDTO> rList = notice.getNoticeList();
		model.addAttribute("rList", rList);
		return "/notice/noticeList";
	}

	//�Խ��� �� ���� ��Ʈ�ѷ�
	@RequestMapping("notice/noticeDetail")
	public String getNoticeDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/noticeDetail !!");

		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setContents(CmmUtil.nvl(request.getParameter("contents")).replaceAll("<br>", "\r\n"));
	
		// ��� ����Ʈ
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(CmmUtil.nvl(request.getParameter("contents")));

		noticeDto = notice.getNoticeDetail(noticeDto, noticee);
		
		model.addAttribute("noticeDto", noticeDto);	
		log.info("END notice/noticeDetail !!");
		return "/notice/noticeDetail";
	}

	
	/**
	 * �Խ��� ��� �ʱ� ����Ʈ ��������
	 * */
	@RequestMapping("notice/CommentList")
	public String CommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/CommentList !!");
		
		request.setCharacterEncoding("UTF-8");
		
		log.info("notice_seq : "+ CmmUtil.nvl(request.getParameter("notice_seq")));
		
		// ��� ����Ʈ
		NoticeComDTO pDTO = new NoticeComDTO();
				
		pDTO.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
	
		NoticeComDTO rDTO = notice.getNoticeComList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
	
		log.info("End notice/CommentList !!");
		
		return "/notice/NoticeComJSON";
	}
	
	
	/**
	 * ���ȭ�� �����ֱ�
	 */
	@RequestMapping("notice/noticeInsert")
	public String insertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		log.info("Welcome notice/noticeInsertForm");

		return "/notice/noticeInsert";
	}

	
	/**
	 * ��ϵ����� db�����ϱ�
	 * 
	 **/
	@RequestMapping("notice/insert")
	public String insertNoticeInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
				
		log.info("Welcome notice/noticeinsert");		
		NoticeDTO noticeDto = new NoticeDTO();
	
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
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticeDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticeDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
			
		// menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		//noticeDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("reg_user_no")));

		if (notice.createNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "����� �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "����� �����Ͽ����ϴ�");
		}

		log.info("End notice/noticeInsert !!");

		return "/notice/noticeMsgToList";
	}

	//�Խ��� ������Ʈ �ϴ� ��� �����ִ� ��Ʈ�ѷ�
	@RequestMapping("notice/noticeupdateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow notice/updateForm !!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto = notice.getNoticeDetailInfo(noticeDto);
		noticeDto.setContents(CmmUtil.nvl(noticeDto.getContents().replaceAll("<br>", "\r\n")));
		model.addAttribute("noticeDto", noticeDto);
		return "/notice/noticeUpdate";
	}

	//�Խ��� ������Ʈ ��Ʈ�ѷ�
	@RequestMapping("notice/update")
	public String updateNoticeInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")).replaceAll("<br>", "\r\n"));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("reg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		response.setCharacterEncoding("EUC-KR");
		NoticeDTO noticeDto = new NoticeDTO();
		
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

		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setChg_user_no(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NO")));
		noticeDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby notice/update !!");

		if (notice.updateNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �����Ͽ����ϴ�");
		}
		model.addAttribute("url", "noticeList.do");
		return "/redirect";
	}

	//�Խ��� ���� ��Ʈ�ѷ�
	@RequestMapping("notice/delete")
	public String deleteNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		if (notice.deleteNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}else{
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}
		model.addAttribute("url", "noticeList.do");
		return "/redirect";
	}
	
	//üũ�ڽ� ���� ��Ʈ�ѷ�
	@RequestMapping("notice/deleteCheck")
	public String deleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		String[] del_chk = request.getParameterValues("del_chk");

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (notice.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");

		} else {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");

		}

		pDTO = null;

		model.addAttribute("url", "/notice/noticeList.do");
		return "/redirect";
	}

	// ��� ��� ��Ʈ�ѷ�
	@RequestMapping("notice/insertComment")
	public String insertComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
	
			
		log.info("Welcome notice/insertComment");
		request.setCharacterEncoding("UTF-8");
		String res = ""; //ó�� ���
		NoticeComDTO noticee = new NoticeComDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
				
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(contents);
		noticee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticee.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

			if (notice.createComment(noticee)){
				//��� ����
				res = "1";
				
			}else{
				
				//��� ����
				res = "0";
				
			}
			log.info("Welcome byby/insertComment");
			model.addAttribute("res", res);
			return "/notice/CommentProc";
	}

	
		

	
	
	
	
	// ��� ���� ��Ʈ�ѷ�
	@RequestMapping("notice/deleteComment")
	public String deleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hi notice/deleteComment ");
		
		log.info(CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		
		
		String res = ""; 
		
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		if (notice.deleteComment(noticee)) {
			//��� ����
			res = "1";
			
		}else{
			//��� ����
			res = "0";
			
		}		
		log.info("END notice/deleteComment ");
	
		model.addAttribute("res", res);
		
		return "/notice/CommentProc";
	}

	

	
	// ��� ���� ��Ʈ�ѷ�
	@RequestMapping("notice/updateComment")
	public String updateComment(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		log.info("hellow notice/updateComment");
		
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info("User_no=" +CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		log.info("Chg_dt="+CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info("Chg_user_no"+CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
		String res = ""; //ó�� ���
	
	
		NoticeComDTO noticee = new NoticeComDTO();
	
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		noticee.setContents(contents);
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
		if (notice.updateComment(noticee)) {
			//���� ����
			res = "1";
			
		}else{
			//���� ����
			res = "0";
			
		}
		
		log.info("byby notice/update !!");
		model.addAttribute("res", res);
		return "/notice/CommentProc";
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

	
	// ����� �������� ����Ʈ ��������
	@RequestMapping("notice/businoticeList") // board.html
	public String getNotice(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome notice/busiNoticeList !!");
        
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

		
		
		log.info("End notice/busiNoticeList !!");

		return "/busi/notice/businoticeList";
	}

	
	/**
	 * �Խ��� �ʱ� ����Ʈ ��������
	 * */
	
	@RequestMapping("notice/busiNoticeIndex")
	public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/busiNoticeIndex !!");
		
		request.setCharacterEncoding("UTF-8");

		
		// �Խ��� ����Ʈ
		NoticeDTO pDTO = new NoticeDTO();
		
		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"),"1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"),"6"));

		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));
		
		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());
	
		
		NoticeDTO rDTO= notice.getBusiList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
		
		log.info("End notice/busiNoticeIndex !!");
	
		
		return "/busi/notice/NoticeListJSON";
	}
	
	
	//���⼭ ��۽���
	//����� �������� ����
	@RequestMapping("notice/businoticeDetail")
	public String busiNoticeDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {

		log.info("Welcome notice/noticeDetail !!");

		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setUser_name(CmmUtil.nvl((String) session.getAttribute("USER_NAME")));
		
		// ��� ����Ʈ
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));

		noticeDto = notice.busiNoticeDetail(noticeDto);
		
		model.addAttribute("noticeDto", noticeDto);
		
		log.info("End notice/noticeDetail !!");
		
		return "/busi/notice/businoticeDetail";
	}

	
	
	/**
	 * �۾��� ����ϱ�
	 */
	@RequestMapping("notice/businoticeForm")
	public String BusiMenuReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/businoticeForm !!");

		return "/busi/notice/businoticeInsert";
	}

	/**
	 * ��ϵ����� db �����ϱ�'
	 */
	@RequestMapping("notice/busiInsert")
	public String createBusiMenuInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("Welcome menu/BusiNoticeInsert !!");
		
		NoticeDTO noticeDto = new NoticeDTO();
		
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
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		noticeDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticeDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		// select seq�� �� �޾ƿͼ� view���� detail�� ������
		// �̰Ŵ�ſ� ��.����

		log.info("notice_seq : " + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("read_cnt : " + CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info("user_no : " + CmmUtil.nvl(request.getParameter("user_no")));
		log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("reg_dt : " + CmmUtil.nvl(request.getParameter("reg_dt")));

		// select seq�� �� �޾ƿͼ� view ���� detail�� ������
		// �̰Ŵ�ſ� ��.����
		if (notice.createNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "����� �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "����� �����Ͽ����ϴ�");
		}
		// request.setAttribute("url", "detail.do?ctr_seq=1");

		log.info("End menu/BusinoticeInsert !!");

		return "/busi/notice/noticeMsgToList";
	}	
	
	
	// �Խñ� ����
	@RequestMapping("notice/busidelete")
	public String deleteBusiNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {	
		log.info("hellow notice/busidelete!!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		if (notice.deleteNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}
		model.addAttribute("url", "businoticeList.do");
		return "/redirect";
	
	}
	
	
	
	@RequestMapping("notice/businoticeupdateForm")
	public String busiupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow businotice/updateForm !!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto = notice.getNoticeDetailInfo(noticeDto);
		noticeDto.setContents(noticeDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("noticeDto", noticeDto);
		return "busi/notice/businoticeUpdate";
	}

	
	
	
	@RequestMapping("notice/busiupdate")
	public String busiupdateNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		response.setCharacterEncoding("EUC-KR");
		NoticeDTO noticeDto = new NoticeDTO();
		
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
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		noticeDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby notice/update !!");

		if (notice.updateNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �����ϼ̽��ϴ�");
		}
		model.addAttribute("url", "businoticeList.do");
		return "/redirect";
	}
	
	
	
	/**
	 * ��� �ʱ� ����Ʈ ��������
	 * */
	@RequestMapping("notice/busiCommentList")
	public String getBusiCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/busiCommentList !!");
		
		request.setCharacterEncoding("UTF-8");
		
		log.info("notice_seq : "+ CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info("start_page_size : "+ CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : "+ CmmUtil.nvl(request.getParameter("end_page_size")));
		
		// ��� ����Ʈ
		NoticeComDTO pDTO = new NoticeComDTO();
		pDTO.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"),"1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"),"6"));

		NoticeComDTO rDTO = notice.getBusiCommentList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
	
		log.info("End notice/busiCommentList !!");
		
		return "/busi/notice/CommentListJSON";
	}
	
	
	/**
	 * ��� ���
	 * */
	@RequestMapping("notice/busiInsertComment")
	public String busiinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome notice/busiInsertComment");

		String res = ""; //ó�� ���
		NoticeComDTO noticee = new NoticeComDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
				
		log.info(CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		log.info(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
			
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(contents);
		noticee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (notice.createComment(noticee)){
			//��� ����
			res = "1";
			
		}else{
			
			//��� ����
			res = "0";
			
		}
	
		model.addAttribute("res", res);
		
		return "/busi/notice/CommentProc";
	}
		
	/**
	 * ��� ����
	 * */	
	@RequestMapping("notice/busiUpdateComment")
	public String busiUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("notice/busiUpdateComment");
		
		String res = ""; //ó�� ���
		
		NoticeComDTO noticee = new NoticeComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		noticee.setContents(contents);
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		
		if (notice.updateComment(noticee)){
			//���� ����
			res = "1";
			
		}else{
			//���� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/notice/CommentProc";
		
	}
	
	
	/**
	 * ��� ����
	 * */	
	@RequestMapping("notice/busiDeleteComment")
	public String busideleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("hi notice/busideleteComment ");
		
		String res = ""; //ó�� ���
		
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		
		if (notice.deleteComment(noticee)){
			//��� ����
			res = "1";
			
		}else{
			//��� ����
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/notice/CommentProc";
		
	}	

	// üũ�ڽ� ���� ��Ʈ�ѷ�
	@RequestMapping("notice/busideleteCheck")
	public String busideleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Hellow notice/busideleteCheck");

		String[] del_chk = request.getParameterValues("del_chk");

		for (String a : del_chk) {
			System.out.println(a);
		}
		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (notice.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");

		} else {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");

		}
		log.info("byby notice/busideleteCheck");
		pDTO = null;

		model.addAttribute("url", "businoticeList.do");
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
	 * #########################################################################
	 * #
	 * 
	 * ����� �� ����
	 * 
	 * #########################################################################
	 * #
	 * 
	 */

	
	
	
	
	// ����� �������� ����Ʈ ��������
	@RequestMapping("notice/guestnoticeList") // board.html
	public String getguestNotice(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/guestnoticeList !!");

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

		log.info("End notice/guestnoticeList !!");

		return "/guest/notice/guestnoticeList";
	}

	/**
	 * �Խ��� �ʱ� ����Ʈ ��������
	 */

	@RequestMapping("notice/guestNoticeIndex")
	public String getguestIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/guestNoticeIndex !!");

		request.setCharacterEncoding("UTF-8");

		// �Խ��� ����Ʈ
		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));

		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());

		NoticeDTO rDTO = notice.getBusiList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End notice/guestNoticeIndex !!");

		return "/guest/notice/guestNoticeListJSON";
	}

	
	// �Խ��� �� ���� ��Ʈ�ѷ�
	@RequestMapping("notice/guestnoticeDetail")
	public String guestNoticeDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome notice/guestnoticeDetail !!");

		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));

		
		// ��� ����Ʈ
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		
		
		//log.info(CmmUtil.nvl(request.()));
		
		noticeDto = notice.getNoticeDetail(noticeDto,noticee);

		model.addAttribute("noticeDto", noticeDto);

		log.info("End notice/guestnoticeDetail !!");

		return "/guest/notice/guestnoticeDetail";
	
	}
	

	/**
	 * ��� �ʱ� ����Ʈ ��������
	 */
	@RequestMapping("notice/guestCommentList")
	public String getguestCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/guestCommentList !!");

		request.setCharacterEncoding("UTF-8");

		// ��� ����Ʈ
		NoticeComDTO pDTO = new NoticeComDTO();

		pDTO.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"), "1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"), "6"));

		log.info("notice_seq : " + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info("start_page_size : " + CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : " + CmmUtil.nvl(request.getParameter("end_page_size")));
	
		NoticeComDTO rDTO = notice.getBusiCommentList(pDTO);
			
		model.addAttribute("rDTO", rDTO);

		log.info("End notice/guestCommentList !!");

		return "/guest/notice/guestCommentListJSON";
	}

	
	// �Խñ� ����
	@RequestMapping("notice/guestdelete")
	public String deleteguestNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {	
		log.info("hellow notice/guestdelete!!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		if (notice.deleteNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		}
		model.addAttribute("url", "guestnoticeList.do");
		return "/redirect";
	
	}
	
	// �Խñ� ������Ʈ ��� �����ִ���Ʈ�ѷ�
	@RequestMapping("notice/guestnoticeupdateForm")
	public String guestUpdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow busiontice/updateForm !!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto = notice.getNoticeDetailInfo(noticeDto);
		noticeDto.setContents(noticeDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("noticeDto", noticeDto);
		return "/guest/notice/guestnoticeUpdate";
	}

	@RequestMapping("notice/guestUpdate")
	public String guestupdateNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));


		NoticeDTO noticeDto = new NoticeDTO();	
		
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
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		noticeDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby notice/update !!");

		if (notice.updateNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "������ �Ϸ�Ǿ����ϴ�");
		} else {
			model.addAttribute("msg", "������ �����ϼ̽��ϴ�");
		}
		model.addAttribute("url", "guestnoticeList.do");
		return "/redirect";
	}


	/**
	 * ��� ���
	 */
	@RequestMapping("notice/guestInsertComment")
	public String guestinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome notice/guestInsertComment");

		String res = ""; // ó�� ���
		NoticeComDTO noticee = new NoticeComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		log.info(CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));

		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(contents);
		noticee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (notice.createComment(noticee)) {
			// ��� ����
			res = "1";

		} else {

			// ��� ����
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/notice/CommentProc";
	}

	/**
	 * ��� ����
	 */
	@RequestMapping("notice/guestUpdateComment")
	public String guestUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("hihi notice/guestUpdateComment");
	
		String res = ""; // ó�� ���

		NoticeComDTO noticee = new NoticeComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		noticee.setContents(contents);
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));

		if (notice.updateComment(noticee)) {
			// ���� ����
			res = "1";

		} else {
			// ���� ����
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/notice/CommentProc";

	}

	/**
	 * ��� ����
	 */
	@RequestMapping("notice/guestDeleteComment")
	public String guestdeleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("hi notice/guestdeleteComment ");

		String res = ""; // ó�� ���

		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));

		if (notice.deleteComment(noticee)) {
			// ��� ����
			res = "1";

		} else {
			// ��� ����
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/notice/CommentProc";

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
 