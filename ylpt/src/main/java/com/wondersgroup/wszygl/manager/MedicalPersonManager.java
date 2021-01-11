package com.wondersgroup.wszygl.manager;



import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.AreaDao;
import com.wondersgroup.wszygl.dao.MedicalPersonDao;
import com.wondersgroup.wszygl.model.AreaModel;
import com.wondersgroup.wszygl.model.MedicalPersonHtModel;
import com.wondersgroup.wszygl.model.MedicalPersonModel;
import com.wondersgroup.wszygl.model.MedicalPersonTxModel;

@Component
public class MedicalPersonManager extends BaseMybatisManager<MedicalPersonModel, String> {

	@Autowired
	private MedicalPersonDao medicalPersonDao;

	@Override
	public BaseMybatisDao<MedicalPersonModel, String> getBaseDao() {
		return medicalPersonDao;
	}

	public MedicalPersonHtModel getByPersonid(String id) {
		return medicalPersonDao.getByPersonid(id);
	}

	public void saveHt(MedicalPersonHtModel ht) {
		medicalPersonDao.saveHt(ht);
		
	}

	public List<MedicalPersonTxModel> getTxByPersonid(String id) {

		return medicalPersonDao.getTxByPersonid(id);
	}
	
	public List<MedicalPersonModel> getCkxxByidcard(String idcard) {

		return medicalPersonDao.getCkxxByidcard(idcard);
	}
    public int getXq(String id,String yljgmc) {
    	return medicalPersonDao.getXq(id,yljgmc);
 }
    public void getXgxqzt(String id) {
    	medicalPersonDao.getXgxqzt(id);
    }
    
  //导出人事合同人员信息
    public void exportdb(FileInputStream fileInputStream, ServletOutputStream outputStream,String xm,String idcardtype,String yljgdm) {
		// Workbook工作簿
		XSSFWorkbook book = null;
		System.out.println("idcardtype=="+idcardtype);
		System.out.println("xm=="+xm);
		System.out.println("yljgdm=="+yljgdm);
		try {
			book = new XSSFWorkbook(fileInputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 工作表 sheet
		XSSFSheet sheet = book.getSheetAt(0); 
		System.out.println("hhhhhhh");
		// 获取第二个sheet中的第一行第一列的样式 及边框
		//    XSSFCellStyle cellStyle = book.getSheetAt(1).getRow(0).getCell(0).getCellStyle();
		List<MedicalPersonModel> list = medicalPersonDao.findAll(xm,idcardtype,yljgdm);
		System.out.println("size=="+list.size());
		int rowIndex = 0; // 让表格从第二行开始导入
	    XSSFCell cell = null;
	    // 新建一行
	    XSSFRow row = sheet.createRow(rowIndex);
	    cell = row.createCell(0); // 第一个单元格
	    //      设定已经准备好单元格的样式
	    //      cell.setCellStyle(cellStyle);
	    String unitname = "姓名";
	    if(unitname != null){
	      cell.setCellValue(unitname);
	    }

	    cell = row.createCell(1); // 第一个单元格
	    String gender = "性别";
	    if(gender != null){
	      cell.setCellValue(gender);
	    }

	    cell = row.createCell(2); // 第二个单元格
	    String folk = "民族";
	    if(folk != null){
	      cell.setCellValue(folk);
	    }

	    cell = row.createCell(3); // 第三个单元格
	    String idcard = "证件号码";
	    if(idcard != null){
	      cell.setCellValue(idcard);
	    }
	    cell = row.createCell(4); // 第四个单元格
	    String nativeplace = "籍贯";
	    if(nativeplace != null){
	      cell.setCellValue(nativeplace);
	    }
	    cell = row.createCell(5); // 第五个单元格
	    String birthdate = "出生日期";
	    if(birthdate != null){
	      cell.setCellValue(birthdate);
	    }
	    cell = row.createCell(6); // 第六个单元格
	    String phone = "手机号码";
	    if(phone != null){
	      cell.setCellValue(phone);
	    }
	    
	    cell = row.createCell(7); // 第七个单元格
	    String politicallandscape = "政治面貌";
	    if(politicallandscape != null){
	      cell.setCellValue(politicallandscape);
	    }
	    cell = row.createCell(8); // 第八个单元格
	    String joinpartydate = "参加党派时间";
	    if(joinpartydate != null){
	      cell.setCellValue(joinpartydate);
	    }
	    cell = row.createCell(9); // 第九个单元格
	    String hospitalname = "所在单位名称";
	    if(hospitalname != null){
	      cell.setCellValue(hospitalname);
	    }
	    cell = row.createCell(10); // 第十个单元格
	    String sectionname = "所在科室名称";
	    if(sectionname != null){
	      cell.setCellValue(sectionname);
	    }
	    cell = row.createCell(11); // 第十一个单元格
	    String sectionid = "所在科室代码";
	    if(sectionid != null){
	      cell.setCellValue(sectionid);
	    }
	    cell = row.createCell(12); // 第十二个单元格
	    String joinworkdate = "参加工作日期";
	    if(joinworkdate != null){
	      cell.setCellValue(joinworkdate);
	    }
	    cell = row.createCell(13); // 第十三个单元格
	    String praclevel = "从事专业";
	    if(praclevel != null){
	      cell.setCellValue(praclevel);
	    }
	    cell = row.createCell(14); // 第十三个单元格
	    String organizationcode = "编制情况";
	    if(organizationcode != null){
	      cell.setCellValue(organizationcode);
	    }
	    cell = row.createCell(15); // 第十三个单元格
	    String medicaltype = "人员类型";
	    if(medicaltype != null){
	      cell.setCellValue(medicaltype);
	    }
	    cell = row.createCell(16); // 第十三个单元格
	    String telqualification = "专业技术资格评";
	    if(telqualification != null){
	      cell.setCellValue(telqualification);
	    }
	    
	    cell = row.createCell(17); // 第十三个单元格
	    String telqualificationtime = "专业技术资格评定时间";
	    if(telqualificationtime != null){
	      cell.setCellValue(telqualificationtime);
	    }
	    cell = row.createCell(18); // 第十三个单元格
	    String applypratype = "医师执业类别";
	    if(applypratype != null){
	      cell.setCellValue(applypratype);
	    }
	    cell = row.createCell(19); // 第十三个单元格
	    String sub_section = "其他科室补述";
	    if(sub_section != null){
	      cell.setCellValue(sub_section);
	    }
	    cell = row.createCell(20); // 第十三个单元格
	    String corpcardcode = "医师/卫生监督员执业证书编码";
	    if(corpcardcode != null){
	      cell.setCellValue(corpcardcode);
	    }
	    cell = row.createCell(21); // 第十三个单元格
	    String flowcode = "年内人员流动情况";
	    if(flowcode != null){
	      cell.setCellValue(flowcode);
	    }
	    cell = row.createCell(22); // 第十三个单元格
	    String tjxxh = "是否从事统计信息化业务工作";
	    if(tjxxh != null){
	      cell.setCellValue(tjxxh);
	    }
	    cell = row.createCell(23); // 第十三个单元格
	    String qkyx = "是否注册为全科医学专业";
	    if(qkyx != null){
	      cell.setCellValue(qkyx);
	    }
	    cell = row.createCell(24); // 第十三个单元格
	    String flowtime = "调入/调出时间";
	    if(flowtime != null){
	      cell.setCellValue(flowtime);
	    }
	    cell = row.createCell(25); // 第十三个单元格
	    String technicaltitle = "专业技术职务聘";
	    if(technicaltitle != null){
	      cell.setCellValue(technicaltitle);
	    }
	    cell = row.createCell(26); // 第十三个单元格
	    String edu = "学历";
	    if(edu != null){
	      cell.setCellValue(edu);
	    }
	    cell = row.createCell(27); // 第十三个单元格
	    String major = "所学专业";
	    if(major != null){
	      cell.setCellValue(major);
	    }
	    cell = row.createCell(28); // 第十三个单元格
	    String edudegree = "学位";
	    if(edudegree != null){
	      cell.setCellValue(edudegree);
	    }

	    rowIndex = 1;
	    for (MedicalPersonModel dataProcess : list) {
	      // 新建一行
	      row = sheet.createRow(rowIndex);
	      cell = row.createCell(0); // 第一个单元格
	      //    设定已经准备好单元格的样式
	      //    cell.setCellStyle(cellStyle);
	      unitname = dataProcess.getUnitname();
	      if(unitname != null){
	        cell.setCellValue(unitname);
	      }

	      cell = row.createCell(1); // 第一个单元格
	      gender = dataProcess.getGender();
	      if(gender != null){
	        cell.setCellValue(gender);
	      }

	      cell = row.createCell(2); // 第二个单元格
	      folk = dataProcess.getFolk();
	      if(folk != null){
	        cell.setCellValue(folk);
	      }

	      cell = row.createCell(3); // 第三个单元格
	      idcard = dataProcess.getIdcard();
	      if(idcard != null){
	        cell.setCellValue(idcard);
	      }
	      cell = row.createCell(4); // 第三个单元格
	      nativeplace = dataProcess.getNativeplace();
	      if(nativeplace != null){
	        cell.setCellValue(nativeplace);
	      }
	      cell = row.createCell(5); // 第三个单元格
	      birthdate = dataProcess.getBirthdate();
	      if(birthdate != null){
	        cell.setCellValue(birthdate);
	      }
	      cell = row.createCell(6); // 第三个单元格
	      phone = dataProcess.getPhone();
	      if(phone != null){
	        cell.setCellValue(phone);
	      }
	      
	      cell = row.createCell(7); // 第三个单元格
	      politicallandscape = dataProcess.getPoliticallandscape();
	      if(politicallandscape != null){
	        cell.setCellValue(politicallandscape);
	      }
	      cell = row.createCell(8); // 第三个单元格
	      joinpartydate = dataProcess.getJoinpartydate();
	      if(joinpartydate != null){
	        cell.setCellValue(joinpartydate);
	      }
	      cell = row.createCell(9); // 第三个单元格
	      hospitalname = dataProcess.getHospitalname();
	      if(hospitalname != null){
	        cell.setCellValue(hospitalname);
	      } 
	      cell = row.createCell(10); // 第三个单元格
	      sectionname = dataProcess.getSectionname();
	      if(sectionname != null){
	        cell.setCellValue(sectionname);
	      }
	      cell = row.createCell(11); // 第三个单元格
	      sectionid = dataProcess.getSectionid();
	      if(sectionid != null){
	        cell.setCellValue(sectionid);
	      }
	      cell = row.createCell(12); // 第三个单元格
	      joinworkdate = dataProcess.getJoinworkdate();
	      if(joinworkdate != null){
	        cell.setCellValue(joinworkdate);
	      }
	      cell = row.createCell(13); // 第三个单元格
	      praclevel = dataProcess.getPraclevel();
	      if(praclevel != null){
	        cell.setCellValue(praclevel);
	      }
	      cell = row.createCell(14); // 第三个单元格
	      organizationcode = dataProcess.getOrganizationcode();
	      if(organizationcode != null){
	        cell.setCellValue(organizationcode);
	      }
	      cell = row.createCell(15); // 第三个单元格
	      medicaltype = dataProcess.getMedicaltype();
	      if(medicaltype != null){
	        cell.setCellValue(medicaltype);
	      }
	      cell = row.createCell(16); // 第三个单元格
	      telqualification = dataProcess.getTelqualification();
	      if(telqualification != null){
	        cell.setCellValue(telqualification);
	      }
	      cell = row.createCell(17); // 第三个单元格
	      telqualificationtime = dataProcess.getTelqualificationtime();
	      if(telqualificationtime != null){
	        cell.setCellValue(telqualificationtime);
	      }
	      cell = row.createCell(18); // 第三个单元格
	      applypratype = dataProcess.getApplypratype();
	      if(applypratype != null){
	        cell.setCellValue(applypratype);
	      }
	      cell = row.createCell(19); // 第三个单元格
	      sub_section = dataProcess.getSub_section();
	      if(sub_section != null){
	        cell.setCellValue(sub_section);
	      }
	      cell = row.createCell(20); // 第三个单元格
	      corpcardcode = dataProcess.getCorpcardcode();
	      if(corpcardcode != null){
	        cell.setCellValue(corpcardcode);
	      }
	      cell = row.createCell(21); // 第三个单元格
	      flowcode = dataProcess.getFlowcode();
	      if(flowcode != null){
	        cell.setCellValue(flowcode);
	      }
	      cell = row.createCell(22); // 第三个单元格
	      tjxxh = dataProcess.getTjxxh();
	      if(tjxxh != null){
	        cell.setCellValue(tjxxh);
	      }
	      cell = row.createCell(23); // 第三个单元格
	      qkyx = dataProcess.getQkyx();
	      if(qkyx != null){
	        cell.setCellValue(qkyx);
	      }
	      cell = row.createCell(24); // 第三个单元格
	      flowtime = dataProcess.getFlowtime();
	      if(flowtime != null){
	        cell.setCellValue(flowtime);
	      }
	      cell = row.createCell(25); // 第三个单元格
	      technicaltitle = dataProcess.getTechnicaltitle();
	      if(technicaltitle != null){
	        cell.setCellValue(technicaltitle);
	      }
	      cell = row.createCell(26); // 第三个单元格
	      edu = dataProcess.getEdu();
	      if(edu != null){
	        cell.setCellValue(edu);
	      }
	      cell = row.createCell(27); // 第三个单元格
	      major = dataProcess.getMajor();
	      if(major != null){
	        cell.setCellValue(major);
	      }
	      cell = row.createCell(28); // 第三个单元格
	      edudegree = dataProcess.getEdudegree();
	      if(edudegree != null){
	        cell.setCellValue(edudegree);
	      } 
	      

	      rowIndex++;

		}
		// 把工作簿放在输出流中
		try {
			book.write(outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}