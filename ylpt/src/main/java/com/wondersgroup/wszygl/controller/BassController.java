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
import com.wondersgroup.wszygl.manager.BassManger;
import com.wondersgroup.wszygl.manager.MzjfxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.BaModel;
import com.wondersgroup.wszygl.model.BassModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
@Controller
@RequestMapping("/bass")
public class BassController extends BaseMybatisController<BassModel, String> {
	@Autowired
	public XxxManger xxxmanger;
	@Autowired
	public MzjfxManger mzjfxmanger;
	@Autowired
	public BassManger bassmanger;
	@RequestMapping("/bass")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		 
		try {
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj = bassmanger.getMinSwsj();
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj = bassmanger.getMaxSwsj();
			}
			 
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
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
			List<SwxxJgdmModel> bajgList = mzjfxmanger.getmjzjgList(jgdm);
			List<BassModel> bajgFxList = bassmanger.getBajgFx(kssj, jssj, jgdm);//病案手术机构分析
			
			result.addObject("bajgList", bajgList);
			result.addObject("bajgFxList", bajgFxList);

			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/bass");
		return result;
	}
	
	@RequestMapping("/getechrs02")
	public ModelAndView getechars04(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
		String jgdm = request.getParameter("p_yljgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
		List<BassModel>getechrs02List=bassmanger.getechars02(kssj,jssj,jgdm);
		result.addObject("getechrs02List", getechrs02List);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	
	
	@RequestMapping("/getechrs03")
	public ModelAndView getechars03(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
		String jgdm = request.getParameter("p_yljgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
        List<BassModel>getechrs03List= bassmanger.getechrs03List(kssj, jssj, jgdm);//病案手术折线图
		 
		result.addObject("getechrs03List", getechrs03List);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	
	@RequestMapping("/bassKsxz")
	public ModelAndView bafxKsxz(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		String jgdm = request.getParameter("p_jgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj"); 
		List<BassModel>getbassKsxz=bassmanger.getbassKsxz(jgdm,kssj,jssj);
		result.addObject("getbassKsxz", getbassKsxz);
		result.setViewName("wszygl/bassKs");
		result.addObject("kssj", kssj);
		result.addObject("jssj", jssj);
		result.addObject("jgdm", jgdm);
		return result;
	}
	@RequestMapping("/jtysJgXzysXx")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		 
		String yljgdm = request.getParameter("p_yljgdm"); 
		String ksbm = request.getParameter("p_ksbm");
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		ModelAndView result = new ModelAndView();
		System.out.println("yljgdm==="+yljgdm);
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<BassModel> page = bassmanger.pageSelect(pageRequest);
			result.addObject("yljgdm", yljgdm);
			result.addObject("ksbm", ksbm);
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
	public Class<BassModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<BassModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
