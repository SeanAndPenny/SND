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
import com.wondersgroup.wszygl.manager.BaManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.BaModel;
import com.wondersgroup.wszygl.model.JtysModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

@Controller
@RequestMapping("/bafx")
public class BaController extends BaseMybatisController<BaModel, String> {
	@Autowired
	public XxxManger xxxmanger;
	@Autowired
	public BaManger bamanger;
	@RequestMapping("/bafx")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		 
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
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj = bamanger.getMinSwsj();
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj = bamanger.getMaxSwsj();
			}
			List<SwxxJgdmModel> bajgList = bamanger.getbajgList(jgdm);
			List<BaModel> bazhList = bamanger.getbazh(kssj, jssj, jgdm);// 综合医院病案
			List<BaModel> bajcList = bamanger.getbajc(kssj, jssj, jgdm);// 基层医院病案
			List<BaModel> baJbdlList = bamanger.getbaJbdl(kssj, jssj, jgdm);// 病案疾病分类大类
			result.addObject("bazhList", bazhList);
			result.addObject("bajcList", bajcList);
			result.addObject("bajgList", bajgList);
			result.addObject("baJbdlList", baJbdlList);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/bafx");
		return result;
	}
	@RequestMapping("/getechars03")
	public ModelAndView getechars03(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();

		String jgdm = request.getParameter("p_jgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
		 
		List<BaModel>getechars03List=bamanger.getbaJbdl(kssj, jssj, jgdm);
		result.addObject("getechars03List", getechars03List);
		 
		
		return result;
		
	}
	@RequestMapping("/bafxKsxz")
	public ModelAndView bafxKsxz(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		String jgdm = request.getParameter("p_jgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
		 
		List<BaModel>getbafxKsxz=bamanger.getbafxKsxz(jgdm,kssj,jssj);
		result.addObject("getbafxKsxz", getbafxKsxz);
		result.setViewName("wszygl/bafxKs");
		result.addObject("kssj", kssj);
		result.addObject("jssj", jssj);
		result.addObject("jgdm", jgdm);
		return result;
	}
	
	@RequestMapping("/getechars04")
	public ModelAndView getechars04(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
	 
		String jbflbm = request.getParameter("p_jbflbm");
		String jgdm = request.getParameter("p_jgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
		 
		List<BaModel>getechars04List=bamanger.getechars04(jbflbm,jgdm,kssj,jssj);
		result.addObject("getechars04List", getechars04List);
		 
		
		return result;
		
	}
	
	@RequestMapping("/jtysJgXzysXx")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		 
		String yljgdm = request.getParameter("p_yljgdm"); 
		String ryksbm = request.getParameter("p_ryksbm");
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		ModelAndView result = new ModelAndView();
		System.out.println("yljgdm=="+yljgdm);
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<BaModel> page = bamanger.pageSelect(pageRequest);
			result.addObject("yljgdm", yljgdm);
			result.addObject("ryksbm", ryksbm);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
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
	
	@Override
	public Class<BaModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<BaModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
