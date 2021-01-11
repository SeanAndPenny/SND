package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.MzjfxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.manager.YzbfxManger;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.YzbfxModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
@Controller
@RequestMapping("/yzbfx")
public class YzbfxController extends BaseMybatisController<YzbfxModel, String> {
	@Autowired
	public XxxManger xxxmanger;
	@Autowired
	public MzjfxManger mzjfxmanger;
	@Autowired
	public YzbfxManger yzbfxmanger;
	@RequestMapping("/yzbfx")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		String sjlx = null;
		try {
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj = yzbfxmanger.getMinSwsj();
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj = yzbfxmanger.getMaxSwsj();
			}
		    if (kssj.length() == 7) {
				sjlx = "month";
			} else if (kssj.length() == 4) {
				sjlx = "year";
			}
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		try {/// 权限测试
			String userName = null;
			HttpSession session = request.getSession();
			userName =(String) session.getAttribute("loginname1");
			if (userName == "" || userName == null) {
				userName = (String) request.getSession().getAttribute("ssoUsername");
			}
			System.out.println("jgdm==" + jgdm);
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
			List<SwxxJgdmModel> yzbJgList = mzjfxmanger.getmjzjgList(jgdm);
			//门诊药占比
			List<YzbfxModel> mzYzbList = yzbfxmanger.getyzbtj(kssj, jssj, jgdm, sjlx);
			//住院药占比
			List<YzbfxModel> zyYzbList = yzbfxmanger.getzyyzbtj(kssj, jssj, jgdm, sjlx);
			//综合药品费用结构统计
			List<YzbfxModel> yzbJgfxList = yzbfxmanger.getyzbJgfx(kssj, jssj, jgdm, sjlx);
			//基础药品费用结构统计
			List<YzbfxModel> yzbJcfxList = yzbfxmanger.getyzbJcfx(kssj, jssj, jgdm, sjlx);
			result.addObject("yzbJgfxList", yzbJgfxList);
			result.addObject("yzbJcfxList", yzbJcfxList);
			result.addObject("mzYzbList", mzYzbList);
			result.addObject("zyYzbList", zyYzbList);
			result.addObject("yzbJgList", yzbJgList);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/yzbfx");
		return result;
	}
	@RequestMapping("/getechar05")
	public ModelAndView getechars03(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj"); 
		String jgdm = request.getParameter("p_yljgdm");
		String sjlx = null;
		try { 
		    if (kssj.length() == 7) {
				sjlx = "month";
			} else if (kssj.length() == 4) {
				sjlx = "year";
			}
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		List<YzbfxModel> getechar05List = yzbfxmanger.getechar05(kssj, jssj,jgdm,sjlx);
		result.addObject("getechar05List", getechar05List);
	} catch (Exception e) {
		logger.warn(e.getMessage());
		result.addObject("code", 500);
		result.addObject("msg", e.getMessage());
	}
		return result;

	}
	@Override
	public Class<YzbfxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YzbfxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
