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
import com.wondersgroup.wszygl.manager.GxqGlybfytjManger;
import com.wondersgroup.wszygl.manager.GxqYbFytjManger;
import com.wondersgroup.wszygl.model.YbFytjModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Controller
@RequestMapping("/gxqGlybfytj")
public class GxqGlybfytjController extends BaseMybatisController<YbFytjModel, String> {
	@Autowired
	public GxqGlybfytjManger gxqglybfytjmanger;
	@Autowired
	public GxqYbFytjManger gxqybfytjmanger;
	@RequestMapping("/gxqGlybfytj")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_jgdm");
		System.out.println("医保机构代码=="+jgdm);
		String sjlx = null;
		try {
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj = gxqglybfytjmanger.getMinSwsj();
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj = gxqglybfytjmanger.getMaxSwsj();
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

		/* try { */

		List<YbFytjModel> getchart01List = gxqglybfytjmanger.getechar01(kssj, jssj, sjlx,jgdm);
		int yyzrs = 0;
		for (int i = 0; i < getchart01List.size(); i++) {
			yyzrs += Integer.parseInt(getchart01List.get(i).getRs());
		}

		List<YbFytjModel> getchartCf01 = gxqglybfytjmanger.getchartCf01(kssj, jssj, sjlx,jgdm);
		int jczrs = 0;
		for (int i = 0; i < getchartCf01.size(); i++) {
			jczrs += Integer.parseInt(getchartCf01.get(i).getRs());
		}

		List<YbFytjModel> getchart02 = gxqglybfytjmanger.getchart02(kssj, jssj, sjlx,jgdm);
		int yyzje = 0;
		for (int i = 0; i < getchart02.size(); i++) {
			yyzje += Double.valueOf(getchart02.get(i).getYlje());
		}

		List<YbFytjModel> getchartCf02 = gxqglybfytjmanger.chartCf02(kssj, jssj, sjlx,jgdm);
		int jczje = 0;
		for (int i = 0; i < getchartCf02.size(); i++) {
			jczje += Double.valueOf(getchartCf02.get(i).getYlje());
		}

		List<YbFytjModel> getchart03 = gxqglybfytjmanger.getchart03(kssj, jssj, sjlx,jgdm);
		List<YbFytjModel> getchartCf03 = gxqglybfytjmanger.getchartCf03(kssj, jssj, sjlx,jgdm);  
      
		List<YbFytjModel> getchart04 = gxqglybfytjmanger.getchart04(kssj, jssj, sjlx,jgdm);
		List<YbFytjModel> getchartCf04 = gxqglybfytjmanger.getchartCf04(kssj, jssj, sjlx,jgdm);
		
		List<YbFytjModel> getchart05 = gxqglybfytjmanger.getchart05(kssj, jssj, sjlx,jgdm);
		List<YbFytjModel> getchartCf05 = gxqglybfytjmanger.getchartCf05(kssj, jssj, sjlx,jgdm); 
		
		List<YbFytjModel> getchart06 = gxqglybfytjmanger.getchart06(kssj, jssj, sjlx,jgdm);
		List<YbFytjModel> getchartCf06 = gxqglybfytjmanger.getchartCf06(kssj, jssj, sjlx,jgdm);
		
		List<YljgModel> gxqglybjgList = gxqybfytjmanger.getYljgModel(jgdm);
		
		result.addObject("getchart01List", getchart01List);
		result.addObject("yyzrs", yyzrs);

		result.addObject("getchartCf01", getchartCf01);
		result.addObject("jczrs", jczrs);

		result.addObject("getchart02", getchart02);
		result.addObject("yyzje", yyzje);

		result.addObject("getchartCf02", getchartCf02);
		result.addObject("jczje", jczje);

		result.addObject("getchart03", getchart03);
		result.addObject("getchartCf03", getchartCf03);
		
		result.addObject("getchart04", getchart04);
		result.addObject("getchartCf04", getchartCf04);
		
		result.addObject("getchart05", getchart05);
		result.addObject("getchartCf05", getchartCf05);
		
		result.addObject("getchart06", getchart06);
		result.addObject("getchartCf06", getchartCf06);
		
		result.addObject("kssj", kssj);
		result.addObject("jssj", jssj);
		result.addObject("sjlx", sjlx);
		result.addObject("jgdm", jgdm);
		result.addObject("gxqglybjgList", gxqglybjgList);
	 
		/*
		 * } catch (Exception e) { logger.warn(e.getMessage()); result.addObject("code",
		 * 500); result.addObject("msg", e.getMessage()); }
		 */
		result.setViewName("wszygl/gxqGlybfytj");
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
