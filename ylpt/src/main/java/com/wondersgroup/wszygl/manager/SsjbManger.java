package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsjbDao;
import com.wondersgroup.wszygl.model.SslistModel;
@Component
public class SsjbManger  extends BaseMybatisManager<SslistModel,String>{
	@Autowired
	private SsjbDao ssjbDao;
 public List<SslistModel> getSsjb(){
	 return ssjbDao.getSsjb();
 }
 public SslistModel getSstjList() {
	 return ssjbDao.getSstjList();
 }

@Override
public BaseMybatisDao<SslistModel, String> getBaseDao() {
	// TODO Auto-generated method stub
	return ssjbDao;
}
}
