package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YbfytjDao;
import com.wondersgroup.wszygl.model.YbFytjModel;
@Component
public class YbfytjManger extends BaseMybatisManager<YbFytjModel,String>{
	@Autowired
	private YbfytjDao ybfytjDao;
	
	public List<YbFytjModel> getybfytj(String kssj,String jssj,String jgdm,String sjlx) {
		return ybfytjDao.getybfytj(kssj,jssj,jgdm,sjlx);
	}
	
	
	public List<YbFytjModel> getechars02(String kssj,String jssj,String jgdm,String sjlx,String qylx) {
		return ybfytjDao.getechars02(kssj,jssj,jgdm,sjlx,qylx);
	}
	public List<YbFytjModel> getechars03(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jgjb) {
		return ybfytjDao.getechars03(kssj,jssj,jgdm,sjlx,qylx,jglx,jgjb);
	}
	public List<YbFytjModel> getecharsjb(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx) {
		return ybfytjDao.getecharsjb(kssj,jssj,jgdm,sjlx,qylx,jglx);
	}
	
	public List<YbFytjModel> getecharsList(String kssj,String jssj,String jgdm,String sjlx,String qylx,String jglx,String jgjb) {
		return ybfytjDao.getecharsList(kssj,jssj,jgdm,sjlx,qylx,jglx,jgjb);
	}
	
	public  String getMinSwsj() {
		return ybfytjDao.getMinSwsj();
	}
	public  String getMaxSwsj() {
		return ybfytjDao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<YbFytjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ybfytjDao;
	}
	
}
