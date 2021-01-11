package com.wondersgroup.wszygl.manager;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.AreaDao;
import com.wondersgroup.wszygl.model.AreaModel;

@Component
public class AreaManager extends BaseMybatisManager<AreaModel, String> {

	@Autowired
	private AreaDao areaDao;

	@Override
	public BaseMybatisDao<AreaModel, String> getBaseDao() {
		return areaDao;
	}

	public List<AreaModel> getAll() {
		return areaDao.getAll();
	}

	public AreaModel getOneByCode(String code) {

		return areaDao.getOneByCode(code);
	}

	public void insertOne(AreaModel newAreaModel) {
		areaDao.insertOne(newAreaModel);
		
	}


}