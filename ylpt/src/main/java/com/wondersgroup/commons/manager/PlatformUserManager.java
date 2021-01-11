package com.wondersgroup.commons.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.dao.PlatformUserDao;
import com.wondersgroup.commons.model.PlatformSys;
import com.wondersgroup.commons.model.PlatformUser;
import com.wondersgroup.commons.model.PtLog;

@Component
public class PlatformUserManager extends BaseMybatisManager<PlatformUser, String> {

	@Autowired
	private PlatformUserDao platformUserDao;

	@Override
	public BaseMybatisDao<PlatformUser, String> getBaseDao() {
		return platformUserDao;
	}

	public PlatformUser getByUseridAndKeyWord(String userid,String otherplatkey) {
		return platformUserDao.getByUseridAndKeyWord(userid,otherplatkey);
	}

	public void insertPtlog(PtLog ptLog) {
		platformUserDao.insertPtlog(ptLog);
		
	}

	public PlatformSys getSysByKeyWord(String otherplatkey) {
		// TODO Auto-generated method stub
		return platformUserDao.getSysByKeyWord(otherplatkey);
	}

	public void insertUser(PlatformUser platformUser) {
		platformUserDao.insertUser(platformUser);
		
	}

	public void insertSys(PlatformSys platformSys) {
		platformUserDao.insertSys(platformSys);
		
	}
	
	
}