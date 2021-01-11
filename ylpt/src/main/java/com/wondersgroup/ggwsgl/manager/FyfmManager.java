package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.FyfmDao;
import com.wondersgroup.ggwsgl.model.FyfmModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;


@Component
public class FyfmManager extends BaseMybatisManager<FyfmModel, String>{
		@Autowired
		private FyfmDao fyfmDao;

		@Override
		public BaseMybatisDao<FyfmModel, String> getBaseDao() {
			return fyfmDao;
		}
		public List<YljgModel> getAllYljg(){
			return fyfmDao.getAllYljg();
		}
		public List<TbModel>getAllTb(String yljgdm,String startdate,String enddate,String sfzh){
			return fyfmDao.getAllTb(yljgdm, startdate, enddate,sfzh);
		}
		
}
