package  com.wondersgroup.ylfwgl.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.huanya.ws.bean.WebsvcResult;
import com.huanya.ws.client.HuanyaDocumentInfoClient;
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.commons.XmlMapper;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.ylfwgl.manager.JbxxManager;
import com.wondersgroup.ylfwgl.manager.XdsjManager;
import com.wondersgroup.ylfwgl.model.JbxxModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Controller
@RequestMapping("jbxx")
public class JbxxController extends  BaseMybatisController<JbxxModel, String>{
	@Autowired
	public JbxxManager jbxxManager;
	@Autowired
	public XdsjManager xdsjManager;
	/*@Resource(name = "huanyaDocumentInfoClient")
	private HuanyaDocumentInfoClient huanyaDocumentInfoClient;

	private static final XmlMapper xmlmapper = XmlMapper.buildXmlMapper(WebsvcResult.class);

	@RequestMapping("/getHuanyaDocumentInfo")
	public ModelAndView getHuanyaDocumentInfo(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView view = new ModelAndView("");
		try {
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String result = huanyaDocumentInfoClient.getMessage(startTime, endTime);
			WebsvcResult resbean = xmlmapper.xml2bean(result, WebsvcResult.class);
			if(resbean != null && "0".equals(resbean.getCode())) {
				view.addObject("success", 0);
				view.addObject("docinfo", resbean);
			} else {
				view.addObject("success", 1);
				view.addObject("msg", "调用接口失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			view.addObject("success", 1);
			view.addObject("msg", "调用接口错误：" + e.getMessage());
		}
		return view;
	}
*/

	@RequestMapping("/queryJbxx")
	public ModelAndView querySqjl(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("ylfwgl/query_jbxx");
		List<YljgModel> jgList =  xdsjManager.getAllYljg();
		request.setAttribute("jgList", jgList);
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JbxxModel> page = getBaseManager().pageSelect(pageRequest);
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
	public Class<JbxxModel> getEntityClass() {
		return JbxxModel.class;
	}


	@Override
	public BaseMybatisManager<JbxxModel, String> getBaseManager() {
		return jbxxManager;
	}


	@Override
	public String getViewPath() {
		return null;
	}
	
}