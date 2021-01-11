package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YjclXxDao;
import com.wondersgroup.wszygl.model.YjclModel;
@Controller
public class YjclXxManger  extends BaseMybatisManager<YjclModel, String>{
	@Autowired
	public YjclXxDao yjclXxDao;
	@Override
	public BaseMybatisDao<YjclModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return yjclXxDao;
	}

}
