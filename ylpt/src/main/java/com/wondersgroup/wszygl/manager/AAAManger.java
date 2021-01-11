package com.wondersgroup.wszygl.manager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.AAADao;
import com.wondersgroup.wszygl.model.AAAModel;

@Component
public class AAAManger extends BaseMybatisManager<AAAModel, String> {
	@Autowired
	private AAADao aaaDao;
	public String getxxx() {
		return aaaDao.getxxx();
	}
	@Override
	public BaseMybatisDao<AAAModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return aaaDao;
	}

}
