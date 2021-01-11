package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
 
import com.wondersgroup.wszygl.dao.YqjgzsDao;
import com.wondersgroup.wszygl.model.JcModel;
import com.wondersgroup.wszygl.model.JyModel;
import com.wondersgroup.wszygl.model.RyzxtModel;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;


@Component
public class YqjgzsManger extends BaseMybatisManager<YqjgzsDaoModel, String> {
	@Autowired
	private YqjgzsDao yqjgzsDao;
	//职称柱形图
	public List<RyzxtModel> getRyxx(){
		return yqjgzsDao.getRyxx();
	}
	//外送检验样本量
	public List<JyModel>getJy(){
		return yqjgzsDao.getJy();
	}
	//影像诊断量
	public List<JcModel>getJc(){
		return yqjgzsDao.getJc();
	}
	public String getStartdate() {
		return yqjgzsDao.getStartdate();
	}
	//学历柱形图
	public List<RyzxtModel> getRyxl(){
		return yqjgzsDao.getRyxl();
	}
	//基层医院
	public List<YqjgzsDaoModel> getAllTb(String startdate, String enddate){
		return yqjgzsDao.getAllTb(startdate,enddate);
	}
	public List<YqjgzsDaoModel> getAllTb2(String startdate, String enddate) {
		return yqjgzsDao.getAllTb2(startdate, enddate);
	};
	//基层医院统计
	public YqjgzsDaoModel getBlList(){
		return yqjgzsDao.getBlList();
	}
	//综合医院
	public List<YqjgzsDaoModel> getAllTbZhyy(String startdate, String enddate){
		return yqjgzsDao.getAllTbZhyy(startdate,enddate);
	}
	public List<YqjgzsDaoModel> getAllTbZhyy2(String startdate, String enddate) {
		return yqjgzsDao.getAllTbZhyy2(startdate, enddate);
	};
	//综合医院统计
		public YqjgzsDaoModel getZhyyBlList(){
			return yqjgzsDao.getZhyyBlList();
		}
	 public String getname(String ssoUsername) {
		 return yqjgzsDao.getname(ssoUsername);
	 }
	@Override
	public BaseMybatisDao<YqjgzsDaoModel, String> getBaseDao() {
		
		return yqjgzsDao;
	}

}
