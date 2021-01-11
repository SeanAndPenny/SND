package com.wondersgroup.wszygl.controller;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.IAEDManger;
import com.wondersgroup.wszygl.manager.MzjfxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.IAEDModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.YpcrkModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/*资金视图层*/
@Controller
@RequestMapping("/iaed")
public class IAEDController extends BaseMybatisController<IAEDModel, String> {
	@Autowired
	public XxxManger xxxmanger;
	@Autowired
	public MzjfxManger mzjfxmanger;
	@Autowired
	public IAEDManger iaedmanger;
	@RequestMapping("/iaed")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		String objectCode = request.getParameter("objectCode");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		Calendar cale = Calendar.getInstance();
		cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, 0);
		cale.set(Calendar.DAY_OF_MONTH, 1);
		try {
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj = iaedmanger.getMinSwsj();
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj = iaedmanger.getMaxSwsj();
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
//获取所需数据
		try {
			if (kssj == null || ("undefined").equals(kssj)) {
				kssj=formatter.format(cale.getTime());
			}
			if (jssj == null || ("undefined").equals(jssj)) {
				jssj=formatter.format(date);
			}
			List<IAEDModel> chart01List = iaedmanger.getChart01(kssj, jssj, jgdm,objectCode);//获取各机构收入支出数据
			result.addObject("chart01List", chart01List);
            result.addObject("kssj", kssj);
			result.addObject("jssj", jssj);
			result.addObject("jgdm", jgdm);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/iaed");
		return result;
	}
	
	@RequestMapping("/getCicleChart01")
	public ModelAndView getCicleChart01(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
		String jgdm = request.getParameter("p_yljgdm"); 
		String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj");
        String objectCode = request.getParameter("objectCode");
        String objectLen = request.getParameter( "objectLen" );
		List<IAEDModel>cicleChart01List=iaedmanger.getCicleChart01(kssj,jssj,jgdm,objectLen,objectCode);
		result.addObject("cicleChart01List", cicleChart01List);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

    @RequestMapping("/getAreaChart01")
    public ModelAndView getAreaChart01(HttpServletRequest request,HttpServletResponse response) {
        ModelAndView result = new ModelAndView();
        try {
            String jgdm = request.getParameter("p_yljgdm");
            String kssj = request.getParameter("p_kssj");
            String jssj = request.getParameter("p_jssj");
            String objectCode = request.getParameter("objectCode");
            String objectLen = request.getParameter( "objectLen" );
            List<IAEDModel>areaChart01List=iaedmanger.getAreaChart01(kssj,jssj,jgdm,objectCode,objectLen);
            result.addObject("areaChart01List", areaChart01List);
        } catch (Exception e) {
            logger.warn(e.getMessage());
            result.addObject("code", 500);
            result.addObject("msg", e.getMessage());
        }
        return result;
    }

    //获取项目明细数据
    @RequestMapping("/getDetail")
    public ModelAndView getDetail(HttpServletRequest request,HttpServletResponse response) {
        ModelAndView result = new ModelAndView();
        try{
        String jgdm = request.getParameter("p_jgdm");
        String kssj = request.getParameter("p_kssj");
        String jssj=request.getParameter("p_jssj");
        String objectCode = request.getParameter("objectCode");
        String objectLen = request.getParameter( "objectLen" );
        List<IAEDModel>iaedDetailList=iaedmanger.getCicleChart01(kssj,jssj,jgdm,objectLen,objectCode);
        System.out.println( "iaedDetailList = " + iaedDetailList );
        result.setViewName("wszygl/iaedDetail");
        //定义layUI参数
        result.addObject("code", 0);
        result.addObject("msg", "success");
        result.addObject("detail", iaedDetailList);
        result.addObject("kssj", kssj);
        result.addObject("jssj", jssj);
        result.addObject("jgdm", jgdm);
        }catch(Exception e) {
        logger.warn(e.getMessage());
        result.addObject("code", 500);
        result.addObject("msg", e.getMessage());
    }
        return result;
    }

	@Override
	public Class<IAEDModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<IAEDModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
