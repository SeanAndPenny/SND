package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsywjcKsDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Controller
public class SsywjcKsManger extends BaseMybatisManager<SsywjcModel,String>{
	@Autowired
	private SsywjcKsDao SsywjcKsdao;
	@Override
	public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return SsywjcKsdao;
	};
	public List<SsywjcModel> getSywjcKs(String yljgdm,String rq){
		return SsywjcKsdao.getSywjcKs(yljgdm,rq);
	}

}
