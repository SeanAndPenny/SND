package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxqGlybfytjDao;
import com.wondersgroup.wszygl.model.YbFytjModel;
@Component
public class GxqGlybfytjManger extends BaseMybatisManager<YbFytjModel,String>{
	@Autowired
	private GxqGlybfytjDao gxqglybfytjdao;

	public List<YbFytjModel> getechar01(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getechar01(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel> getchartCf01(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchartCf01(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel> getchart02(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchart02(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel> chartCf02(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.chartCf02(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel> getchart03(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchart03(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel>getchartCf03(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchartCf03(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel> getchart04(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchart04(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel>getchartCf04(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchartCf04(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel> getchart05(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchart05(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel>getchartCf05(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchartCf05(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel> getchart06(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchart06(kssj,jssj,sjlx,jgdm);
	}
	public List<YbFytjModel>getchartCf06(String kssj,String jssj,String sjlx,String jgdm) {
		return gxqglybfytjdao.getchartCf06(kssj,jssj,sjlx,jgdm);
	}
	
	
	
	public  String getMinSwsj() {
		return gxqglybfytjdao.getMinSwsj();
	}
	public  String getMaxSwsj() {
		return gxqglybfytjdao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<YbFytjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxqglybfytjdao;
	}
}
