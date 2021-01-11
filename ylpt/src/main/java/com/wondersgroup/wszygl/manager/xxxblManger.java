package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.xxxblDao;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.xxxblModel;

@Component
public class xxxblManger  extends BaseMybatisManager<xxxblModel,String>{
	 @Autowired
	  private xxxblDao xxxbldao;
	 
	 public  List <xxxblModel>   getxxxBllist(String kssj,String jssj,String jgdm){
			return xxxbldao.getxxxBllist(kssj,jssj,jgdm);
		}
	 public  List <xxxblModel>   getrkbllist(String kssj,String jssj,String jgdm){
			return xxxbldao.getrkbllist(kssj,jssj,jgdm);
		}
	 
	 public  List <xxxblModel>   getnlbllist(String kssj,String jssj,String jgdm){
			return xxxbldao.getnlbllist(kssj,jssj,jgdm);
		}
	 public  List <xxxblModel>   getnllist(String kssj,String jssj,String jgdm){
			return xxxbldao.getnllist(kssj,jssj,jgdm);
		}
	 public   List<YljgMcModel>  getJdlist(String jgdm){
			return xxxbldao.getJdlist(jgdm);
		}
	 
	 public String hjrkzsl(String kssj, String jssj, String jgdm) {
		 return xxxbldao.hjrkzsl(kssj,jssj,jgdm);
	 }
	 public String getldzsl(String kssj, String jssj, String jgdm) {
		 return xxxbldao.getldzsl(kssj,jssj,jgdm);
	 } 
	 
	 public  List <xxxblModel>   getHjechats(String kssj,String jssj,String jgdm,String nldbm1,String nldbm2){
			return xxxbldao.getHjechats(kssj,jssj,jgdm,nldbm1,nldbm2);
		}
	 public  List <xxxblModel>   getLdechats(String kssj,String jssj,String jgdm,String nldbm1,String nldbm2){
			return xxxbldao.getLdechats(kssj,jssj,jgdm,nldbm1,nldbm2);
		}
	 public  List <xxxblModel>   getZrkechats(String kssj,String jssj,String jgdm,String nldbm1,String nldbm2){
			return xxxbldao.getZrkechats(kssj,jssj,jgdm,nldbm1,nldbm2);
		}
	 
	 
	 
	 
	 
	
	 
	@Override
	public BaseMybatisDao<xxxblModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return xxxbldao;
	}

}
