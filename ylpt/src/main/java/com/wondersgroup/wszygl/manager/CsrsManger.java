package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.CsrsDao;
import com.wondersgroup.wszygl.model.CsrsModel;
import com.wondersgroup.wszygl.model.CsrscxlbModel;
@Component
public class CsrsManger extends BaseMybatisManager<CsrsModel,String>{
	@Autowired
	 private CsrsDao csrsDao;
	public List<CsrsModel>getCsrstj(){
    	return csrsDao.getCsrstj();
    }
	public List<CsrscxlbModel>getCxlb(){
		return csrsDao.getCxlb();
	}
	
	public List<CsrsModel> getCsrsXzjgechartsList(String yylx){
		return csrsDao.getCsrsXzjgechartsList(yylx);
	}
	public List<CsrsModel>  getFmrstj() {
		return csrsDao.getFmrstj();
	}
	
	@Override
	public BaseMybatisDao<CsrsModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return csrsDao;
	}

}
