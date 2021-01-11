package com.wondersgroup.frame.spr_mybt_mvc.basic.controller;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * Layui style Controller
 * @author silent
 *
 * @param <T>
 * @param <PK>
 */
public abstract class BaseMybatisLayuiController<T extends BaseEntity, PK extends Serializable> extends BaseMybatisController<T, PK> {
	protected final static Logger logger = LoggerFactory.getLogger(BaseMybatisLayuiController.class);

	protected abstract PK getPk(T entity);

	public ModelAndView _query(HttpServletRequest request, HttpServletResponse response) {
		debugAllRequestParams(request);
		ModelAndView result = new ModelAndView();
		try {
			PageRequest pageRequest = newPageRequest(request);
			PageResult<T> page = this.getBaseManager().pageSelect(pageRequest);
			
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
	public ModelAndView _delete(@PathVariable PK id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			ModelAndView _result = super._delete(id, request, response);
			result.addAllObjects(_result.getModel());
			result.addObject("code", 0);
			result.addObject("msg", "success");
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

	@Override
	public ModelAndView _deleteentity(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			ModelAndView _result = super._deleteentity(entity, request, response);
			result.addAllObjects(_result.getModel());
			result.addObject("code", 0);
			result.addObject("msg", "success");
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

	@Override
	public ModelAndView _save(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			ModelAndView _result = super._save(entity, request, response);
			result.addAllObjects(_result.getModel());
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("pk", getPk(entity));
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

	@Override
	public ModelAndView _update(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			ModelAndView _result = super._update(entity, request, response);
			result.addAllObjects(_result.getModel());
			result.addObject("code", 0);
			result.addObject("msg", "success");
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}

	@Override
	public ModelAndView _saveOrUpdate(T entity, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		try {
			ModelAndView _result = super._saveOrUpdate(entity, request, response);
			result.addAllObjects(_result.getModel());
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("pk", getPk(entity));
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
	}
}
