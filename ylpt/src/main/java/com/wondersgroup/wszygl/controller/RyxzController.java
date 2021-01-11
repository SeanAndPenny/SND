package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.RyxzManger;
import com.wondersgroup.wszygl.manager.RyxzksManger;
import com.wondersgroup.wszygl.model.RyzxtModel;

@Controller
@RequestMapping("/ryxz")
public class RyxzController  extends BaseMybatisController<RyzxtModel,String>{
	@Autowired
    public  RyxzManger ryxzManger;
	@Autowired
    public  RyxzksManger ryxzksManger;
	
	
	// 人员下钻到机构
		@RequestMapping("/ryxzjg")
		public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
			
			String jb = request.getParameter("p_jb");
			String zc = request.getParameter("p_zc");
			ModelAndView result = new ModelAndView();
			result.setViewName("wszygl/rycx");
			try {
				result.addObject("jb", jb);
				result.addObject("zc", zc);
				PageRequest pageRequest = newPageRequest(request);
				PageResult<RyzxtModel> page = ryxzManger.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			}catch(Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
			return result;

		}
	
		@RequestMapping("/ryxzjgecharts")
		public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
			ModelAndView result = new ModelAndView();
			try {
				String jb = request.getParameter("p_jb");
				String zc = request.getParameter("p_zc");
				List<RyzxtModel>ryxzJgList = ryxzManger.getRyjg(jb,zc );
				result.addObject("ryxzJgList", ryxzJgList);
			}catch(Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
			return result;
			
		}
		
	//------------------------------------------------------------	
		
		
		
		
		
		// 人员下钻科室
				@RequestMapping("/ryxzks")
				public ModelAndView rycxksList(HttpServletRequest request, HttpServletResponse response) {
					 
					String jb = request.getParameter("p_jb");
					String zc = request.getParameter("p_zc");
					String jgdm = request.getParameter("p_jgdm");
					ModelAndView result = new ModelAndView();
					result.setViewName("wszygl/ryxzks");
					try {
						result.addObject("jb", jb);
						result.addObject("zc", zc);
						result.addObject("jgdm", jgdm);
						PageRequest pageRequest = newPageRequest(request);
						PageResult<RyzxtModel> page = ryxzksManger.pageSelect(pageRequest);
						result.addObject("code", 0);
						result.addObject("msg", "success");
						result.addObject("count", page.getTotalCount());
						result.addObject("data", page.getResult());
					}catch(Exception e) {
						logger.warn(e.getMessage());
						result.addObject("code", 500);
						result.addObject("msg", e.getMessage());
					}
					return result;

				}
			
				@RequestMapping("/ryxzjksecharts")
				public ModelAndView ryxzjksecharts(HttpServletRequest request,HttpServletResponse response) {
					ModelAndView result = new ModelAndView();
					try {
						String jb = request.getParameter("p_jb");
						String zc = request.getParameter("p_zc");
						String jgdm = request.getParameter("p_jgdm");
						List<RyzxtModel>ryxzKsList = ryxzksManger.getRyjg(jb,zc,jgdm );
						 
						result.addObject("ryxzKsList", ryxzKsList);
					}catch(Exception e) {
						logger.warn(e.getMessage());
						result.addObject("code", 500);
						result.addObject("msg", e.getMessage());
					}
					return result;
					
				}
				//下钻到人员信息
				@RequestMapping("/ryxzry")
				public ModelAndView ryxzryList(HttpServletRequest request, HttpServletResponse response) {
					 
					String jb = request.getParameter("p_jb");
					String zc = request.getParameter("p_zc");
					String jgdm = request.getParameter("p_jgdm");
					String ksdm = request.getParameter("p_ksdm");
					debugAllRequestParams(request);
					ModelAndView result = new ModelAndView();
					result.setViewName("wszygl/ryxzry");
					try {
						result.addObject("jb", jb);
						result.addObject("zc", zc);
						result.addObject("jgdm", jgdm);
						result.addObject("ksdm", ksdm);
						PageRequest pageRequest = newPageRequest(request);
						PageResult<RyzxtModel> page = ryxzManger.pageSelect(pageRequest);
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
		
		
		
	
	@Override
	public Class<RyzxtModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<RyzxtModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
