package  com.wondersgroup.ylfwgl.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.manager.TbAuthUserManager;
import com.wondersgroup.commons.model.TbAuthUser;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.AreaManager;
import com.wondersgroup.wszygl.manager.AreaSqjlManager;
import com.wondersgroup.wszygl.manager.SjscjlManager;
import com.wondersgroup.wszygl.model.AreaModel;
import com.wondersgroup.wszygl.model.AreaSqjlModel;
import com.wondersgroup.wszygl.utils.TreeUtil;
import com.wondersgroup.ylfwgl.manager.XdsjManager;
import com.wondersgroup.ylfwgl.model.XdsjModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Controller
@RequestMapping("/xdsj")
public class XdsjController extends  BaseMybatisController<XdsjModel, String>{
	@Autowired
	public XdsjManager xdsjManager;


	@RequestMapping("/queryXdsj")
	public ModelAndView querySqjl(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("ylfwgl/query_xdsj");
		try {
			List<YljgModel> jgList =  xdsjManager.getAllYljg();
			request.setAttribute("jgList", jgList);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<XdsjModel> page = getBaseManager().pageSelect(pageRequest);
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
	public Class<XdsjModel> getEntityClass() {
		return XdsjModel.class;
	}


	@Override
	public BaseMybatisManager<XdsjModel, String> getBaseManager() {
		return xdsjManager;
	}


	@Override
	public String getViewPath() {
		return null;
	}
	
}