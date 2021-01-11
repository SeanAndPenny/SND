package com.wondersgroup.wszygl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.model.FileUtils;
import com.wondersgroup.wszygl.model.YljgModel;
import com.wondersgroup.wszygl.manager.GwdazbManager;
import com.wondersgroup.wszygl.model.jmjkdagltjbbModel;
 

@Controller
@RequestMapping("/gwdazb")
public class GwdazbController extends BaseMybatisController<jmjkdagltjbbModel, String> {
	@Autowired
	public GwdazbManager gwdazbmanager;
	
	@RequestMapping("/gwdazb")
	public ModelAndView ckxx(HttpServletRequest request, HttpServletResponse response) {
		String enddate = request.getParameter("p_enddate");  
		String yljgdm = request.getParameter("p_yljgdm");
		
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jmjkdagltjbb");
		try {
			List<YljgModel> jgList = gwdazbmanager.getAllYljg(yljgdm);
			request.setAttribute("jgList", jgList);
			request.setAttribute("yljgdm", yljgdm);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<jmjkdagltjbbModel> page = gwdazbmanager.pageSelect(pageRequest);
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

	// 模板下载
		@RequestMapping("/toExcel")
		public void exportXls(HttpServletRequest request,HttpServletResponse response) throws Exception{
			String  enddate=request.getParameter("enddate"); 
			String  yljgdm=request.getParameter("yljgdm");
		 try {
			 response.setContentType("application/vnd.ms-excel"); // 常见的文件 可以省略

				// 文件的打开方式 inline在线打开 attachment
				String agent = request.getHeader("User-Agent");
				String filename = FileUtils.encodeDownloadFilename("城乡居民健康档案管理统计报表.xlsx", agent);
				response.setHeader("content-disposition", "attachment;fileName="+filename);
				ServletOutputStream outputStream = response.getOutputStream();

				// 获取模板 在当前项目
				ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
				String templatePath = System.getProperty("catalina.home")+File.separator+"城乡居民健康档案管理统计报表.xlsx";
				
				System.out.println(templatePath);
				FileInputStream fileInputStream = new FileInputStream(templatePath);
				gwdazbmanager.exportdb(fileInputStream, outputStream,enddate,yljgdm);
		} catch (Exception e) {
			System.out.println("导出信息失败！");
			e.printStackTrace();
		}
		// 一个流
		// 两个头
		// 下载文件的mime类型
		
		}
		
		
		
		
		//插入常驻居民数
		@RequestMapping("/insertCzrk")
	    public ModelAndView insertCzrk(HttpServletRequest request, HttpServletResponse response) {
		String yljgdm = request.getParameter("p_yljgdm");
		List<YljgModel> jgList = gwdazbmanager.getAllYljg(yljgdm);
		request.setAttribute("jgList", jgList);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/insertCzrk");
		result.addObject("yljgdm", yljgdm);
		return result;
	    }
		//保存插入页面的常驻居民数
		@RequestMapping("/saveHt")
		public ModelAndView saveHt(HttpServletRequest request,HttpServletResponse response) {
			debugAllRequestParams(request);
			ModelAndView result = new ModelAndView();
			try {
			String  yljgdm=request.getParameter("yljgdm");
			String  rksl=request.getParameter("rksl");
			String  enddate=request.getParameter("enddate");
			int count=gwdazbmanager.getCkrksl(yljgdm,enddate);
			System.out.println("count="+count);
			if(count>0) {
				gwdazbmanager.updateRksl(yljgdm,rksl,enddate);
			}else {
				 gwdazbmanager.saveHt(yljgdm,rksl,enddate);
			}
			
			 
				result.addObject("code", 0);
			}catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
			
			return result;
		}
		
	@Override
	public Class<jmjkdagltjbbModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<jmjkdagltjbbModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
