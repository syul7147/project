package kr.ezen.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ezen.project.domain.AdminDTO;
import kr.ezen.project.domain.CategoryDTO;
import kr.ezen.project.domain.ProductDTO;
import kr.ezen.project.domain.ScategoryDTO;
import kr.ezen.project.domain.UserDTO;
import kr.ezen.project.util.Pspec;
import kr.ezen.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/home.do")
	public String adminHome() {
		return "admin/ad_main";
	}
	@RequestMapping("/register.do")
	public String register() {
		return "admin/register";
	}
	@PostMapping("/registerOk.do")
	public String registerOk(AdminDTO dto) {
		adminService.registerOk(dto);
		return "redirect:home.do";
	}
	@GetMapping("/login.do")
	public String adminLogin(String moveUrl,Model model) {
		model.addAttribute("moveUrl",moveUrl);
		return "admin/ad_login";
	}
	@PostMapping("/adminLoginOk.do")
	public String adminLoginOk(AdminDTO dto,String moveUrl) {
		boolean result= adminService.loginOk(dto);
		System.out.println("moveUrl" + moveUrl);
		System.out.println(result);
		if(!result) {
			return "redirect:login.do?moveUrl="+moveUrl;
		}
		if(!moveUrl.equals("")) {
			
			return "redirect:"+moveUrl;
		}
		session.setAttribute("mode","admin");
		return "redirect:home.do";
	}
	  @GetMapping("/adminIdCheck.do")
	  @ResponseBody
	  public String adminIdCheck(@RequestParam("id") String id){
	  String uid = adminService.idCheck(id);
	  if(uid ==null) {
		  return "yes"; }
	  if(!uid.equals(id)) {
		  return "yes";
	  }
	  	return "no";
	  }
	 

	@RequestMapping("/logout.do")
	public String logout() {
		session.invalidate();
		return "redirect:home.do";
			
	}
	@RequestMapping("/category.do")
	public String category() {
		return "admin/category";	
	}
	@PostMapping("/categoryOk.do")
	public String cateoryOk(CategoryDTO dto) {
		int n = adminService.categoryOk(dto);
		return "redirect:home.do";
	}
	@RequestMapping("/categoryList.do")
	public String cList(Model model) {
		List<CategoryDTO> cDto = adminService.cList();
		List<ScategoryDTO> sDto = adminService.scList();
		
		System.out.println(cDto);
		model.addAttribute("cDto",cDto);
		model.addAttribute("sDto",sDto);
		return "admin/category_list";
	}
	@RequestMapping("/categorySub.do")
	public String subCategory(Model model) {
		List<CategoryDTO> cDto = adminService.cList();
		model.addAttribute("cDto",cDto);
		return "admin/category_sub";
		
	}
	@PostMapping("/categorySub.do")
	public String inputCategory(ScategoryDTO dto) {
		System.out.println(dto);
		int n = adminService.sList(dto);
		return "redirect:home.do";
	}
	@RequestMapping("/catInfo.do")
	public String catInfo(int c_num,Model model) {
		CategoryDTO cDto = adminService.CList(c_num);
		model.addAttribute("cDto",cDto);
		return "admin/category_info";
	}
	@RequestMapping("/remove.do")
	public String remove(int c_num) {
		adminService.remove(c_num);
		return "redirect:categoryList.do";
	}
	@RequestMapping("/modify.do")
	public String modify(CategoryDTO dto){
		System.out.println(dto);
		adminService.update(dto);
		return "redirect:categoryList.do";
	}
	@RequestMapping("/subInfo.do")
	public String subInfo(int c_num, Model model) {
		ScategoryDTO sDto = adminService.Sclist(c_num);
		List<CategoryDTO> cdto =adminService.cList();
		model.addAttribute("sDto",sDto);
		model.addAttribute("cDto",cdto);
		
		return "admin/subInfo";
	}
	@RequestMapping("/subremove.do")
	public String subremove(int c_num) {
		adminService.subremove(c_num);
		return "redirect:categoryList.do";
	}
	@RequestMapping("/submodify.do")
	public String submodify(ScategoryDTO dto){

		adminService.subupdate(dto);
		return "redirect:categoryList.do";
	}
	@RequestMapping("/prod")
	public String prod(Model model) {
		List<CategoryDTO> cDto =adminService.cList();
		List<ScategoryDTO> sDto = adminService.scList();

		Pspec[] pspec = Pspec.values();
		model.addAttribute("Pspec",pspec);
		model.addAttribute("sDto",sDto);
		model.addAttribute("cDto",cDto);
		
		
		return "admin/prod_input";
	}
	
	@RequestMapping("/prodInput.do")
	public String ProdInput(MultipartHttpServletRequest mhr, HttpServletRequest request, Model model)throws IOException{
		String repo  ="resources/fileRepo";
		
		String savePath = request.getServletContext().getRealPath("") + File.separator+repo;
		System.out.println(savePath);
		
		Map map = new HashMap();
		
		// mhr�� �Ϲ� �ؽ�Ʈ, ���̳ʸ� ���� ������ ��� ���� �� �ִ� ��ü
		//input�� name�Ӽ��� �� = �Ķ���Ͱ��� ������(id,name)
		Enumeration<String> enu = mhr.getParameterNames();
		
		
		while(enu.hasMoreElements()) {
			String paramName = enu.nextElement(); //Ű��
			//�ش� �Ķ���� ���� �� => input�� value��
			String paramValue = mhr.getParameter(paramName); //������
			//name:kim, id: test
//			System.out.println(paramName+"11");
//			System.out.println(paramValue+"22");
			map.put(paramName, paramValue);
			
		}
		
		Iterator<String> iter = mhr.getFileNames();
		String pimage = new String();
		String originName = "";
		while(iter.hasNext()) {
			String fileParamName = iter.next();
			System.out.println(fileParamName);
			//MultipartFile : ���� ������ ������ �ִ� ��ü
			MultipartFile mFile=mhr.getFile(fileParamName);
			// ÷�ε� ���ϸ�
			originName = mFile.getOriginalFilename();
			System.out.println(originName);
			// ~\day05_fileUpDown\\resources/fileRepo//file1
			File file = new File(savePath+"\\"+fileParamName);
			
			if(mFile.getSize()!=0) { //���ε� �� ���
				if(!file.exists()) {//������ �������� ������
//					file.createNewFile();//�ӽ� ���� ����
					if(file.getParentFile().mkdir()) { // 
						file.createNewFile();//�ӽ����� ����
					}//if
				}//if
				
				File uploadFile = new File(savePath+"\\"+originName);
				//�ߺ��� ���ϸ� ��ü
				if(uploadFile.exists()) {
					originName = System.currentTimeMillis()+"_"+originName;
					uploadFile = new File(savePath+"\\"+originName);

				}
				// ���� ���� ���ε�
				mFile.transferTo(uploadFile);
				pimage=originName;
			}//if
		}//while
		
		//���� ���� ������ ����Ʈ�� �ʿ� �߰�
		map.put("pimage", pimage);
		adminService.prodInput(map);
		return "redirect:prodList.do";
	}
	@RequestMapping("/prodList.do")
	public String prodList(Model model) {
		List<ProductDTO> list = adminService.prodList();
		model.addAttribute("list",list);
		return "admin/prod_list";
	}
	@RequestMapping("/prodUpdate.do")
	public String prodUpdate(int pnum,Model model) {
		ProductDTO dto = adminService.prodUpdate(pnum);
		List<CategoryDTO> cDto = adminService.cList();
		List<ScategoryDTO> csDto = adminService.scList();
		System.out.println(csDto);
		model.addAttribute("dto",dto);
		model.addAttribute("cDto",cDto);
		model.addAttribute("csDto",csDto);
		return "admin/prod_update";
		
	}
	@RequestMapping("/prodUpdateOk.do")
	public String ProdUpdate(MultipartHttpServletRequest mhr, HttpServletRequest request, Model model)throws IOException{
		
		String repo  ="resources/fileRepo";
		
		String savePath = request.getServletContext().getRealPath("") + File.separator+repo;
		System.out.println(savePath);
		
		Map map = new HashMap();
		
		// mhr�� �Ϲ� �ؽ�Ʈ, ���̳ʸ� ���� ������ ��� ���� �� �ִ� ��ü
		//input�� name�Ӽ��� �� = �Ķ���Ͱ��� ������(id,name)
		Enumeration<String> enu = mhr.getParameterNames();
		
		
		while(enu.hasMoreElements()) {
			String paramName = enu.nextElement(); //Ű��
			//�ش� �Ķ���� ���� �� => input�� value��
			String paramValue = mhr.getParameter(paramName); //������
			//name:kim, id: test
//			System.out.println(paramName+"11");
//			System.out.println(paramValue+"22");
			map.put(paramName, paramValue);
			
		}
		
		Iterator<String> iter = mhr.getFileNames();
		String pimage = new String();
		String originName = "";
		
		while(iter.hasNext()) {
			String fileParamName = iter.next();
			System.out.println(fileParamName);
			//MultipartFile : ���� ������ ������ �ִ� ��ü
			MultipartFile mFile=mhr.getFile(fileParamName);
			// ÷�ε� ���ϸ�
			originName = mFile.getOriginalFilename();
			if(originName=="") {
				originName = mhr.getParameter("pimage");
				
			}
			map.put("pimage", originName);
			System.out.println("originName = " + originName);
	
			
			// ~\day05_fileUpDown\\resources/fileRepo//file1
			File file = new File(savePath+"\\"+fileParamName);
			
			if(mFile.getSize()!=0) { //���ε� �� ���
				if(!file.exists()) {//������ �������� ������
//					file.createNewFile();//�ӽ� ���� ����
					if(file.getParentFile().mkdir()) { // 
						file.createNewFile();//�ӽ����� ����
					}//if
				}//if
				
				File uploadFile = new File(savePath+"\\"+originName);
				//�ߺ��� ���ϸ� ��ü
				if(uploadFile.exists()) {
					originName = System.currentTimeMillis()+"_"+originName;
					uploadFile = new File(savePath+"\\"+originName);

				}
				// ���� ���� ���ε�
				mFile.transferTo(uploadFile);
				pimage=originName;
				System.out.println(pimage);
			}//if
		}//while
		System.out.println(map);
		adminService.prodUpdateOk(map);
		return "redirect:prodList.do";
	}
	@RequestMapping("prodDel.do")
	public String prodDel(int pnum) {
	adminService.prodDel(pnum);
		return "redirect:prodList.do";
	}
	@RequestMapping("userList.do")
	public String userList(Model model) {
		List<UserDTO> mDto = adminService.userList();
		model.addAttribute("mDto",mDto);
		return "admin/user_list";
	}

	@RequestMapping("userDelete.do")
	public String delete(String id) {
		adminService.userDel(id);
		return "redirect:userList.do";
		
	}

	

	
}
