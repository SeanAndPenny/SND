package com.wondersgroup.ggwsgl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisLayuiController;
import com.wondersgroup.ggwsgl.manager.LnrGwTxManager;
import com.wondersgroup.ggwsgl.manager.WjdtxxManager;
import com.wondersgroup.ggwsgl.model.CkztModel;
import com.wondersgroup.ggwsgl.model.LnrGwTxModel;
import com.wondersgroup.ggwsgl.model.TjxxModel;
import com.wondersgroup.ggwsgl.model.WJDTX;
import com.wondersgroup.ggwsgl.model.WjdtxxModel;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.smsCenter.client.SendSmsReq;
import com.wondersgroup.smsCenter.client.SendSmsResp;
import com.wondersgroup.smsCenter.client.SmsCenter;
import com.wondersgroup.smsCenter.client.SmsCenterService;
import com.wondersgroup.smsCenter.client.SendSmsReq.Sms;

@Controller
@RequestMapping("/wjdtj")
public class WjdtxController extends BaseMybatisController<WjdtxxModel, String> {

	@Autowired
	public WjdtxxManager wjdtxxManager;
	@Autowired
	public LnrGwTxManager lnrGwTxManager;
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);

	@RequestMapping("/wjdtjxx")
	public ModelAndView wjdtjxxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("ggwsgl/wjdtjxxList");
		List<YljgModel> jgList = wjdtxxManager.getAllYljg();
		request.setAttribute("jgList", jgList);
		List<CkztModel> ckList = wjdtxxManager.getAllCkzt();
		request.setAttribute("ckList", ckList);
		String cklx = request.getParameter("p_cklx");
		
		if ("1".equals(cklx)) {
			try {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<WjdtxxModel> page = wjdtxxManager.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		} else if ("2".equals(cklx)) {
			//老年人高危提醒
			try {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<LnrGwTxModel> page = lnrGwTxManager.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		} else {
			try {
				PageRequest pageRequest = newPageRequest(request);
				PageResult<WjdtxxModel> page = wjdtxxManager.pageSelect(pageRequest);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", page.getTotalCount());
				result.addObject("data", page.getResult());
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		}

		return result;
	}

	@RequestMapping("/wjdtj_dx")
	public ModelAndView wjdTx(HttpServletRequest request, HttpServletResponse response) {
		String yljgdm = request.getParameter("yljgdm");
		String zjhm = request.getParameter("zjhm");
		String xm = request.getParameter("xm");
		ModelAndView result = new ModelAndView();
		WjdtxxModel wjdtx =null;
		String cklx = request.getParameter("cklx");
		if("1".equals(cklx)) {
			wjdtxxManager.updatetxzt(zjhm);
			 wjdtx = wjdtxxManager.getWjktx(yljgdm, zjhm, xm);
		}else if("2".equals(cklx)) {
			wjdtxxManager.updaLnrGwTx(zjhm);
			 wjdtx = wjdtxxManager.getLnrGwTx(yljgdm, zjhm, xm);
		}else { 
			wjdtxxManager.updatetxzt(zjhm);
				 wjdtx = wjdtxxManager.getWjktx(yljgdm, zjhm, xm);
			 
		}
		
		
		
		result.setViewName("ggwsgl/wjdtj_dx");
		
		if (wjdtx.getNr() != null) {
			result.addObject("successMsg", "提醒成功！");
			/**
			 * 发送短信
			 */
			SmsCenterService smsCenterService = new SmsCenterService();
			SmsCenter smsCenter = smsCenterService.getSmsCenterServiceHttpSoapEndpoint();
			SendSmsReq req = new SendSmsReq();
			req.setUsername("Test");
			req.setPassword("Test");
			req.setSigncode("WONDERS");
			Sms sms = new Sms();
			sms.setSmsMessage(wjdtx.getNr());// 获取短信内容
			sms.getPhoneNnumber().add(wjdtx.getSjhm());// 获取并添加电话号码
			req.getSms().add(sms);
			System.out.println("短信内容==" + sms.getSmsMessage());
			SendSmsResp resp = smsCenter.sendSms(req);// 发送短信
			req.getSms().remove(0);
			for (int i = 0; i < sms.getPhoneNnumber().size(); i++) {
				sms.getPhoneNnumber().remove(i);
			}
			return result;

		} else {
			result.addObject("errorMsg", "提醒失败,请及时联系管理员！");
			return result;
		}

	}

	@Override
	public Class<WjdtxxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<WjdtxxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
