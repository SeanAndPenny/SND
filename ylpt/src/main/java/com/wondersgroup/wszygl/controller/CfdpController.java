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
import com.wondersgroup.ylfwgl.model.YljgModel;
import com.wondersgroup.wszygl.manager.CfdpManager;
import com.wondersgroup.wszygl.model.CfModel;
import com.wondersgroup.wszygl.model.Cfdp;
import com.wondersgroup.wszygl.model.CfdpModel;
import com.wondersgroup.wszygl.model.CfdpTjfxModel;
import com.wondersgroup.wszygl.model.HzxxModel;
import com.wondersgroup.wszygl.model.JyjcModel;
import com.wondersgroup.ylfwgl.manager.XdsjManager;



@Controller
@RequestMapping("/cfdp")
public class CfdpController extends BaseMybatisController<CfdpModel, String> {
	@Autowired
	private CfdpManager CfdpManager;
	
	@Autowired
	public XdsjManager xdsjManager;

	
	@RequestMapping("/queryCfdp")
	public ModelAndView queryList(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/querycfdp");
		try {
			PageRequest pageRequest = newPageRequest(request);
			List<YljgModel> jgList =  xdsjManager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageResult<CfdpModel> page = this.getBaseManager().pageSelect(pageRequest);
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
	@RequestMapping("/cfdpDetial")
	public ModelAndView queryDetial(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cfdpDetail");
			try {
				PageRequest pageRequest = newPageRequest(request);
				String yljgdm = request.getParameter("yljgdm")!=null?request.getParameter("yljgdm"):"";
				String cfbh = request.getParameter("cfbh")!=null?request.getParameter("cfbh"):"";
				String jzlsh = request.getParameter("jzlsh")!=null?request.getParameter("jzlsh"):"";
				String sfzh = request.getParameter("sfzh")!=null?request.getParameter("sfzh"):"";
				JyjcModel jy = CfdpManager.findJy(yljgdm, jzlsh);
				List<JyjcModel> jc = CfdpManager.findJc(yljgdm, sfzh);
				HzxxModel hzxx = CfdpManager.findXx(yljgdm, cfbh);
				List<CfModel>cfxx = CfdpManager.findCf(yljgdm, cfbh);
				List<Cfdp> cfdp = CfdpManager.findCfdp(yljgdm, cfbh);
				result.addObject("jy", jy);
				result.addObject("jc", jc);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				result.addObject("count", 1);
				result.addObject("yljgdm", yljgdm);
				result.addObject("cfbh", cfbh);
				result.addObject("jzlsh", jzlsh);
				result.addObject("sfzh", sfzh);
				result.addObject("hzxx", hzxx);
				result.addObject("cfxx", cfxx);
				result.addObject("cfdp", cfdp);
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	@RequestMapping("/cfdpEdit")
	public ModelAndView Edit(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cfdpEdit");
			try {
				String yljgdm = request.getParameter("yljgdm")!=null?request.getParameter("yljgdm"):"";
				String cfbh = request.getParameter("cfbh")!=null?request.getParameter("cfbh"):"";
				String cfmxh = request.getParameter("cfmxh")!=null?request.getParameter("cfmxh"):"";
				result.addObject("yljgdm",yljgdm);
				result.addObject("cfbh",cfbh);
				result.addObject("cfmxh",cfmxh);
				result.addObject("code", 0);
				result.addObject("msg", "success");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	
	@RequestMapping("/cfdpFind")
	public ModelAndView findCfdpnr(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cfdpUpdate");
			try {
				String id = request.getParameter("id")!=null?request.getParameter("id"):"";
				Cfdp cfdp = CfdpManager.findCfdpnr(id);
				result.addObject("cfdp",cfdp);
				result.addObject("code", 0);
				result.addObject("msg", "success");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	@RequestMapping("/cfdpUpdate")
	public ModelAndView cfdpUpdate(HttpServletRequest request,HttpServletResponse response,Cfdp cfdp) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
			try {
				if(cfdp.getType()!=null) {
					cfdp.setHgbz("0");
				}
				CfdpManager.updateCfdpnr(cfdp);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				//result.setViewName("redirect:http://localhost:8080/ylpt/cfdp/queryCfdp");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	
	@RequestMapping("/saveCfdp")
	public ModelAndView Save(HttpServletRequest request,HttpServletResponse response,CfdpModel cfdp) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
			try {
				if(cfdp.getType()!=null) {
					cfdp.setHgbz("0");
				}
				String yljgdm=cfdp.getYljgdm();
				String cfbh = cfdp.getCfbh();
				CfdpManager.insertCfdp(cfdp);
				if(cfdp.getType()!=null && !"".equals(cfdp.getType())) {
					CfdpManager.updateCfdp1(yljgdm, cfbh);
				}else {
					CfdpManager.updateCfdp(yljgdm, cfbh);
				}
				result.addObject("code", 0);
				result.addObject("msg", "success");
				//result.setViewName("redirect:http://localhost:8080/ylpt/cfdp/queryCfdp");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	
	@RequestMapping("/cfdpDel")
	public ModelAndView cfdpDel(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
			try {
				String id = request.getParameter("id")!=null?request.getParameter("id"):"";
				CfdpManager.deleteCfdp(id);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				//result.setViewName("redirect:http://localhost:8080/ylpt/cfdp/queryCfdp");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	@RequestMapping("/cfdpXcwt")
	public ModelAndView cfdpXcwt(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cfdpEdit");
			try {
				String yljgdm = request.getParameter("yljgdm")!=null?request.getParameter("yljgdm"):"";
				String cfbh = request.getParameter("cfbh")!=null?request.getParameter("cfbh"):"";
				result.addObject("yljgdm", yljgdm);
				result.addObject("cfbh", cfbh);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				//result.setViewName("redirect:http://localhost:8080/ylpt/cfdp/queryCfdp");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	@RequestMapping("/tjfx")
	public ModelAndView tjfx(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/cfdpTjfx");
			try {
				List<YljgModel> jgList =  xdsjManager.getAllYljg();
				request.setAttribute("jgList", jgList);
				List <CfdpTjfxModel> tjfx = CfdpManager.findTjfx();
				result.addObject("tjfx", tjfx);
				result.addObject("code", 0);
				result.addObject("msg", "success");
				//result.setViewName("redirect:http://localhost:8080/ylpt/cfdp/queryCfdp");
			} catch (Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			}
		return result;		
	}
	
	@Override
	public Class<CfdpModel> getEntityClass() {
		// TODO Auto-generated method stub
		return CfdpModel.class;
	}
	

	@Override
	public BaseMybatisManager<CfdpModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return CfdpManager;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
