package com.wondersgroup.wszygl.manager;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.model.YljgModel;
import com.wondersgroup.wszygl.dao.GwdazbDao;
import com.wondersgroup.wszygl.model.jmjkdagltjbbModel;

@Component
public class GwdazbManager extends BaseMybatisManager<jmjkdagltjbbModel, String> {
	@Autowired
	private GwdazbDao gwdazbdao;

	public void saveHt(String yljgdm, String rksl, String enddate) {
		gwdazbdao.saveHt(yljgdm, rksl, enddate);
	}

	public void updateRksl(String yljgdm, String rksl, String enddate) {
		gwdazbdao.updateRksl(yljgdm, rksl, enddate);

	}

	public List<YljgModel> getAllYljg(String yljgdm) {
		return gwdazbdao.getAllYljg(yljgdm);
	}

	public int getCkrksl(String yljgdm, String enddate) {

		return gwdazbdao.getCkrksl(yljgdm, enddate);
	}

	// 城乡居民健康档案管理统计报表
	public void exportdb(FileInputStream fileInputStream, ServletOutputStream outputStream, String enddate,
			String yljgdm) {
		XSSFWorkbook book = null; // Workbook工作簿
		try {
			book = new XSSFWorkbook(fileInputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 工作表 sheet
		XSSFSheet sheet = book.getSheetAt(0);
		List<jmjkdagltjbbModel> list = gwdazbdao.findAll(enddate, yljgdm);
		XSSFCell cell = null;

		/*zcd
		 * 标题
		 */
		int rowIndex = 0; // 数据从第1行开始导入excel
		XSSFRow row = sheet.createRow(rowIndex);// 创建第1行
		cell = row.createCell(0); // 第一个单元格
		// 设置字体样式
		XSSFCellStyle style = book.createCellStyle();
		XSSFFont font = book.createFont();
		//font.setBold(true);// 加粗
		font.setFontHeightInPoints((short)25);// 字体大小
		font.setFontName("黑体");// 字体类型
		style.setFont(font);
		cell.setCellStyle(style);//
		// 水平居中
		cell.getCellStyle().setAlignment(XSSFCellStyle.ALIGN_CENTER);
		// 垂直居中
		cell.getCellStyle().setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		cell.getCellStyle().setBorderBottom(XSSFCellStyle.BORDER_THIN); // 下边框
		cell.getCellStyle().setBorderLeft(XSSFCellStyle.BORDER_THIN);// 左边框
		cell.getCellStyle().setBorderTop(XSSFCellStyle.BORDER_THIN);// 上边框-
		cell.getCellStyle().setBorderRight(XSSFCellStyle.BORDER_THIN);// 右边框
		row.setHeight((short) (25 * 30));//设置单元格高度
		cell.setCellValue("高新区社会事业局健康档案报表");
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 7)); // 合并第一行第7列和第二行第7列

		/*zcd
		 * 列名
		 */
		XSSFCellStyle style2 = book.createCellStyle();
		XSSFFont font2 = book.createFont();
		//font2.setBold(true);// 加粗
		font2.setFontHeightInPoints((short) 15);// 字体大小
		font2.setFontName("黑体");// 字体类型
		style2.setFont(font2);
		XSSFCell cell2 = null;
		rowIndex = 1; // 数据从第2行开始导入excel
		row = sheet.createRow(rowIndex);// 创建第2行
		String[] title = { "建档机构", "辖区内常住居民数", "建档人数", "健康档案建档率", "建立电子健康档案人数", "电子健康档案建档率", "动态记录档案份数", "健康档案使用率" };
		for (int i = 0; i < title.length; i++) {
			cell2 = row.createCell(i);
			cell2.setCellValue(title[i]);
			cell2.setCellStyle(style2);
			// 水平居中
			cell2.getCellStyle().setAlignment(XSSFCellStyle.ALIGN_CENTER);
			// 垂直居中
			cell2.getCellStyle().setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);

			cell2.getCellStyle().setBorderBottom(XSSFCellStyle.BORDER_THIN); // 下边框
			cell2.getCellStyle().setBorderLeft(XSSFCellStyle.BORDER_THIN);// 左边框
			cell2.getCellStyle().setBorderTop(XSSFCellStyle.BORDER_THIN);// 上边框-
			cell2.getCellStyle().setBorderRight(XSSFCellStyle.BORDER_THIN);// 右边框
			sheet.setColumnWidth(i, 5500); 
		}
		row.setHeight((short) (25 * 25));// 设置行高
		
		
		
		
		/*zcd
		 * 列名对应的值
		 */
		XSSFCellStyle style3 = book.createCellStyle();
		XSSFFont font3 = book.createFont();

		font3.setFontHeightInPoints((short) 10);// 字体大小
		font3.setFontName("宋体");// 字体类型
		style3.setFont(font3); 
		rowIndex = 2;// 数据从第3行开始导入excel
		XSSFCell cell3 = null;
		for (jmjkdagltjbbModel dataProcess : list) {
			// 新建一行
			row = sheet.createRow(rowIndex);
			cell3 = row.createCell(0); // 第1个单元格
			cell3.setCellStyle(style3);
			String yljgmc = dataProcess.getYljgmc();
			if (yljgmc != null) {
				cell3.setCellValue(yljgmc);
			}
			cell3 = row.createCell(1); // 第2个单元格
			cell3.setCellStyle(style3);
			String czrks = dataProcess.getCzrks();
			if (czrks != null) {
				cell3.setCellValue(czrks);
			}
			cell3 = row.createCell(2); // 第3个单元格
			cell3.setCellStyle(style3);
			String jdrs = dataProcess.getJdrs();
			if (jdrs != null) {
				cell3.setCellValue(jdrs);
			}
			cell3 = row.createCell(3); // 第4个单元格\
			cell3.setCellStyle(style3);
			String jkdajdl = dataProcess.getJkdajdl();
			if (jkdajdl != null) {
				cell3.setCellValue(jkdajdl);
			}
			cell3 = row.createCell(4); // 第5个单元格
			cell3.setCellStyle(style3);
			String dzjds = dataProcess.getDzjds();
			if (dzjds != null) {
				cell3.setCellValue(dzjds);
			}
			cell3 = row.createCell(5); // 第6个单元格
			cell3.setCellStyle(style3);
			String dzjdl = dataProcess.getDzjdl();
			if (dzjdl != null) {
				cell3.setCellValue(dzjdl);
			}
			cell3 = row.createCell(6); // 第7个单元格
			cell3.setCellStyle(style3);
			String dtjds = dataProcess.getDtjds();
			if (dtjds != null) {
				cell3.setCellValue(dtjds);
			}
			cell3 = row.createCell(7); // 第8个单元格
			cell3.setCellStyle(style3);
			String jkdasyl = dataProcess.getJkdasyl();
			if (jkdasyl != null) {
				cell3.setCellValue(jkdasyl);
			}
			rowIndex++;
			row.setHeight((short) (25 * 25));// 设置行高

		}
		// 水平居中
		cell3.getCellStyle().setAlignment(XSSFCellStyle.ALIGN_CENTER);
		// 垂直居中
		cell3.getCellStyle().setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);

		cell3.getCellStyle().setBorderBottom(XSSFCellStyle.BORDER_THIN); // 下边框
		cell3.getCellStyle().setBorderLeft(XSSFCellStyle.BORDER_THIN);// 左边框
		cell3.getCellStyle().setBorderTop(XSSFCellStyle.BORDER_THIN);// 上边框-
		cell3.getCellStyle().setBorderRight(XSSFCellStyle.BORDER_THIN);// 右边框
		// 把工作簿放在输出流中
		try {
			book.write(outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public BaseMybatisDao<jmjkdagltjbbModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gwdazbdao;
	}

}
