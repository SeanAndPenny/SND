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
import com.wondersgroup.wszygl.manager.GwsjtbManager;
import com.wondersgroup.wszygl.model.GwsjtbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Controller
@RequestMapping("/gwsjtb")
public class GwsjtbController extends BaseMybatisController<GwsjtbModel,String>{
	@Autowired
	public GwsjtbManager gwsjtbManager;
	@RequestMapping("/gwsjtb")
	
	public ModelAndView ckxx(HttpServletRequest request, HttpServletResponse response) {
		
			ModelAndView result = new ModelAndView();
			result.setViewName("wszygl/gwsjtb");
			try { 
				String enddate = request.getParameter("p_enddate");  
				String yljgdm = request.getParameter("p_yljgdm");   
				String pz= request.getParameter("p_pz");
				List<YljgModel> jgList = gwsjtbManager.getAllYljg(yljgdm);
				List<TbjdpzModel> pzList = gwsjtbManager.getAllpz();
				request.setAttribute("jgList", jgList);
				request.setAttribute("pzList", pzList);
				request.setAttribute("pz", pz);
				request.setAttribute("yljgdm", yljgdm);
				request.setAttribute("enddate", enddate);
				 
				PageRequest pageRequest = newPageRequest(request);
				PageResult<GwsjtbModel> page = gwsjtbManager.pageSelect(pageRequest);
				
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
	//插入人口数据
	@RequestMapping("/insertRk")
    public ModelAndView insertCzrk(HttpServletRequest request, HttpServletResponse response) {
	String yljgdm = request.getParameter("p_yljgdm");
	String pz = request.getParameter("p_pz");
	List<YljgModel> jgList = gwsjtbManager.getAllYljg(yljgdm);
	 TbjdpzModel  pz2 = gwsjtbManager.gePz(pz);
	 String pz3=pz2.getMc();
	request.setAttribute("pz3", pz3);
	
	request.setAttribute("jgList", jgList);
	ModelAndView result = new ModelAndView();
	result.setViewName("wszygl/insertRk");
	result.addObject("yljgdm", yljgdm);
	result.addObject("pz", pz);
	return result;
    }
	//保存插入
	 @RequestMapping("/saveHt")
	public ModelAndView saveHt(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
		String  yljgdm=request.getParameter("yljgdm");
		String  rksl=request.getParameter("rksl");
		String  enddate=request.getParameter("enddate");
		String  pz=request.getParameter("p_pz");
		String  xm=request.getParameter("p_xm");
		int count=gwsjtbManager.getCkrksl(yljgdm,enddate,pz);
		System.out.println("count="+count);
		if(count>0) {
			gwsjtbManager.updateRksl(yljgdm,rksl,enddate,pz,xm);
		}else {
			gwsjtbManager.saveHt(yljgdm,rksl,enddate,pz,xm);
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
	public Class<GwsjtbModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<GwsjtbModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
