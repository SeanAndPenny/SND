package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsJbxzJgDao;
import com.wondersgroup.wszygl.model.SslistModel;

@Controller
public class SsJbxzJgManger  extends BaseMybatisManager<SslistModel,String>{
	@Autowired
	private  SsJbxzJgDao ssJbxzJgDao;
	
	public List<SslistModel> getssJbxzJg(String ssjb ){
		return ssJbxzJgDao.getssJbxzJg(ssjb);
	}
	
	@Override
	public BaseMybatisDao<SslistModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssJbxzJgDao;
	}

}
