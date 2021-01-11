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
import com.wondersgroup.wszygl.manager.GwgxyglbbManager;
import com.wondersgroup.wszygl.model.FileUtils;
import com.wondersgroup.wszygl.model.GwgxyglbbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Controller
@RequestMapping("/gwgxyglbb")
public class GwgxyglbbController extends BaseMybatisController<GwgxyglbbModel,String>{
	@Autowired
	public GwgxyglbbManager gwgxyglbbManager;
	@RequestMapping("/gwgxyglbb")
	
	public ModelAndView ckxx(HttpServletRequest request, HttpServletResponse response) {
		String enddate = request.getParameter("p_enddate");  
		String yljgdm = request.getParameter("p_yljgdm");
		String jdpz= request.getParameter("p_jdpz");
		String enddate2 = request.getParameter("p_enddate2");  
		System.out.println("enddate2=="+enddate2);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/gwgxyglbb");
		try {
			List<TbjdpzModel> jdpzList=gwgxyglbbManager.getAllJd();
			List<YljgModel> jgList = gwgxyglbbManager.getAllYljg(yljgdm);
			request.setAttribute("jdpzList", jdpzList);
			request.setAttribute("jgList", jgList);
			request.setAttribute("yljgdm", yljgdm);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<GwgxyglbbModel> page = gwgxyglbbManager.pageSelect(pageRequest);
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
				  
				String yljgdm = request.getParameter("yljgdm");
				 
				String enddate2 = request.getParameter("enddate2"); 
			// 一个流
			// 两个头
			// 下载文件的mime类型
			response.setContentType("application/vnd.ms-excel"); // 常见的文件 可以省略

			// 文件的打开方式 inline在线打开 attachment
			String agent = request.getHeader("User-Agent");
			String filename = FileUtils.encodeDownloadFilename("高血压患者健康管理报表.xlsx", agent);
			response.setHeader("content-disposition", "attachment;fileName="+filename);
			ServletOutputStream outputStream = response.getOutputStream();

			// 获取模板 在当前项目
			ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			String templatePath = System.getProperty("catalina.home")+File.separator+"高血压患者健康管理报表.xlsx";
			
			System.out.println(templatePath);
			FileInputStream fileInputStream = new FileInputStream(templatePath);
			gwgxyglbbManager.exportdb(fileInputStream, outputStream,enddate2,yljgdm);
			}
	
	

			//插入高血压数
			@RequestMapping("/insertGxysl")
		    public ModelAndView insertCzrk(HttpServletRequest request, HttpServletResponse response) {
			String yljgdm = request.getParameter("p_yljgdm");
			List<YljgModel> jgList = gwgxyglbbManager.getAllYljg(yljgdm);
			request.setAttribute("jgList", jgList);
			ModelAndView result = new ModelAndView();
			result.setViewName("wszygl/insertGxysl");
			result.addObject("yljgdm", yljgdm);
			return result;
		    }
			//保存插入高血压数
			 @RequestMapping("/saveHt")
			public ModelAndView saveHt(HttpServletRequest request,HttpServletResponse response) {
				debugAllRequestParams(request);
				ModelAndView result = new ModelAndView();
				try {
				String  yljgdm=request.getParameter("yljgdm");
				String  rksl=request.getParameter("rksl");
				String  enddate=request.getParameter("enddate");
				int count=gwgxyglbbManager.getCkrksl(yljgdm,enddate);
				System.out.println("count="+count);
				if(count>0) {
					gwgxyglbbManager.updateRksl(yljgdm,rksl,enddate);
				}else {
					gwgxyglbbManager.saveHt(yljgdm,rksl,enddate);
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
	public Class<GwgxyglbbModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<GwgxyglbbModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
