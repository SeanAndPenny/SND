package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.CwtjXzBqDao;
import com.wondersgroup.wszygl.model.CwtjModel;
import com.wondersgroup.wszygl.model.JtysModel;
@Controller
public class CwtjXzBqManger extends BaseMybatisManager<CwtjModel,String>{
	@Autowired
	private CwtjXzBqDao cwtjXzBqDao;
	
	//核定
	public List<CwtjModel> getCwHdtjXzBqList(String yljgdm,String ids){
		return cwtjXzBqDao.getCwHdtjXzBqList(yljgdm,ids);
	}
	//开发
	public List<CwtjModel> getCwKftjXzBqList(String yljgdm,String ids){
		return cwtjXzBqDao.getCwKftjXzBqList(yljgdm,ids);
	}
	//当前
	
	public List<CwtjModel> getCwDqtjXzBqList(String yljgdm,String ids){
		return cwtjXzBqDao.getCwDqtjXzBqList (yljgdm,ids);
	}
	//剩余
	public List<CwtjModel> getCwSytjXzBqList(String yljgdm,String ids){
		return cwtjXzBqDao.getCwSytjXzBqList (yljgdm,ids);
	}

	
	@Override
	public BaseMybatisDao<CwtjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return cwtjXzBqDao;
	}

}
