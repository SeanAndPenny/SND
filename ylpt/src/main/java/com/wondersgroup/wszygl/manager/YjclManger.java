package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YjclDao;
import com.wondersgroup.wszygl.model.YjclModel;

@Component
public class YjclManger extends BaseMybatisManager<YjclModel,String>{
	@Autowired
	private YjclDao yjclDao;
	public YjclModel getYjclList() {
		return yjclDao.getYjclList();
	}
	
	public List<YjclModel> getYjcl(){
		return yjclDao.getYjcl();
	}
	@Override
	public BaseMybatisDao<YjclModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return yjclDao;
	}

}
