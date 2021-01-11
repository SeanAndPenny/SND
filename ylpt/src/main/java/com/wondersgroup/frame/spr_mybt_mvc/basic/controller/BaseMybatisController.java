package com.wondersgroup.frame.spr_mybt_mvc.basic.controller;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.wondersgroup.api.BaseController;
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.beans.persistence.BaseEntity;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;

/**
 * 普通controller抽象实现
 * @author silent
 *
 * @param <T>
 * @param <PK>
 */
public abstract class BaseMybatisController<T extends BaseEntity, PK extends Serializable> implements BaseController<T, PK> {
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisController.class);

	public abstract BaseMybatisManager<T, PK> getBaseManager();

	public abstract String getViewPath();

	/**
	 * 页面跳转，任意在/WEB-INF/views/文件夹下的{anypage}.jsp
	 * {@code url: /module/{anypage} }
	 * @param page
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_JUMP + "/{page}")
	public ModelAndView _page(@PathVariable String page, HttpServletRequest request, HttpServletResponse response) {
		String tpage = page.trim();
		if(!tpage.startsWith("/")){
			tpage = "/" + tpage;
		}
		tpage = this.getViewPath() + tpage;
		logger.debug(String.format("goto page <%s>", tpage));
		return new ModelAndView(tpage);
	}

	/**
	 * 分页查询
	 * {@code url: /module/query }
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_QUERY)
	public ModelAndView _query(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView(getViewPath() + PAGE_QUERY);
		PageRequest pageRequest = newPageRequest(request);
		PageResult<T> page = this.getBaseManager().pageSelect(pageRequest);
		result.addObject("page", page);
		result.addObject("pageRequest", pageRequest);
		return result;
	}

	/**
	 * 加载<br>
	 * {@code url: /module/load/edit?id=xxx  }<br>
	 * {@code url: /module/load/detail?id=xxx  }<br>
	 * {@code url: /module/load/add  }<br>
	 * @param type
	 * @param entity
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_LOAD + "/{type}")
	public ModelAndView _addpage(@PathVariable String type, T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result;
		T _entity = null;
		if(PAGE_LOAD_DETAIL.equals(type) || PAGE_LOAD_EDIT.equals(type) || PAGE_LOAD_ADD.equals(type)) {
			result = new ModelAndView(getViewPath() + "/" + type);
		} else {
			throw new UnsupportedOperationException(String.format("Not implemented type <%s>", type));
		}
		if(PAGE_LOAD_ADD.equals(type)) {
			try {
				_entity = this.getEntityClass().newInstance();
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(String.format("can not create instance for ", this.getEntityClass().getName()));
			}
		} else {
			if(entity  != null) {
				PK pk = this.getBaseManager().generatePK(entity);
				if(pk != null) {
					_entity = this.getBaseManager().getById(pk);
				}
			}
		}
		result.addObject("entity", _entity);
		return result;
	}

	/**
	 * 仅适用于String/Number类型主键的load方法<br>
	 * {@code url: /module/load/edit/xxx  }<br>
	 * {@code url: /module/load/detail/xxx  }<br>
	 * @param type
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_LOAD + "/{type}" + "/{id}")
	public ModelAndView _load(@PathVariable String type, @PathVariable PK id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result;
		if(PAGE_LOAD_DETAIL.equals(type) || PAGE_LOAD_EDIT.equals(type)) {
			result = new ModelAndView(getViewPath() + "/" + type);
		} else {
			throw new UnsupportedOperationException(String.format("Not implemented type <%s>", type));
		}
		T entity = this.getBaseManager().getById(id);
		result.addObject("entity", entity);
		return result;
	}

	/**
	 * 仅适用于String/Number类型主键的load方法
	 * {@code url: /module/delete/xxx  }
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_DELETE + "/{id}")
	public ModelAndView _delete(@PathVariable PK id, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView result = new ModelAndView("redirect:" + getViewPath() + PAGE_QUERY);
		T entity = this.getBaseManager().getById(id);
		int deletecount = this.getBaseManager().delete(entity);
		logger.debug(String.format("delete number is %d", deletecount));
		return result;
	}

	/**
	 * 删除
	 * {@code url: /module/delete?id=xxx  }
	 * @param entity
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_DELETE)
	public ModelAndView _deleteentity(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView("redirect:" + getViewPath() + PAGE_QUERY);
		int deletecount = this.getBaseManager().delete(entity);
		logger.debug(String.format("delete number is %d", deletecount));
		return result;
	}

	/**
	 * 保存
	 * {@code url: /module/save  }
	 * @param entity
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_SAVE)
	public ModelAndView _save(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView("redirect:" + getViewPath() + PAGE_QUERY);
		this.getBaseManager().save(entity);
		return result;
	}

	/**
	 * 更新
	 * {@code url: /module/update  }
	 * @param entity
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_UPDATE)
	public ModelAndView _update(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView("redirect:" + getViewPath() + PAGE_QUERY);
		this.getBaseManager().update(entity);
		return result;
	}

	/**
	 * 新增或更新
	 * {@code url: /module/saveOrUpdate  }
	 * @param entity
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(PAGE_SAVEORUPDATE)
	public ModelAndView _saveOrUpdate(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView("redirect:" + getViewPath() + PAGE_QUERY);
		this.getBaseManager().saveOrUpdate(entity);
		return result;
	}

	protected void debugAllRequestParams(HttpServletRequest request) {
		Map<String, String[]> map = request.getParameterMap();
		if(map == null) {
			logger.debug("request parameter Map is empty");
			return;
		}
		for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
			String key = (String) iterator.next();
			StringBuffer msg = new StringBuffer(256);
			msg.append(String.format("%s = [", key));
			String[] vs = map.get(key);
			for (int i = 0; i < vs.length; i++) {
				msg.append(String.format("%s ,", vs[i]));
			}
			msg.append("]");
			logger.debug(msg.toString());
		}
	}

	protected PageRequest newPageRequest(HttpServletRequest request) {
		PageRequest pageRequest = new PageRequest();
		Map<String, Object> autoIncludeFilters = WebUtils.getParametersStartingWith(request, "p_");
		pageRequest.setFilters(autoIncludeFilters);
		int pagesize=10;
		if(request.getParameter("limit")!=null) {
			pagesize= Integer.parseInt(request.getParameter("limit"));
		}
		pageRequest.setPageSize(pagesize);

		int pagenum=1;
		if(request.getParameter("page")!=null) {
			pagenum= Integer.parseInt(request.getParameter("page"));
		}
		pageRequest.setPageNum(pagenum);
		pageRequest.setSortColumns(request.getParameter("sortcolumns"));
		return pageRequest;
	}
}
