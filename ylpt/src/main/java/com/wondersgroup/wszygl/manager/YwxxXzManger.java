package com.wondersgroup.wszygl.manager;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.model.OptionModel;
import com.wondersgroup.wszygl.dao.YwxxXzDao;
import com.wondersgroup.wszygl.model.SqlModel;
import com.wondersgroup.wszygl.model.XxymZdModel;
import com.wondersgroup.wszygl.model.YwbmModel;
import com.wondersgroup.wszygl.model.ZwbmModel;
@Component
public class YwxxXzManger extends BaseMybatisManager<SqlModel, String>{
	@Autowired 
	public  YwxxXzDao ywxxxzDao;
	public YwbmModel getYwbm(String sl1,String ywbz) {
		return ywxxxzDao.getYwbm(sl1,ywbz);
	};
	public List<OptionModel> getOption(String ywbz,String wdyw,String zddm,String yljgdm) {
		return ywxxxzDao.getOption(ywbz,wdyw,zddm,yljgdm);
	}
	public List<OptionModel> getOptions(String ywbz,String wdyw,String zddm ) {
		return ywxxxzDao.getOptions(ywbz,wdyw,zddm);
	}
	public List<ZwbmModel> getzwbm(String tablename,String ywbz){
		return ywxxxzDao.getzwbm(tablename,ywbz);
	};
	public List<XxymZdModel> getXxymZdList(String wdyw,String ywbz) {
		return ywxxxzDao.getXxymZdList(wdyw,ywbz);
	}
	public int getCount(String kssj,String jssj,String jgdm,
			String sqlnr,String pdtj1,
			String pdtj2,String pdtj3,
			String pdtj4,String pdtj5,
			String pdtj6,String pdtj7,
			String pdtj8,String pdtj9,
			String pdtj10,String mcdm,String id6) {
		return ywxxxzDao.getCount( 
				kssj, jssj, jgdm,
				sqlnr, pdtj1,
				pdtj2, pdtj3,
				pdtj4, pdtj5,
				pdtj6, pdtj7,
				pdtj8, pdtj9,
				pdtj10,mcdm,id6);
		
	}
	public List<HashMap<String, Object>>  getYwxxzs(
			String kssj,String jssj,String jgdm,
			String sqlnr,String pdtj1,
			String pdtj2,String pdtj3,
			String pdtj4,String pdtj5,
			String pdtj6,String pdtj7,
			String pdtj8,String pdtj9,
			String pdtj10,String mcdm,
			int ccc,String id6){
		return ywxxxzDao.getYwxxzs( 
				kssj, jssj, jgdm,
				sqlnr, pdtj1,
				pdtj2, pdtj3,
				pdtj4, pdtj5,
				pdtj6, pdtj7,
				pdtj8, pdtj9,
				pdtj10,mcdm,ccc,id6);
	}
	
	@Override
	public BaseMybatisDao<SqlModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ywxxxzDao;
	}

}
