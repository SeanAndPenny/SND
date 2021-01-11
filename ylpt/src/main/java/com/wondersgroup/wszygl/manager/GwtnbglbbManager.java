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
import com.wondersgroup.wszygl.dao.GwtnbglbbDao;
import com.wondersgroup.wszygl.model.GwgxyglbbModel;
import com.wondersgroup.wszygl.model.GwtnbglbbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Component
public class GwtnbglbbManager extends BaseMybatisManager<GwtnbglbbModel,String>{
	@Autowired
	private  GwtnbglbbDao gwtnbglbbdao;
	
	public List<YljgModel> getAllYljg(String yljgdm) {
		return gwtnbglbbdao.getAllYljg(yljgdm);
	}
	public List<TbjdpzModel>getAllJd(){
		return gwtnbglbbdao.getAllJd();
	}
	 public int getCkrksl(String yljgdm,String enddate) {
		 return gwtnbglbbdao.getCkrksl(yljgdm,enddate);
	 }
	 public void updateRksl(String yljgdm,String rksl,String enddate) {
		 gwtnbglbbdao.updateRksl(yljgdm,rksl,enddate);
	 }
	public void  saveHt(String yljgdm,String rksl,String enddate) {
		 gwtnbglbbdao.saveHt(yljgdm,rksl,enddate);
	 }
	//糖尿病患者健康管理报表
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
		List<GwtnbglbbModel> list = gwtnbglbbdao.findAll(enddate2,yljgdm);
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
	    String rs1 = "年内辖区内已管理的2型糖尿病患者人数";
	    if(rs1 != null){
	      cell.setCellValue(rs1);
	    }

	    cell = row.createCell(2); // 第二个单元格
	    String rs2 = "按照规范要求进行2型糖尿病患者健康管理的人数（人）";
	    if(rs2 != null){
	      cell.setCellValue(rs2);
	    }

	    cell = row.createCell(3); // 第三个单元格
	    String bl1 =  "2型糖尿病患者规范管理率（%）";
	    if(bl1 != null){
	      cell.setCellValue(bl1);
	    }
	    cell = row.createCell(4); // 第四个单元格
	    String rs3 = "最近一次随访空腹血糖达标人数（人）";
	    if(rs3 != null){
	      cell.setCellValue(rs3);
	    }
	    cell = row.createCell(5); // 第五个单元格
	    String bl2 = "管理人群血糖控制率（%）";
	    if(bl2 != null){
	      cell.setCellValue(bl2);
	    }
	    
	     

	    rowIndex = 1;
	    for (GwtnbglbbModel dataProcess : list) {
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
	      cell = row.createCell(5); // 第三个单元格
	      bl2 = dataProcess.getBl2();
	      if(bl2 != null){
	        cell.setCellValue(bl2);
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
	public BaseMybatisDao<GwtnbglbbModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gwtnbglbbdao;
	}

}
