package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.FyfmxxDao;
import com.wondersgroup.ggwsgl.model.FyfmxxModel;
@Component
public class FyfmxxManager extends BaseMybatisManager<FyfmxxModel, String>{
	@Autowired
	private FyfmxxDao fyfmxxDao;

	@Override
	public BaseMybatisDao<FyfmxxModel, String> getBaseDao() {
		return fyfmxxDao;
	}
	public List<FyfmxxModel> getFmxx(String sfzh){
		return fyfmxxDao.getFmxx(sfzh);
	}

}
