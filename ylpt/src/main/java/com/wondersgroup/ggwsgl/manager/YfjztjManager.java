package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.YfjztjDao;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YfjztjModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Component
public class YfjztjManager extends BaseMybatisManager<YfjztjModel,String>{
	@Autowired
	private YfjztjDao yfjztjdao;
	
	@Override
	public BaseMybatisDao<YfjztjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return yfjztjdao;
	}
	public List<YljgModel> getAllYljg(){
		return yfjztjdao.getAllYljg();
	}
	public List<TbModel> getAllTb(String yljgdm,String startdate,String enddate){
		return yfjztjdao.getAllTb(yljgdm, startdate, enddate);
	}

}
