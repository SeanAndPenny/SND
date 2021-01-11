package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxqYbFytjDao;
import com.wondersgroup.wszygl.model.YbFytjModel;
import com.wondersgroup.wszygl.model.YljgModel;
@Component
public class GxqYbFytjManger extends BaseMybatisManager<YbFytjModel,String>{
	@Autowired
	private GxqYbFytjDao  gxqybfytjDao;

	public List<YbFytjModel> getechar01(String kssj,String jssj,String jgdm,String sjlx) {
		return gxqybfytjDao.getechar01(kssj,jssj,jgdm,sjlx);
	}
	public List<YbFytjModel> getechar02(String kssj,String jssj,String jgdm,String sjlx) {
		return gxqybfytjDao.getechar02(kssj,jssj,jgdm,sjlx);
	}
	public List<YbFytjModel> getechar03(String kssj,String jssj,String jgdm,String sjlx,String qylx) {
		return gxqybfytjDao.getechar03(kssj,jssj,jgdm,sjlx,qylx);
	}
	public List<YbFytjModel> getechar04(String kssj,String jssj,String jgdm,String sjlx,String qylx) {
		return gxqybfytjDao.getechar04(kssj,jssj,jgdm,sjlx,qylx);
	}
	public List<YbFytjModel> getechar05(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx) {
		return gxqybfytjDao.getechar05(kssj,jssj,jgdm,sjlx,qylx,jglx);
	}
	public List<YbFytjModel> getechar06(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx) {
		return gxqybfytjDao.getechar06(kssj,jssj,jgdm,sjlx,qylx,jglx);
	}
	public List<YbFytjModel> getechar07(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar07(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YbFytjModel> getechar08(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar08(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YbFytjModel> getechar09(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar09(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YbFytjModel> getechar10(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar10(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YbFytjModel> getechar11(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar11(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YbFytjModel> getechar12(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar12(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YbFytjModel> getechar13(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar13(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YbFytjModel> getechar14(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jbdm) {
		return gxqybfytjDao.getechar14(kssj,jssj,jgdm,sjlx,qylx,jglx,jbdm);
	}
	public List<YljgModel>getYljgModel(String jgdm) {
		return gxqybfytjDao.getYljgModel(jgdm);
	}
	
	public  String getMinSwsj() {
		return gxqybfytjDao.getMinSwsj();
	}
	public  String getMaxSwsj() {
		return gxqybfytjDao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<YbFytjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxqybfytjDao;
	}
}
