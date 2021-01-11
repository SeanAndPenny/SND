package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.GxqYbFytjManger;
import com.wondersgroup.wszygl.model.YbFytjModel;
import com.wondersgroup.wszygl.model.YljgModel;
 
@Controller
@RequestMapping("/gxqybfytj")
public class GxqYbFytjController extends BaseMybatisController<YbFytjModel, String> {
 
	 
	@Autowired
	public GxqYbFytjManger gxqybfytjmanger;

	@RequestMapping("/gxqybfytj")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		String sjlx = null;
		try { 
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj = gxqybfytjmanger.getMinSwsj();
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj = gxqybfytjmanger.getMaxSwsj();
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
		try {
		 
			List<YbFytjModel> getechar01List = gxqybfytjmanger.getechar01(kssj, jssj, jgdm, sjlx);
			List<YbFytjModel> getechar02List = gxqybfytjmanger.getechar02(kssj, jssj, jgdm, sjlx);
			List<YljgModel> gxqybjgList = gxqybfytjmanger.getYljgModel(jgdm);
			
			result.addObject("getechar01List", getechar01List);
			result.addObject("getechar02List", getechar02List);
			result.addObject("gxqybjgList", gxqybjgList); 

			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/gxqybfytj");
		return result;
	}

	@RequestMapping("/getechars03")
	public ModelAndView getechars03(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String qylx = request.getParameter("p_qylx");
		String sjlx = null;
		try {
			if (kssj.length() == 7) {
				sjlx = "month";
			} else if (kssj.length() == 4) {
				sjlx = "year";
			}
			List<YbFytjModel> getechar03List = gxqybfytjmanger.getechar03(kssj, jssj, jgdm, sjlx, qylx);
			result.addObject("getechar03List", getechar03List);
			result.addObject("qylx", qylx);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}
	@RequestMapping("/getechars04")
	public ModelAndView getechars04(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String qylx= request.getParameter("p_qylx");
		String sjlx = null;	
		try {
			if (kssj.length() == 7) {
				sjlx = "month";
			} else if (kssj.length() == 4) {
				sjlx = "year";
			}
			List<YbFytjModel> getechar04List = gxqybfytjmanger.getechar04(kssj, jssj, jgdm, sjlx,qylx);
			
			result.addObject("getechar04List", getechar04List);
			result.addObject("qylx", qylx);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;
	}
	
	@RequestMapping("/getechars05")
	public ModelAndView getechars05(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String qylx= request.getParameter("p_qylx");
		String jglx= request.getParameter("p_jglx");
		String sjlx = null;	
		try {
			if (kssj.length() == 7) {
				sjlx = "month";
			} else if (kssj.length() == 4) {
				sjlx = "year";
			}
			List<YbFytjModel> getechar05List = gxqybfytjmanger.getechar05(kssj, jssj, jgdm, sjlx,qylx,jglx);
			
			result.addObject("getechar05List", getechar05List);
			result.addObject("qylx", qylx);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;
	}
	
	
	@RequestMapping("/getechars06")
	public ModelAndView getechars06(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String qylx= request.getParameter("p_qylx");
		String jglx= request.getParameter("p_jglx");
		String sjlx = null;	
		try {
			if (kssj.length() == 7) {
				sjlx = "month";
			} else if (kssj.length() == 4) {
				sjlx = "year";
			}
			List<YbFytjModel> getechar06List = gxqybfytjmanger.getechar06(kssj, jssj, jgdm, sjlx,qylx,jglx);
			
			result.addObject("getechar06List", getechar06List);
			result.addObject("qylx", qylx);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;
	}
	
	@RequestMapping("/getecharsAll")
	public ModelAndView getecharsAll(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String qylx= request.getParameter("p_qylx");
		String jglx= request.getParameter("p_jglx");
		String jbdm=request.getParameter("p_jbdm");
		String sjlx = null;	
		try {
			if (kssj.length() == 7) {
				sjlx = "month";
			} else if (kssj.length() == 4) {
				sjlx = "year";
			}
			List<YbFytjModel> getechar07List = gxqybfytjmanger.getechar07(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			List<YbFytjModel> getechar08List = gxqybfytjmanger.getechar08(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			List<YbFytjModel> getechar09List = gxqybfytjmanger.getechar09(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			List<YbFytjModel> getechar10List = gxqybfytjmanger.getechar10(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			List<YbFytjModel> getechar11List = gxqybfytjmanger.getechar11(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			List<YbFytjModel> getechar12List = gxqybfytjmanger.getechar12(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			List<YbFytjModel> getechar13List = gxqybfytjmanger.getechar13(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			List<YbFytjModel> getechar14List = gxqybfytjmanger.getechar14(kssj, jssj, jgdm, sjlx,qylx,jglx,jbdm);
			result.addObject("getechar07List", getechar07List);
			result.addObject("getechar08List", getechar08List);
			result.addObject("getechar09List", getechar09List);
			result.addObject("getechar10List", getechar10List);
			result.addObject("getechar11List", getechar11List);
			result.addObject("getechar12List", getechar12List);
			result.addObject("getechar13List", getechar13List);
			result.addObject("getechar14List", getechar14List);
			result.addObject("qylx", qylx);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
			result.addObject("jbdm",jbdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;
	}
	
	@Override
	public Class<YbFytjModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YbFytjModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}
