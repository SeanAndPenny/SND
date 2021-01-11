package com.wondersgroup.wszygl.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.MrsjqkDao;
import com.wondersgroup.wszygl.model.BmModel;
import com.wondersgroup.wszygl.model.MrsjqkModel;
import com.wondersgroup.wszygl.model.YljgMcModel;

@Controller
public class MrsjqkManger extends BaseMybatisManager<MrsjqkModel,String>{
	@Autowired
	private  MrsjqkDao mrsjqkDao;
	
	public List<YljgMcModel> getAllYljg(){
		return mrsjqkDao.getAllYljg();
	}
	public List<BmModel>getAllBm(){
		return mrsjqkDao.getAllBm();
	}
	@Override
	public BaseMybatisDao<MrsjqkModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return mrsjqkDao;
	}

}
