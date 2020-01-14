package com.KHCafeErp.www.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.KHCafeErp.www.dto.OrderBase;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.Warehousing;

 
public class ExcelWriter {
    
	SimpleDateFormat form = new SimpleDateFormat("yyyyMMdd");
	Date time = new Date();
	
	String date = form.format(time);
	
    public void placingOrderXls(List<PlacingOrder> list) {
        // 워크북 생성
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 워크시트 생성
        HSSFSheet sheet = workbook.createSheet();
        // 행 생성
        HSSFRow row = sheet.createRow(0);
        // 쎌 생성
        HSSFCell cell;
        
        // 헤더 정보 구성
        cell = row.createCell(0);
        cell.setCellValue("발주 번호");
        
        cell = row.createCell(1);
        cell.setCellValue("지점명");
        
        cell = row.createCell(2);
        cell.setCellValue("발주 날짜");
        
        cell = row.createCell(3);
        cell.setCellValue("총 발주 수량");
        
        cell = row.createCell(4);
        cell.setCellValue("총 발주 금액");
        
        cell = row.createCell(5);
        cell.setCellValue("발주 상태");
        
        cell = row.createCell(6);
        cell.setCellValue("입고 상태");
        
        // 리스트의 size 만큼 row를 생성
        PlacingOrder po;
        for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
        	po = list.get(rowIdx);
            
            // 행 생성
            row = sheet.createRow(rowIdx+1);
            
            cell = row.createCell(0);
            cell.setCellValue(po.getPlacingOrderNo());
            
            cell = row.createCell(1);
            cell.setCellValue(po.getShopName());
            
            cell = row.createCell(2);
            cell.setCellValue(po.getPlacingOrderDate());
            
            cell = row.createCell(3);
            cell.setCellValue(po.getPlacingOrderCnt());
            
            cell = row.createCell(4);
            cell.setCellValue(po.getPlacingOrderPrice());
            
            cell = row.createCell(5);
            if(po.getPlacingOrderStatus()==0) {		 
				 cell.setCellValue("발주 확인 전");
			 } else if(po.getPlacingOrderStatus()==1) {
				 cell.setCellValue("발주 확인");				 				 
			 } else if(po.getPlacingOrderStatus()==2) {
				 cell.setCellValue("출고 대기");				 				 			 				 				 
			 } else if(po.getPlacingOrderStatus()==3) {
				 cell.setCellValue("출고 완료");				 				 			 				 				 				 
			 } else {
				 cell.setCellValue("");				 				 			 				 				 				 				 				 
			 }
            
            cell = row.createCell(6);
            if(po.getInStockStatus()==0) {		 
				 cell.setCellValue("입고 대기");			 				 
			 } else if(po.getInStockStatus()==1) {
				 cell.setCellValue("입고 완료");				 				 			 				 				 
			 } else {
				 cell.setCellValue("");				 				 			 				 				 				 				 				 
			 }
            
        }
        
        // 입력된 내용 파일로 쓰기
        String filename=date+"발주 목록.xls";
    	File file = new File("D:\\"+filename);
        FileOutputStream fos = null;
        
        try {
            fos = new FileOutputStream(file);
            workbook.write(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(workbook!=null) workbook.close();
                if(fos!=null) fos.close();
                
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
    
    public void productXls(List<Product> list) {
    	// 워크북 생성
    	HSSFWorkbook workbook = new HSSFWorkbook();
    	// 워크시트 생성
    	HSSFSheet sheet = workbook.createSheet();
    	// 행 생성
    	HSSFRow row = sheet.createRow(0);
    	// 쎌 생성
    	HSSFCell cell;
    	
    	// 헤더 정보 구성
    	cell = row.createCell(0);
    	cell.setCellValue("상품 코드");
    	
    	cell = row.createCell(1);
    	cell.setCellValue("상품 카테고리");
    	
    	cell = row.createCell(2);
    	cell.setCellValue("상품명");
    	
    	cell = row.createCell(3);
    	cell.setCellValue("지점명");
    	
    	cell = row.createCell(4);
    	cell.setCellValue("원가");
    	
    	cell = row.createCell(5);
    	cell.setCellValue("판매가");
    	
    	cell = row.createCell(6);
    	cell.setCellValue("제조사");

    	cell = row.createCell(7);
    	cell.setCellValue("상품 등록일");
    	
    	cell = row.createCell(8);
    	cell.setCellValue("판매 등록일");
    	
    	cell = row.createCell(9);
    	cell.setCellValue("판매 종료일");
    	
    	cell = row.createCell(10);
    	cell.setCellValue("판매 상태");
    	
    	// 리스트의 size 만큼 row를 생성
    	Product vo;
    	for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
    		vo = list.get(rowIdx);
    		
    		// 행 생성
    		row = sheet.createRow(rowIdx+1);
    		
    		cell = row.createCell(0);
        	cell.setCellValue(vo.getProductNo());
        	
        	cell = row.createCell(1);
        	cell.setCellValue(vo.getCategoryDetailName());
        	
        	cell = row.createCell(2);
        	cell.setCellValue(vo.getProductName());
        	
        	cell = row.createCell(3);
        	cell.setCellValue(vo.getShopName());
        	
        	cell = row.createCell(4);
        	cell.setCellValue(vo.getOriginPrice());
        	
        	cell = row.createCell(5);
        	cell.setCellValue(vo.getPrice());
        	
        	cell = row.createCell(6);
        	cell.setCellValue(vo.getProductOrigin());

        	cell = row.createCell(7);
        	cell.setCellValue(vo.getEnrollDate());
        	
        	cell = row.createCell(8);
        	cell.setCellValue(vo.getSelStartDate());
        	
        	cell = row.createCell(9);
        	cell.setCellValue(vo.getSelEndDate());
        	
        	cell = row.createCell(10);
        	cell.setCellValue(vo.getSelStatus());    		
    	}
    	
    	// 입력된 내용 파일로 쓰기
    	String filename=date+"상품 목록.xls";
    	File file = new File("D:\\"+filename);
    	FileOutputStream fos = null;
    	
    	try {
    		fos = new FileOutputStream(file);
    		workbook.write(fos);
    	} catch (FileNotFoundException e) {
    		e.printStackTrace();
    	} catch (IOException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    			if(workbook!=null) workbook.close();
    			if(fos!=null) fos.close();
    			
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    }
    
    public void releasetXls(List<Release> list) {
    	// 워크북 생성
    	HSSFWorkbook workbook = new HSSFWorkbook();
    	// 워크시트 생성
    	HSSFSheet sheet = workbook.createSheet();
    	// 행 생성
    	HSSFRow row = sheet.createRow(0);
    	// 쎌 생성
    	HSSFCell cell;
    	
    	// 헤더 정보 구성
    	cell = row.createCell(0);
    	cell.setCellValue("출고 번호");
    	
    	cell = row.createCell(1);
    	cell.setCellValue("발주 번호");
    	
    	cell = row.createCell(2);
    	cell.setCellValue("지점명");
    	
    	cell = row.createCell(3);
    	cell.setCellValue("상태");
    	
    	cell = row.createCell(4);
    	cell.setCellValue("출고일");
    	
    	// 리스트의 size 만큼 row를 생성
    	Release ro;
    	for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
    		ro = list.get(rowIdx);
    		
    		// 행 생성
    		row = sheet.createRow(rowIdx+1);
    		
    		cell = row.createCell(0);
    		cell.setCellValue(ro.getReleaseNo());
    		
    		cell = row.createCell(1);
    		cell.setCellValue(ro.getPlacingOrderNo());
    		
    		cell = row.createCell(2);
    		cell.setCellValue(ro.getShopName());
    		
    		cell = row.createCell(3);
    		if(ro.getReleaseStatus()==0) {
    			cell.setCellValue("출고 전");    			
    		} else if(ro.getReleaseStatus()==1) {
    			cell.setCellValue("출고 완료");    			    			
    		} else if(ro.getReleaseStatus()==2) {
    			cell.setCellValue("부분 출고");    			    			    			
    		} else {
    			cell.setCellValue("");    			    			    			    			
    		}
    		
    		cell = row.createCell(4);
    		cell.setCellValue(ro.getReleaseDate());	
    	}
    	
    	// 입력된 내용 파일로 쓰기
    	String filename=date+"출고 목록.xls";
    	File file = new File("D:\\"+filename);
    	FileOutputStream fos = null;
    	
    	try {
    		fos = new FileOutputStream(file);
    		workbook.write(fos);
    	} catch (FileNotFoundException e) {
    		e.printStackTrace();
    	} catch (IOException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    			if(workbook!=null) workbook.close();
    			if(fos!=null) fos.close();
    			
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    }
    
    public void orderXls(List<OrderBase> list) {
        // 워크북 생성
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 워크시트 생성
        HSSFSheet sheet = workbook.createSheet();
        // 행 생성
        HSSFRow row = sheet.createRow(0);
        // 쎌 생성
        HSSFCell cell;
        
        // 헤더 정보 구성
        cell = row.createCell(0);
        cell.setCellValue("주문 번호");
        
        cell = row.createCell(1);
        cell.setCellValue("유저 번호");
        
        cell = row.createCell(2);
        cell.setCellValue("지점명");
        
        cell = row.createCell(3);
        cell.setCellValue("주문 날짜");
        
        cell = row.createCell(4);
        cell.setCellValue("고객 요구사항");
        
        cell = row.createCell(5);
        cell.setCellValue("진행 상태");
        
        // 리스트의 size 만큼 row를 생성
        OrderBase ob;
        for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
        	ob = list.get(rowIdx);
            
            // 행 생성
            row = sheet.createRow(rowIdx+1);
            
            cell = row.createCell(0);
            cell.setCellValue(ob.getOrderNo());
            
            cell = row.createCell(1);
            cell.setCellValue(ob.getCusNo());
            
            cell = row.createCell(2);
            cell.setCellValue(ob.getShopName());
            
            cell = row.createCell(3);
            cell.setCellValue(ob.getOrderDate());
            
            cell = row.createCell(4);
            cell.setCellValue(ob.getCusReq());
            
            cell = row.createCell(5);
            if(ob.getOrderStatus()==0) {		 
				 cell.setCellValue("장바구니");
			 } else if(ob.getOrderStatus()==1) {
				 cell.setCellValue("주문완료");				 				 
			 } else if(ob.getOrderStatus()==2) {
				 cell.setCellValue("결제완료");				 				 			 				 				 
			 } else {
				 cell.setCellValue("");				 				 			 				 				 				 				 				 
			 }
            
        }
        
        // 입력된 내용 파일로 쓰기
        String filename=date+"주문 목록.xls";
    	File file = new File("D:\\"+filename);
        FileOutputStream fos = null;
        
        try {
            fos = new FileOutputStream(file);
            workbook.write(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(workbook!=null) workbook.close();
                if(fos!=null) fos.close();
                
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

	public void wareHouseXls(List<Warehousing> list) {
		 // 워크북 생성
       HSSFWorkbook workbook = new HSSFWorkbook();
       // 워크시트 생성
       HSSFSheet sheet = workbook.createSheet();
       // 행 생성
       HSSFRow row = sheet.createRow(0);
       // 쎌 생성
       HSSFCell cell;
       
       // 헤더 정보 구성
       cell = row.createCell(0);
       cell.setCellValue("입고 번호");
       
       cell = row.createCell(1);
       cell.setCellValue("발주 상품 번호");
       
       cell = row.createCell(2);
       cell.setCellValue("창고 번호");

       cell = row.createCell(3);
       cell.setCellValue("총 입고 수량");
       
       cell = row.createCell(4);
       cell.setCellValue("입고 등록일");
       
       cell = row.createCell(5);
       cell.setCellValue("입고 구분");
       
       cell = row.createCell(6);
       cell.setCellValue("입고 상태");

       cell = row.createCell(7);
       cell.setCellValue("거래처");
       
       // 리스트의 size 만큼 row를 생성
       Warehousing wh;
       for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
       	wh = list.get(rowIdx);
           
           // 행 생성
           row = sheet.createRow(rowIdx+1);
           
           cell = row.createCell(0);
           cell.setCellValue(wh.getWarehousingNo());
           
           cell = row.createCell(1);
           cell.setCellValue(wh.getPlacingOrderProductNo());
           
           cell = row.createCell(2);
           cell.setCellValue(wh.getStorageNo());
           
           cell = row.createCell(3);
           cell.setCellValue(wh.getProductCnt());
           
           cell = row.createCell(4);
           cell.setCellValue(wh.getInStockDate());
           
           cell = row.createCell(5);
           if(wh.getIsAutoInStock()==0) {
           	cell.setCellValue("비정규입고");            	
           } else if(wh.getIsAutoInStock()==1) {
           	cell.setCellValue("정규입고");            	
           } else {
           	cell.setCellValue("");            	            	
           }
           
           cell = row.createCell(6);
           if(wh.getInStockStatus()==0) {		 
				 cell.setCellValue("입고대기");
			 } else if(wh.getInStockStatus()==1) {
				 cell.setCellValue("입고완료");
			 } else {
				 cell.setCellValue("");				 				 			 				 				 				 				 				 
			 }
           
       }
       
       // 입력된 내용 파일로 쓰기
       String filename=date+"입고 목록.xls";
   	File file = new File("D:\\"+filename);
       FileOutputStream fos = null;
       
       try {
           fos = new FileOutputStream(file);
           workbook.write(fos);
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       } finally {
           try {
               if(workbook!=null) workbook.close();
               if(fos!=null) fos.close();
               
           } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
           }
       }
	}
}

