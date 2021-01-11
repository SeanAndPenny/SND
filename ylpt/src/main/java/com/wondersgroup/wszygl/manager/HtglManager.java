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
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.dao.HtglDao;
import com.wondersgroup.wszygl.model.TbDxRshtx;

@Component
public class HtglManager extends BaseMybatisManager<TbDxRshtx, String> {
	@Autowired
	private HtglDao htglDao;
	public List<YljgModel> getAllYljg(){
		return htglDao.getAllYljg();
	}
	public int getScht(String zjhm,String dqrq) {
		return htglDao.getScht(zjhm,dqrq);
	}
	public void insertExcel(TbDxRshtx daoruexcel) {
		htglDao.insertExcel(daoruexcel);
	}
	@Override
	public BaseMybatisDao<TbDxRshtx, String> getBaseDao() {
		// TODO Auto-generated method stub
		return htglDao;
	}
	
	//下载模板
		public void exportHt(FileInputStream fileInputStream, ServletOutputStream outputStream) {
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
			//	    XSSFCellStyle cellStyle = book.getSheetAt(1).getRow(0).getCell(0).getCellStyle();

			int rowIndex = 0; // 让表格从第二行开始导入
			XSSFCell cell = null;
			// 新建一行
			XSSFRow row = sheet.createRow(rowIndex);
			cell = row.createCell(0); // 第一个单元格
			//	    设定已经准备好单元格的样式
			//	    cell.setCellStyle(cellStyle);
			String yljgmc = "单位名称";
			if(yljgmc != null){
				cell.setCellValue(yljgmc);
			}

			cell = row.createCell(1); // 第一个单元格
			String xm = "经办人姓名";
			if(xm != null){
				cell.setCellValue(xm);
			}

			cell = row.createCell(2); // 第二个单元格
			String sjhm = "经办人手机号";
			if(sjhm != null){
				cell.setCellValue(sjhm);
			}

			cell = row.createCell(3); // 第三个单元格
			String dqrq = "合同到期时间";
			if(dqrq != null){
				cell.setCellValue(dqrq);
			}
			cell = row.createCell(4); // 第三个单元格
			String zjhm = "管理人身份证号码";
			if(zjhm != null){
				cell.setCellValue(zjhm);
			}

			rowIndex = 1; // 让表格从第二行开始导入
			// 新建一行
			row = sheet.createRow(rowIndex);
			cell = row.createCell(0); // 第一个单元格
			//	    设定已经准备好单元格的样式
			//	    cell.setCellStyle(cellStyle);
			yljgmc = "XXX医院";
			if(yljgmc != null){
				cell.setCellValue(yljgmc);
			}

			cell = row.createCell(1); // 第一个单元格
			xm = "张三";
			if(xm != null){
				cell.setCellValue(xm);
			}

			cell = row.createCell(2); // 第二个单元格
			sjhm = "152xxxxxxxxxxx";
			if(sjhm != null){
				cell.setCellValue(sjhm);
			}

			cell = row.createCell(3); // 第三个单元格
			dqrq = "2019.06.21";
			if(dqrq != null){
				cell.setCellValue(dqrq);
			}
			cell = row.createCell(4); // 第四个单元格
			zjhm = "320507xxxxxxxxxxxx";
			if(zjhm != null){
				cell.setCellValue(zjhm);
			}
			// 把工作簿放在输出流中
			try {
				book.write(outputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	
}
