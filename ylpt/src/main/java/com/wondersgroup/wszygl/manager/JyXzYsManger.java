package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JyXzYsDao;
import com.wondersgroup.wszygl.model.JyModel;
@Controller
public class JyXzYsManger extends BaseMybatisManager<JyModel,String>{
	@Autowired
	private JyXzYsDao jyXzYsDao;

	@Override
	public BaseMybatisDao<JyModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jyXzYsDao;
	}
	public List<JyModel> getJyXzYs(String sfws,String yljgdm,String sqks){
		return jyXzYsDao.getJyXzYs(sfws,yljgdm,sqks);
	}
	public  JyModel  getJybgdbh(String bgdh,String yljgdm,String bgrq){
		return jyXzYsDao.getJybgdbh(bgdh,yljgdm,bgrq);
	}
	public List<JyModel> getJybgdbhList(String bgdh,String yljgdm,String bgrq){
		return jyXzYsDao.getJybgdbhList(bgdh,yljgdm,bgrq);
	}
}
