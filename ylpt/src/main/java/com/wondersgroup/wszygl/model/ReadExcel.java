package com.wondersgroup.wszygl.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
 
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

public class ReadExcel {
    // 总行数
    private int totalRows = 0;
    // 总条数
    private int totalCells = 0;
    // 错误信息接收器
    private String errorMsg;
 
    // 构造方法
    public ReadExcel() {
    }
 
    // 获取总行数
    public int getTotalRows() {
        return totalRows;
    }
 
    // 获取总列数
    public int getTotalCells() {
        return totalCells;
    }
 
    // 获取错误信息
    public String getErrorInfo() {
        return errorMsg;
    }
 
    /**
     * 验证EXCEL文件
     *
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath) {
        if (filePath == null
                || !(WDWUtil.isExcel2003(filePath) || WDWUtil
                        .isExcel2007(filePath))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }
 
    /**
     * 读EXCEL文件，获取客户信息集合
     *
     * @param fielName
     * @return
     */
    public List<TbDxRshtx> getExcelInfo(String fileName,
            MultipartFile Mfile, String localfile) {
        File file1 = new File(localfile);//新建文件
        //转存文件,将文件转存到本地
        try {
            Mfile.transferTo(file1);
        } catch (IllegalStateException e1) {
            e1.printStackTrace();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        List<TbDxRshtx> list = new ArrayList<TbDxRshtx>();
        // 初始化输入流
        InputStream is = null;
        try {
            // 验证文件名是否合格
            if (!validateExcel(fileName)) {
                return null;
            }
            // 根据文件名判断文件是2003版本还是2007版本
            boolean isExcel2003 = true;
            if (WDWUtil.isExcel2007(fileName)) {
                isExcel2003 = false;
            }
            // 根据新建的文件实例化输入流
            is = new FileInputStream(file1);
            // 根据excel里面的内容读取信息
            list = getExcelInfo(is, isExcel2003);
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    is = null;
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
 
    /**
     * 根据excel里面的内容读取客户信息
     * @param is
     *            输入流
     * @param isExcel2003
     *            excel是2003还是2007版本
     * @return
     * @throws IOException
     */
    public List<TbDxRshtx> getExcelInfo(InputStream is,
            boolean isExcel2003) {
        List<TbDxRshtx> list = null;
        try {
            /** 根据版本选择创建Workbook的方式 */
            Workbook wb = null;
            // 当excel是2003时
            if (isExcel2003) {
                wb = new HSSFWorkbook(is);
            } else {// 当excel是2007时
                wb = new XSSFWorkbook(is);
            }
            // 读取Excel里的信息
            list = readExcelValue(wb);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }
 
    /**
     * 读取Excel里面信息
     *
     * @param wb
     * @return
     */
    private List<TbDxRshtx> readExcelValue(Workbook wb) {
        // 得到第一个shell
        Sheet sheet = wb.getSheetAt(0);
 
        // 得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();
 
        // 得到Excel的列数(前提是有行数)
        if (totalRows >= 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }
        List<TbDxRshtx> TbDxRshtxs = new ArrayList<TbDxRshtx>();
        // 循环Excel行数,从第二行开始。标题不入库
        for (int r = 1; r < totalRows; r++) {
            TbDxRshtx TbDxRshtx = new TbDxRshtx();
            Row row = sheet.getRow(r).getCell(1).getRow();
            if (row == null)
                continue;
            // 循环Excel的列,获取相关信息
            for (int c = 0; c < this.totalCells; c++) {
                Cell cell = row.getCell(c);
                if (null != cell) {
                    if (c == 0) {
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        TbDxRshtx.setYljgmc(cell.getStringCellValue());
                    } else if (c == 1) {
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        TbDxRshtx.setXm(cell.getStringCellValue());
                    } else if (c == 2) {//日期>>需要转换
                    	cell.setCellType(Cell.CELL_TYPE_STRING);
                        TbDxRshtx.setSjhm(cell.getStringCellValue());
                        
                    } else if (c == 3) {//日期
                    	cell.setCellType(Cell.CELL_TYPE_STRING);
                        TbDxRshtx.setDqrq(cell.getStringCellValue());
                    }else if (c == 4) {
                    	cell.setCellType(Cell.CELL_TYPE_STRING);
                        TbDxRshtx.setZjhm(cell.getStringCellValue());
                    } 
                }
            }
            // 添加
            TbDxRshtxs.add(TbDxRshtx);
        }
        return TbDxRshtxs;
    }
    public static void generateExcel(String sheetName, List<String> header, List<List<String>> body, OutputStream out) {
		// 新建excel报表
		Workbook excel = new HSSFWorkbook();
		// 添加一个sheet
		Sheet hssfSheet = excel.createSheet(sheetName);
		// 往excel表格创建一行，excel的行号是从0开始的
		// 设置表头
		Row firstRow = hssfSheet.createRow(0);
		for (int columnNum = 0; columnNum < header.size(); columnNum++) {
			// 创建单元格
			Cell hssfCell = firstRow.createCell(columnNum);
			// 设置单元格的值
			hssfCell.setCellValue(header.size() < columnNum ? "-" : header.get(columnNum));
		}
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < body.size() + 7; i++) {
			hssfSheet.setColumnWidth((short) i, (short) (28 * 200));
		}
 
		// 设置主体数据
		for (int rowNum = 0; rowNum < body.size(); rowNum++) {
			// 往excel表格创建一行，excel的行号是从0开始的
			Row hssfRow = hssfSheet.createRow(rowNum + 1);
			List<String> data = body.get(rowNum);
			for (int columnNum = 0; columnNum < data.size(); columnNum++) {
				// 创建单元格
				Cell hssfCell = hssfRow.createCell(columnNum);
				// 设置单元格的值
				hssfCell.setCellValue(data.size() < columnNum ? "-" : data.get(columnNum));
			}
		}
		try {
			excel.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

     
}