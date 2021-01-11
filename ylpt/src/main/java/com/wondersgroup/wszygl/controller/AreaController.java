package  com.wondersgroup.wszygl.controller;

import java.util.ArrayList;
import java.util.List;
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
import com.wondersgroup.wszygl.model.AreaModel;
import com.wondersgroup.wszygl.model.AreaSqjlModel;
import com.wondersgroup.wszygl.utils.TreeUtil;

@Controller
@RequestMapping("/area")
public class AreaController extends  BaseMybatisController<AreaModel, String>{
	@Autowired
	public AreaManager areaManager;
	@Autowired
	public AreaSqjlManager areaSqjlManager;
	@Autowired
	public TbAuthUserManager tbAuthUserManager;
	
	@RequestMapping("/tree")
	public ModelAndView tree(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
		
			List<AreaModel> alls=areaManager.getAll();
//			TreeUtil treeUtils = TreeUtil.getInstance();			
			// 最后的结果
		    List<AreaModel> menuList = new ArrayList<AreaModel>();
		    // 先找到所有的一级菜单
		    for (int i = 0; i < alls.size(); i++) {
		        // 一级菜单没有parentId
		        if (StringUtils.isBlank(alls.get(i).getPid())) {
		        	menuList.add(alls.get(i));
		        }
		    }
			
		    // 为一级菜单设置子菜单，getChild是递归调用的
		    for (AreaModel menu : menuList) {
		        menu.setChildren(getChild(menu.getCode(), alls));
		    }

//			List<AreaModel> treeList=treeUtils.toAreaTreeList(alls);
			result.addObject("treeList", menuList);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	@RequestMapping("/querySqjl")
	public ModelAndView querySqjl(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/query_sqjl");
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<AreaSqjlModel> page = areaSqjlManager.pageSelect(pageRequest);
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
	
	@RequestMapping("/newOne")
	public ModelAndView newOne(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
		String code=request.getParameter("code");
		AreaModel oldone = areaManager.getOneByCode(code);
		if(oldone!=null) {
			result.setViewName("wszygl/area_new");
			result.addObject("oldone", oldone);
		}else {
			result.setViewName("commons/other_login_error");
			result.addObject("msg", "系统异常！未找到父节点！");
		}
		}catch(Exception e) {
			result.setViewName("commons/other_login_error");
			result.addObject("msg", e.getMessage().toString());
		}
		return result;
	}
	
	/**
	 * 保存增加子节点
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/saveNewOne")
	public ModelAndView saveNewOne(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
		String oldcode=request.getParameter("oldcode");
		String name=request.getParameter("name");
		String code=request.getParameter("code");
		AreaModel oldone = areaManager.getOneByCode(oldcode);
		if(oldone!=null) {
			AreaModel ifone = areaManager.getOneByCode(code);
				if(ifone!=null) {
					result.addObject("code",500);
					result.addObject("msg", "不能添加已经存在的地区编码");
				}else {
					result.addObject("code",0);
					AreaSqjlModel entity=new AreaSqjlModel();
					TbAuthUser user=(TbAuthUser) request.getSession().getAttribute("loginUser");
					entity.setWhocreateid(user!=null?user.getUserid():"");
					entity.setWhocreatename(user!=null?user.getUsername():"");
					entity.setId(UUID.randomUUID().toString());
					entity.setOldxx(oldcode);
					entity.setNewxx(code+"|"+name);
					entity.setUpdatesql("INSERT INTO T_AREA (NAME,CODE,LELEVEL,PID,VERSION,UPDATETIME,REMARK,REMOVED) VALUES ('"+name+"','"+code+"','3','"+oldone.getCode()+"','"+oldone.getVersion()+"','','','0')");
					areaSqjlManager.saveOrUpdate(entity);
					result.setViewName("wszygl/area_new");
					result.addObject("oldone", oldone);
				}
		}else {
			result.addObject("code",500);
			result.addObject("msg", "系统异常！未找到父节点！");
		}
		}catch(Exception e) {
			result.addObject("code",500);
			result.addObject("msg", e.getMessage().toString());
		}
		return result;
	}
	
	/**
	 * 展示申请记录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/showOneSqjl")
	public ModelAndView showOneSqjl(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/show_sqjl");
		String id=request.getParameter("id");
		AreaSqjlModel one=areaSqjlManager.getById(id);
		String flag=one.getFlag();
		if(one.getUpdatesql().contains("delete")) {//删除记录
			AreaModel oldone = areaManager.getOneByCode(one.getCode());
			if(oldone==null) {
				oldone=new AreaModel();
				String oldxx=one.getOldxx();
				String[] olds = oldxx.split("\\|");
				String oldcode=olds[0];
				String oldname=olds[1];
				oldone.setCode(oldcode);
				oldone.setName(oldname);
			}
			result.addObject("delete", 1);
			result.addObject("oldone", oldone);
		}else if(one.getUpdatesql().contains("INSERT")){//增加子节点
			result.addObject("INSERT", 1);
			AreaModel oldone = areaManager.getOneByCode(one.getOldxx());
			String newxx=one.getNewxx();
			String[] news = newxx.split("\\|");
			String newcode=news[0];
			String newname=news[1];
			result.addObject("pOne", oldone);
			result.addObject("newcode", newcode);
			result.addObject("newname", newname);
		}else {//修改本次记录
			String oldxx=one.getOldxx();
			String newxx=one.getNewxx();
			String[] olds = oldxx.split("\\|");
			String oldcode=olds[0];
			String oldname=olds[1];
			String[] news = newxx.split("\\|");
			String newcode=news[0];
			String newname=news[1];
			
			result.addObject("oldcode", oldcode);
			result.addObject("oldname", oldname);
			result.addObject("newcode", newcode);
			result.addObject("newname", newname);
		
		}
		result.addObject("one", one);
		//1申请待审核；2申请不通过；3申请通过；4处理完成
		if("1".equals(flag)) {
			result.addObject("flag", "申请待审核");
		}else if("2".equals(flag)) {
			result.addObject("flag", "申请不通过");
		}else if("3".equals(flag)) {
			result.addObject("flag", "申请通过");
		}else if("4".equals(flag)) {
			result.addObject("flag", "处理完成");
		}else {
			result.addObject("flag", "未知");
		}
		
		return result;
	}
	

	
	@RequestMapping("/delSqjl")
	public ModelAndView delSqjl(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			String id=request.getParameter("id");
			AreaSqjlModel one=areaSqjlManager.getById(id);
			areaSqjlManager.delete(one);
			result.addObject("code", 0);
		}catch(Exception e) {
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 保存审核
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/shSqjlOne")
	public ModelAndView shSqjlOne(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			String id=request.getParameter("id");
			String  flag=request.getParameter("flag");
			AreaSqjlModel one=areaSqjlManager.getById(id);
			if("3".equals(flag)) {//审核通过直接执行
				String updateSql=one.getUpdatesql();
				areaSqjlManager.exculeSql(updateSql);
			}else {
				
			}
			
			TbAuthUser user=(TbAuthUser) request.getSession().getAttribute("loginUser");
			one.setWhoupdateid(user.getUserid());
			one.setWhoupdatename(user.getUsername());
			one.setFlag(flag);
			result.addObject("code", 0);
			areaSqjlManager.saveOrUpdate(one);
		}catch(Exception e) {
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping("/shSqjl")
	public ModelAndView shSqjl(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/sh_sqjl");
		String id=request.getParameter("id");
		AreaSqjlModel one=areaSqjlManager.getById(id);
		String flag=one.getFlag();
		if(one.getUpdatesql().contains("delete")) {
			AreaModel oldone = areaManager.getOneByCode(one.getCode());
			result.addObject("delete", 1);
			result.addObject("oldone", oldone);
		}else if(one.getUpdatesql().contains("INSERT")){//增加子节点
			result.addObject("INSERT", 1);
			AreaModel oldone = areaManager.getOneByCode(one.getOldxx());
			String newxx=one.getNewxx();
			String[] news = newxx.split("\\|");
			String newcode=news[0];
			String newname=news[1];
			result.addObject("pOne", oldone);
			result.addObject("newcode", newcode);
			result.addObject("newname", newname);
		}else {
			String oldxx=one.getOldxx();
			String newxx=one.getNewxx();
			String[] olds = oldxx.split("\\|");
			String oldcode=olds[0];
			String oldname=olds[0];
			String[] news = newxx.split("\\|");
			String newcode=news[0];
			String newname=news[0];
			result.addObject("oldcode", oldcode);
			result.addObject("oldname", oldname);
			result.addObject("newcode", newcode);
			result.addObject("newname", newname);
		}	
		result.addObject("one", one);
		//1申请待审核；2申请不通过；3申请通过；4处理完成
		if("1".equals(flag)) {
			result.addObject("flag", "申请待审核");
		}else if("2".equals(flag)) {
			result.addObject("flag", "申请不通过");
		}else if("3".equals(flag)) {
			result.addObject("flag", "申请通过");
		}else if("4".equals(flag)) {
			result.addObject("flag", "处理完成");
		}else {
			result.addObject("flag", "未知");
		}
		
		return result;
	}
	
	
	@RequestMapping("/saveAreaOne")
	public ModelAndView saveAreaOne(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
//		result.setViewName("wszygl/editOne");
		try {
			String type = request.getParameter("type");
			String oldcode= request.getParameter("oldcode");
			String oldname= request.getParameter("oldname");
			TbAuthUser user=(TbAuthUser) request.getSession().getAttribute("loginUser");
			AreaSqjlModel entity=new AreaSqjlModel();
			entity.setWhocreateid(user!=null?user.getUserid():"");
			entity.setWhocreatename(user!=null?user.getUsername():"");
			entity.setOldxx(oldcode+"|"+oldname);
			entity.setCode(oldcode);
			String uuid = UUID.randomUUID().toString();
			String updatesql="";
			if("del".equals(type)) {
				updatesql="delete from t_area t where  t.code='"+oldcode+"'";
			}else {
				String code = request.getParameter("code");
				String name = request.getParameter("name");
				entity.setNewxx(code+"|"+name);
				updatesql="update t_area t  set t.code='"+code+"', t.name='"+name+"' where t.code='"+oldcode+"'" ;
			}
			entity.setId(uuid);
			entity.setUpdatesql(updatesql);
			areaSqjlManager.saveOrUpdate(entity);

			result.addObject("code", 0);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	/**
	 * 递归查找子菜单
	 * 
	 * @param id
	 *            当前菜单id
	 * @param rootMenu
	 *            要查找的列表
	 * @return
	 */
	private List<AreaModel> getChild(String id, List<AreaModel> rootMenu) {
	    // 子菜单
	    List<AreaModel> childList = new ArrayList<>();
	    for (AreaModel menu : rootMenu) {
	        // 遍历所有节点，将父菜单id与传过来的id比较
	        if (StringUtils.isNotBlank(menu.getPid())) {
	            if (menu.getPid().equals(id)) {
	                childList.add(menu);
	            }
	        }
	    }
	    // 把子菜单的子菜单再循环一遍
	    for (AreaModel menu : childList) {// 没有url子菜单还有子菜单
	        if (StringUtils.isBlank(menu.getName())) {
	            // 递归
	            menu.setChildren(getChild(menu.getId(), rootMenu));
	        }
	    } // 递归退出条件
	    if (childList.size() == 0) {
	        return null;
	    }
	    return childList;
	}
	
	@RequestMapping("/showOne")
	public ModelAndView showOne(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		
		try {
			String code=request.getParameter("code");
			String type=request.getParameter("type");
			AreaModel area=areaManager.getOneByCode(code);
			if("del".equals(type)) {
				result.setViewName("wszygl/delOne");
			}else if("detail".equals(type)) {
				result.setViewName("wszygl/showOne");
			}else if("edit".equals(type)) {
				result.setViewName("wszygl/editOne");
			}else{
				result.setViewName("wszygl/showOne");
			}
			
			result.addObject("code", 0);
			result.addObject("area", area);
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	@RequestMapping("/check")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/query_area");
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<AreaModel> page = this.getBaseManager().pageSelect(pageRequest);
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
	public Class<AreaModel> getEntityClass() {
		return AreaModel.class;
	}


	@Override
	public BaseMybatisManager<AreaModel, String> getBaseManager() {
		return areaManager;
	}


	@Override
	public String getViewPath() {
		return null;
	}
	
}