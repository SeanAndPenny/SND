package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.LnrtjfxDao;
import com.wondersgroup.wszygl.model.LnrModel;
@Controller
public class LnrtjfxManger  extends BaseMybatisManager<LnrModel,String>{
	@Autowired
	private  LnrtjfxDao lnrtjfxDao;
	public List<LnrModel> getLnrtjxgfx(String startdate,String enddate,String yljgdm){
		return lnrtjfxDao.getLnrtjxgfx(startdate,enddate,yljgdm);
	}
	public List<LnrModel> getLnrtjCzfx(String startdate,String enddate,String yljgdm){
		return lnrtjfxDao.getLnrtjCzfx(startdate,enddate,yljgdm);
	}
	public List<LnrModel> getLnrtjCzXgfx(String startdate,String enddate,String yljgdm){
		return lnrtjfxDao.getLnrtjCzXgfx(startdate,enddate,yljgdm);
	}
	public List<LnrModel> getLnrGxyfx(String startdate,String enddate,String yljgdm){
		return lnrtjfxDao.getLnrGxyfx(startdate,enddate,yljgdm);
	}
	public List<LnrModel> getLnrTnbfx(String startdate,String enddate,String yljgdm){
		return lnrtjfxDao.getLnrTnbfx(startdate,enddate,yljgdm);
	}
	public List<LnrModel> getLnrGxyTnbfx(String startdate,String enddate,String yljgdm){
		return lnrtjfxDao.getLnrGxyTnbfx(startdate,enddate,yljgdm);
	}
	
	@Override
	public BaseMybatisDao<LnrModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return lnrtjfxDao;
	}

}
