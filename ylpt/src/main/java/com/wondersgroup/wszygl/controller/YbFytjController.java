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
import com.wondersgroup.wszygl.manager.MzjfxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.manager.YbfytjManger;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.YbFytjModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

@Controller
@RequestMapping("/ybfytj")
public class YbFytjController extends BaseMybatisController<YbFytjModel, String> {
	@Autowired
	public XxxManger xxxmanger;
	@Autowired
	public MzjfxManger mzjfxmanger;
	@Autowired
	public YbfytjManger ybfytjmanger;

	@RequestMapping("/ybfytj")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		String sjlx = null;
		try {
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj = ybfytjmanger.getMinSwsj();
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj = ybfytjmanger.getMaxSwsj();
			}
			if (kssj.length() == 10) {
				sjlx = "day";
			} else if (kssj.length() == 7) {
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
			userName = request.getParameter("p_Username");
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
			List<SwxxJgdmModel> ybjgList = mzjfxmanger.getmjzjgList(jgdm);
			List<YbFytjModel> ybfytjList = ybfytjmanger.getybfytj(kssj, jssj, jgdm, sjlx);// 区内区外
			result.addObject("ybfytjList", ybfytjList);
			result.addObject("ybjgList", ybjgList);

			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/ybfytj");
		return result;
	}

	@RequestMapping("/getechars02")
	public ModelAndView getechars02(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String sjlx = null;
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String qylx = request.getParameter("p_qylx");
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
		List<YbFytjModel> getechars02List = ybfytjmanger.getechars02(kssj, jssj, jgdm, sjlx, qylx);
		result.addObject("qylx", qylx);
		result.addObject("getechars02List", getechars02List);
		return result;

	}

	@RequestMapping("/getechars03")
	public ModelAndView getechars03(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String sjlx = null;
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String jglx = request.getParameter("p_jglx");
		String qylx = request.getParameter("p_qylx");
		String jgjb = request.getParameter("p_yljgjbdm");
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
		List<YbFytjModel> getechars03List = ybfytjmanger.getechars03(kssj, jssj, jgdm, sjlx, qylx, jglx,jgjb);
		List<YbFytjModel> getecharsList = ybfytjmanger.getecharsList(kssj, jssj, jgdm, sjlx, qylx, jglx,jgjb);
		result.addObject("qylx", qylx);
		result.addObject("jglx", jglx);
		result.addObject("jgjb", jgjb); 
		result.addObject("getechars03List", getechars03List);
		result.addObject("getecharsList", getecharsList);
		return result;

	}
	
	@RequestMapping("/getecharsjbfx")
	public ModelAndView getecharsjbfx(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String sjlx = null;
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		String jglx = request.getParameter("p_jglx");
		String qylx = request.getParameter("p_qylx");
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
		List<YbFytjModel> getecharsjbfxList = ybfytjmanger.getecharsjb(kssj, jssj, jgdm, sjlx, qylx, jglx);
		result.addObject("qylx", qylx);
		result.addObject("jglx", jglx);
		result.addObject("getecharsjbfxList", getecharsjbfxList);
		return result;

	}
	
	
	@RequestMapping("/gettables")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String yljgdm = request.getParameter("p_yljgdm");
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jglx = request.getParameter("p_jglx");
		String qylx = request.getParameter("p_qylx");
		 
		ModelAndView result = new ModelAndView();
		try {
			 
			PageRequest pageRequest = newPageRequest(request);
			PageResult<YbFytjModel> page = ybfytjmanger.pageSelect(pageRequest);
			result.addObject("yljgdm", yljgdm);
			result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jglx", jglx);
			result.addObject("qylx", qylx);
			 
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
