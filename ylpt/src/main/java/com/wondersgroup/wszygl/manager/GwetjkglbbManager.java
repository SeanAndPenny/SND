package com.wondersgroup.wszygl.manager;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GwetjkglbbDao;
import com.wondersgroup.wszygl.model.GwetjkglbbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;
@Component
public class GwetjkglbbManager extends BaseMybatisManager<GwetjkglbbModel,String>{
	@Autowired
	private  GwetjkglbbDao gwetjkglbbDao;
	
	public List<YljgModel> getAllYljg(String yljgdm) {
		// TODO Auto-generated method stub
		return gwetjkglbbDao.getAllYljg(yljgdm);
	}
	public List<TbjdpzModel> getAllJd() {
		// TODO Auto-generated method stub
		return gwetjkglbbDao.getAllJd();
	}
	//高血压患者健康管理报表
    public void exportdb(FileInputStream fileInputStream, ServletOutputStream outputStream,String enddate,String yljgdm) {
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
		    //XSSFCellStyle cellStyle = book.getSheetAt(1).getRow(0).getCell(0).getCellStyle();
		
		  List<GwetjkglbbModel> list = gwetjkglbbDao.findAll(enddate,yljgdm);
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
	    String rs1 = "辖区内活产数";
	    if(rs1 != null){
	      cell.setCellValue(rs1);
	    }

	    cell = row.createCell(2); // 第二个单元格
	    String rs2 = "辖区内按照规范要求接受1次及以上访视的新生儿人数";
	    if(rs2 != null){
	      cell.setCellValue(rs2);
	    }

	    cell = row.createCell(3); // 第三个单元格
	    String bl1 = "新生儿访视率（%）";
	    if(bl1 != null){
	      cell.setCellValue(bl1);
	    }
	    cell = row.createCell(4); // 第四个单元格
	    String rs3 = "辖区内0-6岁儿童数（人）";
	    if(rs3 != null){
	      cell.setCellValue(rs3);
	    }
	       
	    rowIndex = 1;
	    for (GwetjkglbbModel dataProcess : list) {
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
	      rs1 = dataProcess.getRs1();
	      if(rs1 != null){
	        cell.setCellValue(rs1);
	      }

	      cell = row.createCell(2); // 第二个单元格
	     rs2 = dataProcess.getRs2();
	      if(rs2 != null){
	        cell.setCellValue(rs2);
	      }

	      cell = row.createCell(3); // 第三个单元格
	      bl1 = dataProcess.getBl1();
	      if(bl1 != null){
	        cell.setCellValue(bl1);
	      }
	      cell = row.createCell(4); // 第三个单元格
	      rs3 = dataProcess.getRs3();
	      if(rs3 != null){
	        cell.setCellValue(rs3);
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
	
	@Override
	public BaseMybatisDao<GwetjkglbbModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gwetjkglbbDao;
	}



	
	

}
