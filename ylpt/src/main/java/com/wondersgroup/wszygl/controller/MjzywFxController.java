package com.wondersgroup.wszygl.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.MzjfxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.MjzywFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

@Controller
@RequestMapping("/mzjfx")
public class MjzywFxController extends BaseMybatisController<MjzywFxModel, String> {
	@Autowired 
	public  MzjfxManger mzjfxmanger;
	@Autowired 
	public XxxManger xxxmanger;
	@RequestMapping("/mzjfx")
	public ModelAndView mzjfxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		try {/// 权限测试
			String userName = null;
			userName = request.getParameter("p_Username");
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			 HttpSession session = httpRequest.getSession();
			if (userName == "" || userName == null) {
				userName = (String) session.getAttribute("loginname1");
			}
		 System.out.println("userName==="+userName);
			if (("").equals(jgdm) || jgdm == null) {
				List<ZhjgUserModel> qx = xxxmanger.getQx(userName);
				for (int i = 0; i < qx.size(); i++) {
					if (("111").equals(qx.get(i).getOrgId()) || ("101000").equals(qx.get(i).getOrgId())) {
						jgdm = "";
					} else {
						jgdm = qx.get(i).getOrgCode();
					}
					result.addObject("orgid", qx.get(i).getOrgId());
				}

			}
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		} 
		try {
			if(kssj==null||("undefined").equals(kssj)) {
				kssj=mzjfxmanger.getMinSwsj();
			}
			if(jssj==null||("undefined").equals(jssj)) {
				jssj=mzjfxmanger.getMaxSwsj();
			}
			List<MjzywFxModel> mzjfxList = mzjfxmanger.getMzjfx(kssj, jssj, jgdm);// 综合医院门急诊人数
			List<MjzywFxModel> mzjJcfxList = mzjfxmanger.getMzjjcfx(kssj, jssj, jgdm);// 基层医院门急诊人数
			List<MjzywFxModel> mzJbflList = mzjfxmanger.getMzJbfl(kssj, jssj, jgdm);// 门诊疾病分类
			
			 List<SwxxJgdmModel>mjzjgList=mzjfxmanger.getmjzjgList(jgdm);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
			result.addObject("mzjfxList", mzjfxList);
			result.addObject("mzjJcfxList", mzjJcfxList);
			result.addObject("mzJbflList", mzJbflList);
			result.addObject("mjzjgList", mjzjgList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/mzjfx");
		return result;

	}

	@RequestMapping("/getchart03")
	public ModelAndView getMjzywecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String jgdm=request.getParameter("p_yljgdm");
		String kssj=request.getParameter("p_kssj");
		String jssj=request.getParameter("p_jssj");
		List<MjzywFxModel>getMjzywechartsList=mzjfxmanger.getMjzywecharts(jgdm,kssj,jssj);	
		result.addObject("getMjzywechartsList", getMjzywechartsList);
		result.setViewName("wszygl/mzjfxgetchart03");
		return result;
		
	}
	
	@RequestMapping("/gettables")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String jbflbm = request.getParameter("p_jbflbm");
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm"); 
		 
		ModelAndView result = new ModelAndView();
		try {
			 
			PageRequest pageRequest = newPageRequest(request);
			PageResult<MjzywFxModel> page = mzjfxmanger.pageSelect(pageRequest);
			result.addObject("jbflbm", jbflbm);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
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
	@RequestMapping("/getechars03")
	public ModelAndView getechars03(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		String jgdm = request.getParameter("p_jgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
		List<MjzywFxModel>getechars03List=mzjfxmanger.getechars03(jgdm,kssj,jssj);
		result.addObject("getechars03List", getechars03List);
		 
		
		return result;
		
	}
	
	@RequestMapping("/getechars04")
	public ModelAndView getechars04(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String jbflbm = request.getParameter("p_jbflbm");
		String jgdm = request.getParameter("p_jgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
		List<MjzywFxModel>getechars04List=mzjfxmanger.getechars04(jbflbm,jgdm,kssj,jssj);
		result.addObject("getechars04List", getechars04List);
		 
		
		return result;
		
	}
	@Override
	public Class<MjzywFxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<MjzywFxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
