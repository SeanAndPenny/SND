package com.wondersgroup.wszygl.manager;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YwxxXz2Dao;
import com.wondersgroup.wszygl.model.SqlModel;
@Component
public class YwxxXz2Manger extends BaseMybatisManager<SqlModel, String>{
	@Autowired 
	public  YwxxXz2Dao ywxxxz2Dao;
	public int getCount(String kssj,String jssj,String jgdm,
			String sqlnr,String pdtj1,
			String pdtj2,String pdtj3,
			String pdtj4,String pdtj5,
			String pdtj6,String pdtj7,
			String pdtj8,String pdtj9,
			String pdtj10,String mcdm1,
			String mcdm2,String id6) {
		return ywxxxz2Dao.getCount( 
				kssj, jssj, jgdm,
				sqlnr, pdtj1,
				pdtj2, pdtj3,
				pdtj4, pdtj5,
				pdtj6, pdtj7,
				pdtj8, pdtj9,
				pdtj10,mcdm1,mcdm2,id6);
		
	}
	public List<HashMap<String, Object>>  getYwxxzs(
			String kssj,String jssj,String jgdm,
			String sqlnr,String pdtj1,
			String pdtj2,String pdtj3,
			String pdtj4,String pdtj5,
			String pdtj6,String pdtj7,
			String pdtj8,String pdtj9,
			String pdtj10,String mcdm1,
			String mcdm2, int ccc,String id6){
		return ywxxxz2Dao.getYwxxzs( 
				kssj, jssj, jgdm,
				sqlnr, pdtj1,
				pdtj2, pdtj3,
				pdtj4, pdtj5,
				pdtj6, pdtj7,
				pdtj8, pdtj9,
				pdtj10,mcdm1,
				mcdm2,ccc,id6);
	}
	@Override
	public BaseMybatisDao<SqlModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ywxxxz2Dao;
	}

}
