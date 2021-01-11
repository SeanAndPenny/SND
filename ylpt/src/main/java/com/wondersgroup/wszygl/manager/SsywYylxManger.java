package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsywYylxDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Controller
public class SsywYylxManger extends BaseMybatisManager<SsywjcModel,String>{
	@Autowired
	private SsywYylxDao ssywYylxDao;
	public List<SsywjcModel> getYylx(String ids,String ywsj){
		return ssywYylxDao.getYylx(ids,ywsj);
	}
	
	@Override
	public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssywYylxDao;
	}

}
