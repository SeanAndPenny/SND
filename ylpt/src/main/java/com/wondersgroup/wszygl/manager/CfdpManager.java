package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.CfdpDao;
import com.wondersgroup.wszygl.model.CfModel;
import com.wondersgroup.wszygl.model.Cfdp;
import com.wondersgroup.wszygl.model.CfdpModel;
import com.wondersgroup.wszygl.model.CfdpTjfxModel;
import com.wondersgroup.wszygl.model.HzxxModel;
import com.wondersgroup.wszygl.model.JyjcModel;


@Component
public class CfdpManager extends BaseMybatisManager<CfdpModel, String>{

	@Autowired
	private CfdpDao cfdpDao;

	@Override
	public BaseMybatisDao<CfdpModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return cfdpDao;
	}
	public HzxxModel findXx(String yljgdm,String cfbh){
		return cfdpDao.findXx(yljgdm,cfbh);
	}
	public List<CfModel> findCf(String yljgdm,String cfbh){
		return cfdpDao.findCf(yljgdm, cfbh);
	}
	public void insertCfdp(CfdpModel cfdpmodel) {
		cfdpDao.insertCfdp(cfdpmodel);
	}
	public List<Cfdp> findCfdp(String yljgdm,String cfbh){
		return cfdpDao.findCfdp(yljgdm, cfbh);
	}
	public void updateCfdp(String yljgdm,String cfbh) {
		cfdpDao.updateCfdp(yljgdm, cfbh);
	}
	public void updateCfdp1(String yljgdm,String cfbh) {
		cfdpDao.updateCfdp1(yljgdm, cfbh);
	}
	public JyjcModel findJy(String yljgdm,String jzlsh) {
		return cfdpDao.findJy(yljgdm, jzlsh);
	}
	public List<JyjcModel>findJc(String yljgdm,String sfzh){
		return cfdpDao.findJc(yljgdm, sfzh);
	}
	
	public Cfdp findCfdpnr(String id) {
		return cfdpDao.findCfdpnr(id);
	}
	public void updateCfdpnr(Cfdp cfdp) {
		cfdpDao.updateCfdpnr(cfdp);
	}
	public void deleteCfdp(String id) {
		cfdpDao.deleteCfdp(id);
	}
	public List <CfdpTjfxModel> findTjfx(){
		return cfdpDao.findTjfx();
	}
}
