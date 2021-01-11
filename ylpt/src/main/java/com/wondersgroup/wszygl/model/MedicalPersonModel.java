package com.wondersgroup.wszygl.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 人力资源管理(cen_core_v20.T_JSQY_UPLOADTO)
 * */
@SuppressWarnings("serial")
public class MedicalPersonModel implements BaseEntity {
	private String name;
	private String id;//		
	private String uploadstatus;//		数据上传状态(0未上报1已上报)
	private String uploaddate;//			上传确认时间
	private String uploadperson;//			上传确认人
	private String removed;//			
	private String jbxx_index;//		基本信息模块是否合格
	private String gzxx_index;//		工作信息模块是否合格
	private String zyxx_index;//		执业信息模块是否合格
	private String jyjl_index;//		教育信息模块是否合格
	private String createddate;//			
	private String updateddate;//			
	private String hospitalid	;//			所属机构id
	private String hospitalname;//			所属机构名称
	private String unitname;//			姓名
	private String gender;//		性别
	private String idcardtype;//		证件类型
	private String idcard	;//			证件号码
	private String folk;//			民族
	private String joinworkdate;//			参加工作日期
	private String sectionid	;//			所在科室id
	private String sectionname	;//			所在科室名称
	private String praclevel;//从事专业类别代码
	private String telqualification;//			专业技术资格评
	private String organizationcode;//		编制情况
	private String corpcardcode	;//			d_医师/卫生监督员执业证书编码(卫监：许可证号)
	private String applypratype;//		d_医师执业类别代码  (1临床 2口腔 3公共卫生 4中医)
	private String gmprange	;//			d_医师执业范围代码多选（卫监：字符串数据）
	private String worklife;//			全科医生取得培训合格证书情况
	private String edu;//		学历
	private String major;//			所学专业
	private String areacode;//		行政区划
	private String sub_section	;//			其他科室补述
	private String medicaltype;//人员类型
	private String birthdate;//			出生日期
	private String phone	;//			手机号码
	private String administrationcode;//		行政/业务管理职务代码 
	private String edudegree;//		学位代码
	private String specialty	;//			专科特长
	private String flowcode;//		年内人员流动情况
	private String flowtime;//			调入/调出时间
	private String isfromhealthcenter;//是否由乡镇卫生院或社区卫生服务机构派驻村卫生室工作
	private String contel	;//			办公室电话号码
	private String ismultisite;//d_是否注册为多地点执业医师 (y是 n否)
	private String applypratype2;//		d_第2执业单位类别代码 (1医院 2乡镇卫生院 3社区卫生服务中心/站 9其他医疗机构)
	private String applypratype3;//		d_第3执业单位类别代码 (1医院 2乡镇卫生院 3社区卫生服务中心/站 9其他医疗机构)
	private String technicaltitle	;//			专业技术职务聘代码  (1正高 2副高 3中级 4师级/助理 5士级 9待聘)
	private String workyears;//			c_从事乡村医生工作年限
	private String istraining;//		c_高中及以下学历乡村医生是否为在职培训合格者
	private String cd_quacardcode	;//			c_乡村医生执业证书编号
	private String nursequacardcode	;//			n_护士执业证书编码
	private String update_id	;//			
	private String update_date;//			
	private String create_id	;//			
	private String create_date;//			
	private String sourcetype	;//			数据来源
	private String nation	;//			国籍
	private String tjxxh;//			是否从事统计信息化业务工作:1是2否
	private String tjxxhcontent;//		从事统计信息化业务工作内容
	private String pxzs;//			是否获得国家住院医师规范化培训合格证书:1是2否
	private String zsbm;//国家住院医师规范化培训合格证书编码
	private String qkyx;//			是否注册为全科医学专业:1是2否
	private String politicallandscape;//"政治面貌 （01	中共党员 02	中共预备党员 03	共青团员 04	民革会员 05	民盟盟员 06	民建会员 07	民进会员 08	农工党党员 09	致公党党员 10	九三学社社员 11	台盟盟员 12	无党派人士 13	群众 ）"
	private String joinpartydate;//			参加党派时间
	private String telqualificationtime;//			专业技术资格评定时间
	private String nativeplace;//			籍贯
	private String num;
	private String xqzt;
	private String yljgmc;
	
	public String getYljgmc() {
		return yljgmc;
	}
	public void setYljgmc(String yljgmc) {
		this.yljgmc = yljgmc;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUploadstatus() {
		return uploadstatus;
	}
	public void setUploadstatus(String uploadstatus) {
		this.uploadstatus = uploadstatus;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getUploadperson() {
		return uploadperson;
	}
	public void setUploadperson(String uploadperson) {
		this.uploadperson = uploadperson;
	}
	public String getRemoved() {
		return removed;
	}
	public void setRemoved(String removed) {
		this.removed = removed;
	}
	public String getJbxx_index() {
		return jbxx_index;
	}
	public void setJbxx_index(String jbxx_index) {
		this.jbxx_index = jbxx_index;
	}
	public String getGzxx_index() {
		return gzxx_index;
	}
	public void setGzxx_index(String gzxx_index) {
		this.gzxx_index = gzxx_index;
	}
	public String getZyxx_index() {
		return zyxx_index;
	}
	public void setZyxx_index(String zyxx_index) {
		this.zyxx_index = zyxx_index;
	}
	public String getJyjl_index() {
		return jyjl_index;
	}
	public void setJyjl_index(String jyjl_index) {
		this.jyjl_index = jyjl_index;
	}
	public String getCreateddate() {
		return createddate;
	}
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	public String getUpdateddate() {
		return updateddate;
	}
	public void setUpdateddate(String updateddate) {
		this.updateddate = updateddate;
	}
	public String getHospitalid() {
		return hospitalid;
	}
	public void setHospitalid(String hospitalid) {
		this.hospitalid = hospitalid;
	}
	public String getHospitalname() {
		return hospitalname;
	}
	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIdcardtype() {
		return idcardtype;
	}
	public void setIdcardtype(String idcardtype) {
		this.idcardtype = idcardtype;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getFolk() {
		return folk;
	}
	public void setFolk(String folk) {
		this.folk = folk;
	}
	public String getJoinworkdate() {
		return joinworkdate;
	}
	public void setJoinworkdate(String joinworkdate) {
		this.joinworkdate = joinworkdate;
	}
	public String getSectionid() {
		return sectionid;
	}
	public void setSectionid(String sectionid) {
		this.sectionid = sectionid;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}
	public String getPraclevel() {
		return praclevel;
	}
	public void setPraclevel(String praclevel) {
		this.praclevel = praclevel;
	}
	public String getTelqualification() {
		return telqualification;
	}
	public void setTelqualification(String telqualification) {
		this.telqualification = telqualification;
	}
	public String getOrganizationcode() {
		return organizationcode;
	}
	public void setOrganizationcode(String organizationcode) {
		this.organizationcode = organizationcode;
	}
	public String getCorpcardcode() {
		return corpcardcode;
	}
	public void setCorpcardcode(String corpcardcode) {
		this.corpcardcode = corpcardcode;
	}
	public String getApplypratype() {
		return applypratype;
	}
	public void setApplypratype(String applypratype) {
		this.applypratype = applypratype;
	}
	public String getGmprange() {
		return gmprange;
	}
	public void setGmprange(String gmprange) {
		this.gmprange = gmprange;
	}
	public String getWorklife() {
		return worklife;
	}
	public void setWorklife(String worklife) {
		this.worklife = worklife;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getAreacode() {
		return areacode;
	}
	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}
	public String getSub_section() {
		return sub_section;
	}
	public void setSub_section(String sub_section) {
		this.sub_section = sub_section;
	}
	public String getMedicaltype() {
		return medicaltype;
	}
	public void setMedicaltype(String medicaltype) {
		this.medicaltype = medicaltype;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdministrationcode() {
		return administrationcode;
	}
	public void setAdministrationcode(String administrationcode) {
		this.administrationcode = administrationcode;
	}
	public String getEdudegree() {
		return edudegree;
	}
	public void setEdudegree(String edudegree) {
		this.edudegree = edudegree;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getFlowcode() {
		return flowcode;
	}
	public void setFlowcode(String flowcode) {
		this.flowcode = flowcode;
	}
	public String getFlowtime() {
		return flowtime;
	}
	public void setFlowtime(String flowtime) {
		this.flowtime = flowtime;
	}
	public String getIsfromhealthcenter() {
		return isfromhealthcenter;
	}
	public void setIsfromhealthcenter(String isfromhealthcenter) {
		this.isfromhealthcenter = isfromhealthcenter;
	}
	public String getContel() {
		return contel;
	}
	public void setContel(String contel) {
		this.contel = contel;
	}
	public String getIsmultisite() {
		return ismultisite;
	}
	public void setIsmultisite(String ismultisite) {
		this.ismultisite = ismultisite;
	}
	public String getApplypratype2() {
		return applypratype2;
	}
	public void setApplypratype2(String applypratype2) {
		this.applypratype2 = applypratype2;
	}
	public String getApplypratype3() {
		return applypratype3;
	}
	public void setApplypratype3(String applypratype3) {
		this.applypratype3 = applypratype3;
	}
	public String getTechnicaltitle() {
		return technicaltitle;
	}
	public void setTechnicaltitle(String technicaltitle) {
		this.technicaltitle = technicaltitle;
	}
	public String getWorkyears() {
		return workyears;
	}
	public void setWorkyears(String workyears) {
		this.workyears = workyears;
	}
	public String getIstraining() {
		return istraining;
	}
	public void setIstraining(String istraining) {
		this.istraining = istraining;
	}
	public String getCd_quacardcode() {
		return cd_quacardcode;
	}
	public void setCd_quacardcode(String cd_quacardcode) {
		this.cd_quacardcode = cd_quacardcode;
	}
	public String getNursequacardcode() {
		return nursequacardcode;
	}
	public void setNursequacardcode(String nursequacardcode) {
		this.nursequacardcode = nursequacardcode;
	}
	public String getUpdate_id() {
		return update_id;
	}
	public void setUpdate_id(String update_id) {
		this.update_id = update_id;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getCreate_id() {
		return create_id;
	}
	public void setCreate_id(String create_id) {
		this.create_id = create_id;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getSourcetype() {
		return sourcetype;
	}
	public void setSourcetype(String sourcetype) {
		this.sourcetype = sourcetype;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getTjxxh() {
		return tjxxh;
	}
	public void setTjxxh(String tjxxh) {
		this.tjxxh = tjxxh;
	}
	public String getTjxxhcontent() {
		return tjxxhcontent;
	}
	public void setTjxxhcontent(String tjxxhcontent) {
		this.tjxxhcontent = tjxxhcontent;
	}
	public String getPxzs() {
		return pxzs;
	}
	public void setPxzs(String pxzs) {
		this.pxzs = pxzs;
	}
	public String getZsbm() {
		return zsbm;
	}
	public void setZsbm(String zsbm) {
		this.zsbm = zsbm;
	}
	public String getQkyx() {
		return qkyx;
	}
	public void setQkyx(String qkyx) {
		this.qkyx = qkyx;
	}
	public String getPoliticallandscape() {
		return politicallandscape;
	}
	public void setPoliticallandscape(String politicallandscape) {
		this.politicallandscape = politicallandscape;
	}
	public String getJoinpartydate() {
		return joinpartydate;
	}
	public void setJoinpartydate(String joinpartydate) {
		this.joinpartydate = joinpartydate;
	}
	public String getTelqualificationtime() {
		return telqualificationtime;
	}
	public void setTelqualificationtime(String telqualificationtime) {
		this.telqualificationtime = telqualificationtime;
	}
	public String getNativeplace() {
		return nativeplace;
	}
	public void setNativeplace(String nativeplace) {
		this.nativeplace = nativeplace;
	}
	public String getXqzt() {
		return xqzt;
	}
	public void setXqzt(String xqzt) {
		this.xqzt = xqzt;
	}
	
	
}