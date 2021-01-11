package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
//资金分析
@SuppressWarnings("serial")
public class IAEDModel implements BaseEntity {
	  private String iaeUnitCode;//机构编码
	  private String iaeUnit;//机构名称
	  private String iaeSubjectCode;//科目编码
	  private String iaeSubject;//科目名称
	  private String iaeSubjectCodeLevel1;
	  private String iaeSubjectLevel1 ;
	  private String iaeSubjectCodeLevel2;
	  private String iaeSubjectLevel2 ;
//	  modify by PanJW 2021年1月9日16点48分 尝试统一编码名称 方便后续开发 后续考虑图样编码统一
	  private String fee;//统一金额代码
	  private String unitCode;//统一机构编码
	  private String unitName;//统一机构名称
	  private String objectCode;//统一项目编码
	  private String objectName;//统一项目名称
	  private String peopleNum;//统一人数代码
	  private String searchDate;//统一日期代码


	public String getIaeUnitCode() {
		return iaeUnitCode;
	}

	public void setIaeUnitCode(String iaeUnitCode) {
		this.iaeUnitCode = iaeUnitCode;
	}

	public String getIaeUnit() {
		return iaeUnit;
	}

	public void setIaeUnit(String iaeUnit) {
		this.iaeUnit = iaeUnit;
	}

	public String getIaeSubjectCode() {
		return iaeSubjectCode;
	}

	public void setIaeSubjectCode(String iaeSubjectCode) {
		this.iaeSubjectCode = iaeSubjectCode;
	}

	public String getIaeSubject() {
		return iaeSubject;
	}

	public void setIaeSubject(String iaeSubject) {
		this.iaeSubject = iaeSubject;
	}

	public String getIaeSubjectCodeLevel1() {
		return iaeSubjectCodeLevel1;
	}

	public void setIaeSubjectCodeLevel1(String iaeSubjectCodeLevel1) {
		this.iaeSubjectCodeLevel1 = iaeSubjectCodeLevel1;
	}

	public String getIaeSubjectLevel1() {
		return iaeSubjectLevel1;
	}

	public void setIaeSubjectLevel1(String iaeSubjectLevel1) {
		this.iaeSubjectLevel1 = iaeSubjectLevel1;
	}

	public String getIaeSubjectCodeLevel2() {
		return iaeSubjectCodeLevel2;
	}

	public void setIaeSubjectCodeLevel2(String iaeSubjectCodeLevel2) {
		this.iaeSubjectCodeLevel2 = iaeSubjectCodeLevel2;
	}

	public String getIaeSubjectLevel2() {
		return iaeSubjectLevel2;
	}

	public void setIaeSubjectLevel2(String iaeSubjectLevel2) {
		this.iaeSubjectLevel2 = iaeSubjectLevel2;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getUnitCode() {
		return unitCode;
	}

	public void setUnitCode(String unitCode) {
		this.unitCode = unitCode;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

    public String getObjectCode() {
        return objectCode;
    }

    public void setObjectCode(String objectCode) {
        this.objectCode = objectCode;
    }

    public String getObjectName() {
        return objectName;
    }

    public void setObjectName(String objectName) {
        this.objectName = objectName;
    }

    public String getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(String peopleNum) {
		this.peopleNum = peopleNum;
	}

    public String getSearchDate() {
        return searchDate;
    }

    public void setSearchDate(String searchDate) {
        this.searchDate = searchDate;
    }

    @Override
	public String toString() {
		return "IAEDModel{" +
				"iaeUnitCode='" + iaeUnitCode + '\'' +
				", iaeUnit='" + iaeUnit + '\'' +
				", iaeSubjectCode='" + iaeSubjectCode + '\'' +
				", iaeSubject='" + iaeSubject + '\'' +
				", iaeSubjectCodeLevel1='" + iaeSubjectCodeLevel1 + '\'' +
				", iaeSubjectLevel1='" + iaeSubjectLevel1 + '\'' +
				", iaeSubjectCodeLevel2='" + iaeSubjectCodeLevel2 + '\'' +
				", iaeSubjectLevel2='" + iaeSubjectLevel2 + '\'' +
				", fee='" + fee + '\'' +
				", unitCode='" + unitCode + '\'' +
				", unitName='" + unitName + '\'' +
				", objectCode='" + objectCode + '\'' +
				", objectName='" + objectName + '\'' +
				", peopleNum='" + peopleNum + '\'' +
				", searchDate='" + searchDate + '\'' +
				'}';
	}
}
