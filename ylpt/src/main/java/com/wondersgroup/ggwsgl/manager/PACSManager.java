package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.PACSDao;
import com.wondersgroup.ggwsgl.model.PACSModel;
import com.wondersgroup.ggwsgl.model.YljgModel;
@Component
public class PACSManager extends BaseMybatisManager<PACSModel,String>{
	
	@Autowired
	private PACSDao pacsDao;
	@Override
	public BaseMybatisDao<PACSModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return pacsDao;
	}
	public List<YljgModel>getAllYljg(){
		return pacsDao.getAllYljg();
	}

}
