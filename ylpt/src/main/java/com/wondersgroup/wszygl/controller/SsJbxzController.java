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
import com.wondersgroup.wszygl.manager.SsJbxzJgManger;
import com.wondersgroup.wszygl.model.SslistModel;

@Controller
@RequestMapping("/ssJbxzJg")
public class SsJbxzController extends BaseMybatisController<SslistModel,String>{
	@Autowired
    public SsJbxzJgManger ssJbxzJgManger;
	@RequestMapping("/ssJbxzJg")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String ssjb = request.getParameter("p_ssjb"); 
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/ssJbJgxz");
		try { 
			result.addObject("ssjb", ssjb);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<SslistModel> page = ssJbxzJgManger.pageSelect(pageRequest);
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

	@RequestMapping("/ssJbxzJgecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String ssjb = request.getParameter("p_ssjb"); 
		try {
			result.addObject("ssjb", ssjb); 
			List<SslistModel>ssJbxzJgechartsechartsList = ssJbxzJgManger.getssJbxzJg(ssjb);
			result.addObject("ssJbxzJgechartsechartsList", ssJbxzJgechartsechartsList);
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
};