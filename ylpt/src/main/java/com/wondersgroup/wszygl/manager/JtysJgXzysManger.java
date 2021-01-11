package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JtysJgXzysDao;
import com.wondersgroup.wszygl.model.JtysModel;
@Controller
public class JtysJgXzysManger  extends BaseMybatisManager<JtysModel,String>{
	@Autowired
	private JtysJgXzysDao jtysJgXzysDao;
	public List<JtysModel> getJtysJgXzys(String tdbh,String qyjgid){
		return jtysJgXzysDao.getJtysJgXzys(tdbh,qyjgid);
	}
	@Override
	public BaseMybatisDao<JtysModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jtysJgXzysDao;
	}
}
