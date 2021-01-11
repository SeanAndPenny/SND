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
import com.wondersgroup.wszygl.dao.GwgxyglbbDao;
import com.wondersgroup.wszygl.model.GwgxyglbbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Component
public class GwgxyglbbManager extends BaseMybatisManager<GwgxyglbbModel,String>{
	@Autowired
	private  GwgxyglbbDao gwgxyglbbDao;
	
	public List<YljgModel> getAllYljg(String yljgdm){
		return gwgxyglbbDao.getAllYljg(yljgdm);
	}
	
	 public int getCkrksl(String yljgdm,String enddate) {
		 return gwgxyglbbDao.getCkrksl(yljgdm,enddate);
	 }
	public List<TbjdpzModel>getAllJd(){
		return gwgxyglbbDao.getAllJd();
	}
	
	
	//高血压患者健康管理报表
    public void exportdb(FileInputStream fileInputStream, ServletOutputStream outputStream,String enddate2,String yljgdm) {
		// Workbook工作簿
		XSSFWorkbook book = null;
		try {
			book = new XSSFWorkbook(fileInputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 工作表 sheet
		XSSFSheet sheet = book.getSheetAt(0); 
		// 获取第二个sheet中的第一行第一列的样式 及边框
		//    XSSFCellStyle cellStyle = book.getSheetAt(1).getRow(0).getCell(0).getCellStyle();
		List<GwgxyglbbModel> list = gwgxyglbbDao.findAll(enddate2,yljgdm);
		System.out.println("size=="+list.size());
		
		int rowIndex = 0; // 让表格从第二行开始导入
	    XSSFCell cell = null;
	    // 新建一行
	    XSSFRow row = sheet.createRow(rowIndex);
	    cell = row.createCell(0); // 第一个单元格
	    //      设定已经准备好单元格的样式
	    //      cell.setCellStyle(cellStyle);
	    String yljgmc = "管辖机构";
	    if(yljgmc != null){
	      cell.setCellValue(yljgmc);
	    }

	    cell = row.createCell(1); // 第一个单元格
	    String glrs1 = "年内辖区内已管理的高血压患者人数";
	    if(glrs1 != null){
	      cell.setCellValue(glrs1);
	    }

	    cell = row.createCell(2); // 第二个单元格
	    String glrs2 = "按照规范要求进行高血压患者健康管理的人数（人）";
	    if(glrs2 != null){
	      cell.setCellValue(glrs2);
	    }

	    cell = row.createCell(3); // 第三个单元格
	    String bl1 = "高血压患者规范管理率（%）";
	    if(bl1 != null){
	      cell.setCellValue(bl1);
	    }
	    cell = row.createCell(4); // 第四个单元格
	    String glrs3 = "最近一次随访血压达标人数（人）";
	    if(glrs3 != null){
	      cell.setCellValue(glrs3);
	    }
	    cell = row.createCell(5); // 第五个单元格
	    String bl2 = "管理人群血压控制率（%）";
	    if(bl2 != null){
	      cell.setCellValue(bl2);
	    }
	    cell = row.createCell(6); // 第六个单元格
	    String glrs4 = "在管高血压患者家庭医生签约人数（人）";
	    if(glrs4 != null){
	      cell.setCellValue(glrs4);
	    }
	    
	    cell = row.createCell(7); // 第七个单元格
	    String bl3 = "在管高血压患者家庭医生签约率（%）";
	    if(bl3 != null){
	      cell.setCellValue(bl3);
	    }
	     
	     

	    rowIndex = 1;
	    for (GwgxyglbbModel dataProcess : list) {
	      // 新建一行
	      row = sheet.createRow(rowIndex);
	      cell = row.createCell(0); // 第一个单元格
	      //    设定已经准备好单元格的样式
	      //    cell.setCellStyle(cellStyle);
	      yljgmc = dataProcess.getYljgmc();
	      if(yljgmc != null){
	        cell.setCellValue(yljgmc);
	      }

	      cell = row.createCell(1); // 第一个单元格
	      glrs1 = dataProcess.getGlrs1();
	      if(glrs1 != null){
	        cell.setCellValue(glrs1);
	      }

	      cell = row.createCell(2); // 第二个单元格
	      glrs2 = dataProcess.getGlrs2();
	      if(glrs2 != null){
	        cell.setCellValue(glrs2);
	      }

	      cell = row.createCell(3); // 第三个单元格
	      bl1 = dataProcess.getBl1();
	      if(bl1 != null){
	        cell.setCellValue(bl1);
	      }
	      cell = row.createCell(4); // 第三个单元格
	      glrs3 = dataProcess.getGlrs3();
	      if(glrs3 != null){
	        cell.setCellValue(glrs3);
	      }
	      cell = row.createCell(5); // 第三个单元格
	      bl2 = dataProcess.getBl2();
	      if(bl2 != null){
	        cell.setCellValue(bl2);
	      }
	      cell = row.createCell(6); // 第三个单元格
	      glrs4 = dataProcess.getGlrs4();
	      if(glrs4 != null){
	        cell.setCellValue(glrs4);
	      }
	      
	      cell = row.createCell(7); // 第三个单元格
	      bl3 = dataProcess.getBl3();
	      if(bl3 != null){
	        cell.setCellValue(bl3);
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
    
    public void saveHt(String yljgdm,String rksl,String enddate) {
    	gwgxyglbbDao.saveHt(yljgdm,rksl,enddate);
	}
	
	public void updateRksl(String yljgdm, String rksl, String enddate) {
		gwgxyglbbDao.updateRksl(yljgdm,rksl,enddate);
		
	}
    
    
	@Override
	public BaseMybatisDao<GwgxyglbbModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gwgxyglbbDao;
	}

}
