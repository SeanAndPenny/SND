package com.wondersgroup.wszygl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.ggwsgl.model.TjxxModel;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.manager.HtglManager;
import com.wondersgroup.wszygl.model.FileUtils;
import com.wondersgroup.wszygl.model.MedicalPersonHtModel;
import com.wondersgroup.wszygl.model.MedicalPersonModel;
import com.wondersgroup.wszygl.model.ReadExcel;
import com.wondersgroup.wszygl.model.TbDxRshtx;
import com.wondersgroup.ylfwgl.manager.XdsjManager;

//合同管理
@Controller
@RequestMapping("/htgl")
public class HtglController extends BaseMybatisController<TbDxRshtx, String> {
	@Autowired
	public HtglManager htglmanager;

	// 合同管理
	@RequestMapping("/htgl")
	public ModelAndView ckxx(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/htglList");
		try {
			List<YljgModel> jgList = htglmanager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<TbDxRshtx> page = htglmanager.pageSelect(pageRequest);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

	// 删除合同
	@RequestMapping("/scht")
	public ModelAndView scht(HttpServletRequest request, HttpServletResponse response) {

		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		String zjhm = request.getParameter("zjhm");
		String dqrq = request.getParameter("dqrq");
		int i = htglmanager.getScht(zjhm, dqrq);
		result.setViewName("wszygl/scht_success");
		if (i > 0) {
			result.addObject("successrMsg", "删除成功！");
		} else {
			result.addObject("successrMsg", "删除失败！");
		}

		return result;
	}

	// 导入合同
	@RequestMapping("/importData")
	public ModelAndView upLoad(@RequestParam(value = "filename") MultipartFile file, Map<String, Object> map,
			HttpServletRequest request) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/htglList");
		String msg = "";
		// 获取文件名
		String name = file.getOriginalFilename();
		// 定义一个本地文件副本(路径+文件名),用来接收前端上传的文件内容容
		String localfile = new File(" ").getAbsolutePath()+"newFile.xlsx";//需要修改文件路径
		try {
			List<TbDxRshtx> drhtModel = excelImport(name, file,localfile);
			for(int i=0;i<drhtModel.size();i++) {
				Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
				System.out.println("drhtModel="+drhtModel.get(i));	
				//htglmanager.save(drhtModel.get(i));
				htglmanager.insertExcel(drhtModel.get(i));
			}
			result.addObject("errorMsg", "导入成功！");
			// msg = "解析成功,总共"+TbDxRshtx.size()+"条!";
		}catch(Exception e){
			e.printStackTrace();
			
			
			result.addObject("errorMsg", "导入失败！");
		}
		map.put("msg", msg);
		return result;
	}
	public List<TbDxRshtx> excelImport(String name, MultipartFile file, String localfile) {
		ReadExcel ReadExcel = new ReadExcel();
		List<TbDxRshtx> excelInfo = ReadExcel.getExcelInfo(name, file, localfile);
		return excelInfo;
	}
	
	
	
	   // 模板下载
		@RequestMapping("/export")
		public void exportXls(HttpServletRequest request,HttpServletResponse response) throws Exception{
		// 一个流
		// 两个头
		// 下载文件的mime类型
		response.setContentType("application/vnd.ms-excel"); // 常见的文件 可以省略

		// 文件的打开方式 inline在线打开 attachment
		String agent = request.getHeader("User-Agent");
		String filename = FileUtils.encodeDownloadFilename("模板.xlsx", agent);
		response.setHeader("content-disposition", "attachment;fileName="+filename);
		ServletOutputStream outputStream = response.getOutputStream();

		// 获取模板 在当前项目
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		String templatePath = System.getProperty("catalina.home")+File.separator+"模板.xlsx";
		
		System.out.println(templatePath);
		FileInputStream fileInputStream = new FileInputStream(templatePath);
		htglmanager.exportHt(fileInputStream, outputStream);
		}
	
	

	@Override
	public Class<TbDxRshtx> getEntityClass() {

		return null;
	}

	@Override
	public BaseMybatisManager<TbDxRshtx, String> getBaseManager() {

		return htglmanager;
	}

	@Override
	public String getViewPath() {

		return null;
	}

}
