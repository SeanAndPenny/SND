package com.wondersgroup.ylfwgl.manager;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ylfwgl.dao.XdsjDao;
import com.wondersgroup.ylfwgl.model.XdsjModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Component
public class XdsjManager extends BaseMybatisManager<XdsjModel, String> {

	@Autowired
	private XdsjDao xdsjDao;

	@Override
	public BaseMybatisDao<XdsjModel, String> getBaseDao() {
		return xdsjDao;
	}

	public List<YljgModel> getAllYljg(){
		return xdsjDao. getAllYljg();
	}
	public YljgModel getByYljgdm(String yljgdm){
		return xdsjDao.getByYljgdm(yljgdm);
	}

}