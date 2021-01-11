package com.wondersgroup.commons.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.dao.TbAuthUserDao;
import com.wondersgroup.commons.model.TbAuthUser;

@Component
public class TbAuthUserManager extends BaseMybatisManager<TbAuthUser, String> {

	@Autowired
	private TbAuthUserDao tbAuthUserDao;

	@Override
	public BaseMybatisDao<TbAuthUser, String> getBaseDao() {
		return tbAuthUserDao;
	}

	public TbAuthUser getByEntity(TbAuthUser entity){
		return tbAuthUserDao.getByEntity(entity);
	}
	
}