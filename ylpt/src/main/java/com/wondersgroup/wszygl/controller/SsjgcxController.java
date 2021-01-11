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
import com.wondersgroup.wszygl.manager.SsjbManger;
import com.wondersgroup.wszygl.manager.SsjgcxManger;
import com.wondersgroup.wszygl.model.SslistModel;
import com.wondersgroup.wszygl.model.SsywjcModel;

@Controller
@RequestMapping("/ssjgcx")
public class SsjgcxController extends BaseMybatisController<SslistModel,String>{
	@Autowired
    public SsjgcxManger ssjgcxManger;
	@Autowired 
	public SsjbManger ssjbManger;
	@RequestMapping("/ssjgcx")
	public ModelAndView ssjgcx(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		try {
			
			List<SslistModel> ssList = ssjgcxManger.getSsjg(); 
			result.addObject("ssList", ssList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}

	
	@RequestMapping("/ssjbcx")
	public ModelAndView ssjbcx(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		try {
			
			List<SslistModel> ssList = ssjbManger.getSsjb();
			result.addObject("ssList", ssList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}


	@Override
	public Class<SslistModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public BaseMybatisManager<SslistModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}
}
