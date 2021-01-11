package com.wondersgroup.wszygl.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SjscjlDao;
import com.wondersgroup.wszygl.model.SjscInfo;
@Component
public class SjscjlManager extends BaseMybatisManager<SjscInfo, String>{

	@Autowired
	private SjscjlDao sjscjlDao;
	@Override
	public BaseMybatisDao<SjscInfo, String> getBaseDao() {
		return sjscjlDao;
	}
	public List<Map<String, Object>> getAllYljg() {
		return sjscjlDao.getAllYljg();
	}
	
	public PageResult<SjscInfo> getData(PageRequest pageRequest) {
		Assert.notNull(pageRequest, "pageRequest must not be null");
		PageHelper.startPage(pageRequest.getPageNum(), pageRequest.getPageSize());
		Page<SjscInfo> page = sjscjlDao.getData(pageRequest.getFilters());
		int pageNum = page.getPageNum();
		int pageSize = page.getPageSize();
		long total = page.getTotal();
		PageResult<SjscInfo> pageResult = new PageResult<SjscInfo>(pageNum, pageSize, total);
		List<SjscInfo> result = page.getResult();
		pageResult.setResult(result);
		logger.debug("total>>" + total + ">resultsize>>" + result.size() + ">pageNum>" + pageNum + ">pageSize>"
				+ pageSize + ">result>" + result);
		return pageResult;
	}
	public List<Map<String, Object>> gatAllTable() {
		return sjscjlDao.gatAllTable();
	}

}
