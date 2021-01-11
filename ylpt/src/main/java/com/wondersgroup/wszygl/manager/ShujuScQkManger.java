package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.ShujuScQkDao;
import com.wondersgroup.wszygl.model.ShujuScQkModel;
@Component
public class ShujuScQkManger extends BaseMybatisManager<ShujuScQkModel,String>{
	 @Autowired
	    public ShujuScQkDao shujuScQkDao;
	public List<ShujuScQkModel> getShujuScQklist(int ccc,String bm,String ywlx){
		return shujuScQkDao.getShujuScQklist(ccc,bm,ywlx);
    }
	public List<ShujuScQkModel>getList(String ywm,String zwm,String ywlx,String sjc,String jgfl,String ywsj ){
		return shujuScQkDao.getList(ywm,zwm,ywlx,sjc,jgfl,ywsj);
	}
	public  List<ShujuScQkModel> getywlist(){
		return shujuScQkDao.getywlist();
	}
	public int getZsl(String bm,String ywlx) {
		return shujuScQkDao.getZsl(bm,ywlx);
	}
	@Override
	public BaseMybatisDao<ShujuScQkModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return shujuScQkDao;
	}

}
