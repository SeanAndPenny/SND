package com.wondersgroup.ylfwgl.model;


import java.util.Date;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 心电数据
 * */
@SuppressWarnings("serial")
public class XdsjModel implements BaseEntity {
	private String yljgdm;//医疗机构代码
	private String jcjllsh;//检查记录流水号
	private String mzzyb;//门诊/住院标志
	private String zyjzlsh;//住院就诊流水号
	private String mzjzlsh;//门诊就诊流水号
	private String hzxm;//患者姓名
	private String kh;//卡号
	private String klx;//卡类型
	private String xbdm;//性别代码
	private String patientid;//影像号
	private String nls;//年龄（岁)
	private String nly;//年龄（月）
	private String dhhm	;//电话号码
	private String ksmc;//科室名称
	private String ksbm;//科室编码
	private String bqmc;//病区名称
	private String bfh;//病房号
	private String bch;//病床号
	private String dzsqdbh;//电子申请单编号
	private String jcsqjgmc;//检查申请机构名称
	private String jcsqks;//检查申请科室
	private String sqrgh;//申请人编号
	private String sqrxm;//申请人姓名
	private String zs;//主诉
	private Date zzksrqsj	;//症状开始日期时间
	private Date zztzrqsj;//症状停止日期时间
	private String zzms;//症状描述
	private String tsjcbz;//特殊检查标志
	private String czbm;//操作编码
	private String czmc;//操作名称
	private String czbwdm;//操作部位代码
	private String jrwmc;//介入物名称
	private String czffms;//操作方法描述
	private String czcs;//操作次数
	private Date czrqsj;//操作日期时间
	private String mzffdm;//	麻醉方法代码
	private String mzgcjg;//麻醉观察结果
	private String mzzxybsdm;//麻醉中西医标识代码
	private String mzysqm;//麻醉医师签名
	private String mzysgh;//麻醉医师工号
	private String zlgcms;//诊疗过程描述
	private String bblb;//标本类别
	private String jcbbh;//检査标本号
	private String bbzt;//标本状态
	private String bbgdymc;//标本固定液名称
	private String bbcyrqsj;//标本采样日期时间
	private String jsbbrqsj;//接收标本日期时间
	private String jcffmc;//检査方法名称
	private String jclb;//检查类别
	private String jctcdm;//检查套餐代码
	private String jcxmdm;//检查项目代码
	private String jcbw;//检查部位
	private String bwacr;//检查部位acr编码
	private String jcmc;//检查名称
	private String jcjgdm;//检查结果代码
	private String jcdljg;//检查定量结果
	private String jcdljgjldw;//检查定量结果计量单位
	private String jcjsqm;//检査技师签名
	private String jcjsgh;//检査技师工号
	private String jcysqm;//检查医师签名
	private String jcysgh;//检查医师工号
	private String kdsj;//开单时间
	private String jcrq;//检查日期
	private String sbbm;//检查设备仪器型号
	private String yqbm;//检查仪器号
	private String jcbgdbh;//检查报告单编号
	private String jcbgjgmc;//检査报告机构名称
	private String jcbgks;//检査报告科室
	private String jcbgjgkgsj;//检查报告结果-客观所见
	private String jcbgjgzgts;//检查报告结果-主观提示
	private String jcbgbz;//检查报告备注
	private String jcbgrq;//检查报告日期
	private String bgysqm;//报告医师签名
	private String bgysgh;//报告医师工号
	private String shysqm;//审核医师签名
	private String shysgh;//审核医师工号
	private String sfyyy;//是否有影像
	private String sfyzdmx;//是否有诊断明细
	private String xgbz;//修改标志
	private String gxsj;//			更新时间
	private String war_flag;	
	private String  war_note;		
	private String jlgxsj;
	private String posid;		
	private String llbz;	
	private String chk_flag;
	private String sed_bz;		
	private String jlscrq;;	
	private String sfzh	;			
	private String hzbs;
	private String sj;
	
	private String jgdm;//机构代码
	private String jgmc;//机构代码
	private String ssqxdm;//所属区县代码
	private String jglx;//"机构类型1 医疗机构2 社区3 疾控4 卫监5 血站6 妇幼"
	private String fjgdm;//父机构代码
	private String jc;//机构简称
	private String jgms;//机构描述
	private String jgjb;//"机构级别1 一级医疗机构2 二级医疗机构3 三级医疗机构。"
	private String bz;//备注说明
	private String used;//"启用标志0：未启用1：已启用"
	private String ssqxmc;//所属区县名称
	private String jd;//经度
	private String wd;//纬度
	private String drnd;//导入年度
	private String ssjd;//所属街道
	private String ordernum;//顺序
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getJcjllsh() {
		return jcjllsh;
	}
	public void setJcjllsh(String jcjllsh) {
		this.jcjllsh = jcjllsh;
	}
	public String getMzzyb() {
		return mzzyb;
	}
	public void setMzzyb(String mzzyb) {
		this.mzzyb = mzzyb;
	}
	public String getZyjzlsh() {
		return zyjzlsh;
	}
	public void setZyjzlsh(String zyjzlsh) {
		this.zyjzlsh = zyjzlsh;
	}
	public String getMzjzlsh() {
		return mzjzlsh;
	}
	public void setMzjzlsh(String mzjzlsh) {
		this.mzjzlsh = mzjzlsh;
	}
	public String getHzxm() {
		return hzxm;
	}
	public void setHzxm(String hzxm) {
		this.hzxm = hzxm;
	}
	public String getKh() {
		return kh;
	}
	public void setKh(String kh) {
		this.kh = kh;
	}
	public String getKlx() {
		return klx;
	}
	public void setKlx(String klx) {
		this.klx = klx;
	}
	public String getXbdm() {
		return xbdm;
	}
	public void setXbdm(String xbdm) {
		this.xbdm = xbdm;
	}
	public String getPatientid() {
		return patientid;
	}
	public void setPatientid(String patientid) {
		this.patientid = patientid;
	}
	public String getNls() {
		return nls;
	}
	public void setNls(String nls) {
		this.nls = nls;
	}
	public String getNly() {
		return nly;
	}
	public void setNly(String nly) {
		this.nly = nly;
	}
	public String getDhhm() {
		return dhhm;
	}
	public void setDhhm(String dhhm) {
		this.dhhm = dhhm;
	}
	public String getKsmc() {
		return ksmc;
	}
	public void setKsmc(String ksmc) {
		this.ksmc = ksmc;
	}
	public String getKsbm() {
		return ksbm;
	}
	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}
	public String getBqmc() {
		return bqmc;
	}
	public void setBqmc(String bqmc) {
		this.bqmc = bqmc;
	}
	public String getBfh() {
		return bfh;
	}
	public void setBfh(String bfh) {
		this.bfh = bfh;
	}
	public String getBch() {
		return bch;
	}
	public void setBch(String bch) {
		this.bch = bch;
	}
	public String getDzsqdbh() {
		return dzsqdbh;
	}
	public void setDzsqdbh(String dzsqdbh) {
		this.dzsqdbh = dzsqdbh;
	}
	public String getJcsqjgmc() {
		return jcsqjgmc;
	}
	public void setJcsqjgmc(String jcsqjgmc) {
		this.jcsqjgmc = jcsqjgmc;
	}
	public String getJcsqks() {
		return jcsqks;
	}
	public void setJcsqks(String jcsqks) {
		this.jcsqks = jcsqks;
	}
	public String getSqrgh() {
		return sqrgh;
	}
	public void setSqrgh(String sqrgh) {
		this.sqrgh = sqrgh;
	}
	public String getSqrxm() {
		return sqrxm;
	}
	public void setSqrxm(String sqrxm) {
		this.sqrxm = sqrxm;
	}
	public String getZs() {
		return zs;
	}
	public void setZs(String zs) {
		this.zs = zs;
	}
	public Date getZzksrqsj() {
		return zzksrqsj;
	}
	public void setZzksrqsj(Date zzksrqsj) {
		this.zzksrqsj = zzksrqsj;
	}
	public Date getZztzrqsj() {
		return zztzrqsj;
	}
	public void setZztzrqsj(Date zztzrqsj) {
		this.zztzrqsj = zztzrqsj;
	}
	public String getZzms() {
		return zzms;
	}
	public void setZzms(String zzms) {
		this.zzms = zzms;
	}
	public String getTsjcbz() {
		return tsjcbz;
	}
	public void setTsjcbz(String tsjcbz) {
		this.tsjcbz = tsjcbz;
	}
	public String getCzbm() {
		return czbm;
	}
	public void setCzbm(String czbm) {
		this.czbm = czbm;
	}
	public String getCzmc() {
		return czmc;
	}
	public void setCzmc(String czmc) {
		this.czmc = czmc;
	}
	public String getCzbwdm() {
		return czbwdm;
	}
	public void setCzbwdm(String czbwdm) {
		this.czbwdm = czbwdm;
	}
	public String getJrwmc() {
		return jrwmc;
	}
	public void setJrwmc(String jrwmc) {
		this.jrwmc = jrwmc;
	}
	public String getCzffms() {
		return czffms;
	}
	public void setCzffms(String czffms) {
		this.czffms = czffms;
	}
	public String getCzcs() {
		return czcs;
	}
	public void setCzcs(String czcs) {
		this.czcs = czcs;
	}
	public Date getCzrqsj() {
		return czrqsj;
	}
	public void setCzrqsj(Date czrqsj) {
		this.czrqsj = czrqsj;
	}
	public String getMzffdm() {
		return mzffdm;
	}
	public void setMzffdm(String mzffdm) {
		this.mzffdm = mzffdm;
	}
	public String getMzgcjg() {
		return mzgcjg;
	}
	public void setMzgcjg(String mzgcjg) {
		this.mzgcjg = mzgcjg;
	}
	public String getMzzxybsdm() {
		return mzzxybsdm;
	}
	public void setMzzxybsdm(String mzzxybsdm) {
		this.mzzxybsdm = mzzxybsdm;
	}
	public String getMzysqm() {
		return mzysqm;
	}
	public void setMzysqm(String mzysqm) {
		this.mzysqm = mzysqm;
	}
	public String getMzysgh() {
		return mzysgh;
	}
	public void setMzysgh(String mzysgh) {
		this.mzysgh = mzysgh;
	}
	public String getZlgcms() {
		return zlgcms;
	}
	public void setZlgcms(String zlgcms) {
		this.zlgcms = zlgcms;
	}
	public String getBblb() {
		return bblb;
	}
	public void setBblb(String bblb) {
		this.bblb = bblb;
	}
	public String getJcbbh() {
		return jcbbh;
	}
	public void setJcbbh(String jcbbh) {
		this.jcbbh = jcbbh;
	}
	public String getBbzt() {
		return bbzt;
	}
	public void setBbzt(String bbzt) {
		this.bbzt = bbzt;
	}
	public String getBbgdymc() {
		return bbgdymc;
	}
	public void setBbgdymc(String bbgdymc) {
		this.bbgdymc = bbgdymc;
	}
	public String getBbcyrqsj() {
		return bbcyrqsj;
	}
	public void setBbcyrqsj(String bbcyrqsj) {
		this.bbcyrqsj = bbcyrqsj;
	}
	public String getJsbbrqsj() {
		return jsbbrqsj;
	}
	public void setJsbbrqsj(String jsbbrqsj) {
		this.jsbbrqsj = jsbbrqsj;
	}
	public String getJcffmc() {
		return jcffmc;
	}
	public void setJcffmc(String jcffmc) {
		this.jcffmc = jcffmc;
	}
	public String getJclb() {
		return jclb;
	}
	public void setJclb(String jclb) {
		this.jclb = jclb;
	}
	public String getJctcdm() {
		return jctcdm;
	}
	public void setJctcdm(String jctcdm) {
		this.jctcdm = jctcdm;
	}
	public String getJcxmdm() {
		return jcxmdm;
	}
	public void setJcxmdm(String jcxmdm) {
		this.jcxmdm = jcxmdm;
	}
	public String getJcbw() {
		return jcbw;
	}
	public void setJcbw(String jcbw) {
		this.jcbw = jcbw;
	}
	public String getBwacr() {
		return bwacr;
	}
	public void setBwacr(String bwacr) {
		this.bwacr = bwacr;
	}
	public String getJcmc() {
		return jcmc;
	}
	public void setJcmc(String jcmc) {
		this.jcmc = jcmc;
	}
	public String getJcjgdm() {
		return jcjgdm;
	}
	public void setJcjgdm(String jcjgdm) {
		this.jcjgdm = jcjgdm;
	}
	public String getJcdljg() {
		return jcdljg;
	}
	public void setJcdljg(String jcdljg) {
		this.jcdljg = jcdljg;
	}
	public String getJcdljgjldw() {
		return jcdljgjldw;
	}
	public void setJcdljgjldw(String jcdljgjldw) {
		this.jcdljgjldw = jcdljgjldw;
	}
	public String getJcjsqm() {
		return jcjsqm;
	}
	public void setJcjsqm(String jcjsqm) {
		this.jcjsqm = jcjsqm;
	}
	public String getJcjsgh() {
		return jcjsgh;
	}
	public void setJcjsgh(String jcjsgh) {
		this.jcjsgh = jcjsgh;
	}
	public String getJcysqm() {
		return jcysqm;
	}
	public void setJcysqm(String jcysqm) {
		this.jcysqm = jcysqm;
	}
	public String getJcysgh() {
		return jcysgh;
	}
	public void setJcysgh(String jcysgh) {
		this.jcysgh = jcysgh;
	}
	public String getKdsj() {
		return kdsj;
	}
	public void setKdsj(String kdsj) {
		this.kdsj = kdsj;
	}
	public String getJcrq() {
		return jcrq;
	}
	public void setJcrq(String jcrq) {
		this.jcrq = jcrq;
	}
	public String getSbbm() {
		return sbbm;
	}
	public void setSbbm(String sbbm) {
		this.sbbm = sbbm;
	}
	public String getYqbm() {
		return yqbm;
	}
	public void setYqbm(String yqbm) {
		this.yqbm = yqbm;
	}
	public String getJcbgdbh() {
		return jcbgdbh;
	}
	public void setJcbgdbh(String jcbgdbh) {
		this.jcbgdbh = jcbgdbh;
	}
	public String getJcbgjgmc() {
		return jcbgjgmc;
	}
	public void setJcbgjgmc(String jcbgjgmc) {
		this.jcbgjgmc = jcbgjgmc;
	}
	public String getJcbgks() {
		return jcbgks;
	}
	public void setJcbgks(String jcbgks) {
		this.jcbgks = jcbgks;
	}
	public String getJcbgjgkgsj() {
		return jcbgjgkgsj;
	}
	public void setJcbgjgkgsj(String jcbgjgkgsj) {
		this.jcbgjgkgsj = jcbgjgkgsj;
	}
	public String getJcbgjgzgts() {
		return jcbgjgzgts;
	}
	public void setJcbgjgzgts(String jcbgjgzgts) {
		this.jcbgjgzgts = jcbgjgzgts;
	}
	public String getJcbgbz() {
		return jcbgbz;
	}
	public void setJcbgbz(String jcbgbz) {
		this.jcbgbz = jcbgbz;
	}
	public String getJcbgrq() {
		return jcbgrq;
	}
	public void setJcbgrq(String jcbgrq) {
		this.jcbgrq = jcbgrq;
	}
	public String getBgysqm() {
		return bgysqm;
	}
	public void setBgysqm(String bgysqm) {
		this.bgysqm = bgysqm;
	}
	public String getBgysgh() {
		return bgysgh;
	}
	public void setBgysgh(String bgysgh) {
		this.bgysgh = bgysgh;
	}
	public String getShysqm() {
		return shysqm;
	}
	public void setShysqm(String shysqm) {
		this.shysqm = shysqm;
	}
	public String getShysgh() {
		return shysgh;
	}
	public void setShysgh(String shysgh) {
		this.shysgh = shysgh;
	}
	public String getSfyyy() {
		return sfyyy;
	}
	public void setSfyyy(String sfyyy) {
		this.sfyyy = sfyyy;
	}
	public String getSfyzdmx() {
		return sfyzdmx;
	}
	public void setSfyzdmx(String sfyzdmx) {
		this.sfyzdmx = sfyzdmx;
	}
	public String getXgbz() {
		return xgbz;
	}
	public void setXgbz(String xgbz) {
		this.xgbz = xgbz;
	}
	public String getGxsj() {
		return gxsj;
	}
	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}
	public String getWar_flag() {
		return war_flag;
	}
	public void setWar_flag(String war_flag) {
		this.war_flag = war_flag;
	}
	public String getWar_note() {
		return war_note;
	}
	public void setWar_note(String war_note) {
		this.war_note = war_note;
	}
	public String getJlgxsj() {
		return jlgxsj;
	}
	public void setJlgxsj(String jlgxsj) {
		this.jlgxsj = jlgxsj;
	}
	public String getPosid() {
		return posid;
	}
	public void setPosid(String posid) {
		this.posid = posid;
	}
	public String getLlbz() {
		return llbz;
	}
	public void setLlbz(String llbz) {
		this.llbz = llbz;
	}
	public String getChk_flag() {
		return chk_flag;
	}
	public void setChk_flag(String chk_flag) {
		this.chk_flag = chk_flag;
	}
	public String getSed_bz() {
		return sed_bz;
	}
	public void setSed_bz(String sed_bz) {
		this.sed_bz = sed_bz;
	}
	public String getJlscrq() {
		return jlscrq;
	}
	public void setJlscrq(String jlscrq) {
		this.jlscrq = jlscrq;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getHzbs() {
		return hzbs;
	}
	public void setHzbs(String hzbs) {
		this.hzbs = hzbs;
	}
	public String getJgdm() {
		return jgdm;
	}
	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}
	public String getJgmc() {
		return jgmc;
	}
	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}
	public String getSsqxdm() {
		return ssqxdm;
	}
	public void setSsqxdm(String ssqxdm) {
		this.ssqxdm = ssqxdm;
	}
	public String getJglx() {
		return jglx;
	}
	public void setJglx(String jglx) {
		this.jglx = jglx;
	}
	public String getFjgdm() {
		return fjgdm;
	}
	public void setFjgdm(String fjgdm) {
		this.fjgdm = fjgdm;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getJgms() {
		return jgms;
	}
	public void setJgms(String jgms) {
		this.jgms = jgms;
	}
	public String getJgjb() {
		return jgjb;
	}
	public void setJgjb(String jgjb) {
		this.jgjb = jgjb;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public String getSsqxmc() {
		return ssqxmc;
	}
	public void setSsqxmc(String ssqxmc) {
		this.ssqxmc = ssqxmc;
	}
	public String getJd() {
		return jd;
	}
	public void setJd(String jd) {
		this.jd = jd;
	}
	public String getWd() {
		return wd;
	}
	public void setWd(String wd) {
		this.wd = wd;
	}
	public String getDrnd() {
		return drnd;
	}
	public void setDrnd(String drnd) {
		this.drnd = drnd;
	}
	public String getSsjd() {
		return ssjd;
	}
	public void setSsjd(String ssjd) {
		this.ssjd = ssjd;
	}
	public String getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}

	
	

}