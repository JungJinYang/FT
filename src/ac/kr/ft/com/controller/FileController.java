package ac.kr.ft.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ac.kr.ft.com.dto.FileDTO;
import ac.kr.ft.com.service.IFileService;
import ac.kr.ft.com.util.CmmUtil;
import ac.kr.ft.com.util.DateUtil;

@Controller
public class FileController {
	private Logger log = Logger.getLogger(this.getClass());
	private String FileSaveRootPath = "c:/SW_workspace/workspace/FT/WebContent"; //����� ����Ʈ

	
	@Resource(name = "FileService")
	private IFileService fileService;
	
	
	/**
	 * �̱� ���� ���ε� �˾� â ���� 
	 * */
	@RequestMapping(value="file/FileUploadSingPOP")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {
		log.info("Welcome file/FileUploadSinglePOP !!"); 
		
		return "/file/FileUploadSinglePOP";
	}
	
	
	/**
	 * ���� ���ε� ó���� ���� ó�� �Լ� 
	 * */
	@RequestMapping(value="file/FileUploadProc", method=RequestMethod.POST)
	public String FileUploadProc(HttpServletRequest request, HttpSession session, @RequestParam("fileUpload") MultipartFile file, ModelMap model) throws Exception {

		String msg = ""; //��� �޽��� �ޱ�
		
		log.info("Welcome file/FileUploadProc !!"); 

		try{
			
			//���� ���ε� ��� ������ ���� ���� input ��ü
			String jObj = CmmUtil.nvl((String)request.getParameter("jObj"));
			
			//�̹��� ������ ��ü
			String vObj = CmmUtil.nvl((String)request.getParameter("vObj"));
			
			String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"), "10000001"); //�α��ε� ����� ���̵�
			
			//���� ���� �̸� ����
			String fileOrgName = file.getOriginalFilename();
			
			//���� ����Ǵ� Ȯ���� ����
			int pos = fileOrgName.lastIndexOf( "." ); //Ȯ���� ��ġ
			String ext = fileOrgName.substring( pos + 1 ).toLowerCase(); //Ȯ����
			
			log.info("file ext : "+ ext);			
			
			//�̹��� ������ �ƴ϶�� ���� ó��
			if (!(ext.equals("jpg")||ext.equals("jpeg")||ext.equals("png")||ext.equals("gif"))){
				 throw new Exception("�̹��� ������ �ƴմϴ�.");
				 
			}
			
			//����� ���� �̸�
			String fileSaveName = user_no +"_FILE_"+ DateUtil.getDate("yyyyMMddHHmmss") +"."+ ext;
			
			//���� ���
			String savePath = "/upload/" + DateUtil.getTodayYYYY() + "/" + DateUtil.getTodayMM() + "/" + DateUtil.getTodayDD();
			
			log.info("jObj : "+ jObj);
			log.info("vObj : "+ vObj);
			log.info("user_no : "+ user_no);
			log.info("fileOrgName : "+ fileOrgName);
			log.info("ext : "+ ext);
			log.info("fileSaveName : "+ fileSaveName);
			log.info("savePath : "+ savePath);
			
			//���� ������ ���ε��ϱ� ���� ���� ��ü ����
			File f = new File(FileSaveRootPath + savePath + "/"+ fileSaveName);
			
			//������ ���ٸ� ���� ����
			if (!f.exists()) {
				f.mkdirs();
				
			}

			//���� ����
			file.transferTo(f);

			/*
			 * DBó��
			 * */
			
			log.info("Start DB proc : file/FileUploadProc !!");
			
			//���� ������ ��������
			FileDTO rDTO = fileService.getFileInfoSeq();
			
			if (rDTO == null){
				rDTO = new FileDTO(); 
			}
			
			String fileGRP = CmmUtil.nvl(rDTO.getFile_grp()); //���� �׷� ���̵�
			
			log.info("fileGRP : "+ fileGRP);
			
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_org_name(fileOrgName); //���� ���� �̸�
			fileDTO.setFile_save_name(fileSaveName); //����� ���� �̸�
			fileDTO.setFile_path(savePath); //���� ���
			fileDTO.setReg_id(user_no); //ȸ����ȣ
			fileDTO.setFile_grp(fileGRP);; //�׷� ���̵�
			
			//���� ���� �����ϱ�
			fileService.insertFileInfo(fileDTO);
			
			model.addAttribute("jObj", jObj); //fileGRP ��ü
			model.addAttribute("fileGRP", fileGRP); //����� fileGRP �����ϱ�
			
			model.addAttribute("vObj", vObj); //�̹��� ������ ��ü
			model.addAttribute("viewImgSRC", savePath + "/"+ fileSaveName); //������ �̹��� ���
			
			log.info("End file/FileUploadProc !!");

		} catch (IOException e) {
			log.info("ERROR IOException : "+ e.toString());
			msg = e.toString();
			
		} catch (Exception e) {
			log.info("ERROR Exception : "+ e.toString());
			msg = e.toString();
			
		}

		model.addAttribute("msg", msg); //�޽��� �����ֱ�
		
		return "/file/fileMsg";
	}
	
}
