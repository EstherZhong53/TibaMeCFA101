package com.itemphotos.model;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import com.works.model.WorkVO;

public class ItemPhotosService {

	private ItemPhotosDAO_interface dao;

	public ItemPhotosService() {
		dao = new ItemPhotosDAO();
	}

	public ItemPhotosVO addItemPhotos(Integer ipItemId, String ipItem, java.sql.Date ipUpdate) throws IOException {

		ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
		byte[]pic = dao.insertItemPhoto(ipItem);
		itemPhotosVO.setIpItemId(ipItemId);
		itemPhotosVO.setIpItem(pic); 
		itemPhotosVO.setIpUpdate(ipUpdate);
		dao.insert(itemPhotosVO);

		return itemPhotosVO;
	}


	
	
	public String getOneItemPic(Integer ipId) {
		byte[] img = dao.getOnePic(ipId);
		String data = Base64.getEncoder().encodeToString(img);
		System.out.println(data);
		return data;
		
	}
	
	public void addIpItem(Integer ipItemId, byte[] ipItem) {
		ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
		itemPhotosVO.setIpItemId(ipItemId);
		itemPhotosVO.setIpItem(ipItem);
		dao.insert(itemPhotosVO);
	}
	
	public List<ItemPhotosVO> getItemPhoto(Integer ipItemId){
		return dao.getItemPhoto(ipItemId);
	}
	
	public void delete(Integer ipId) {
		dao.delete(ipId);
	}
	
	
	public List<ItemPhotosVO> getOneList(Integer ipItemId){
		return dao.getOneList(ipItemId);
	}
	

	public static void main(String [] args) {
		ItemPhotosService ivc = new ItemPhotosService();
		try {
			//新增圖片
			ivc.addItemPhotos(10, "InsertPic/9.jpg", java.sql.Date.valueOf("2021-07-07"));
			//更新圖片
//			ivc.updateItemPhotos(8, 2, "test/1.jpg", java.sql.Date.valueOf("2021-07-07"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
	}
	
	
	
//----------------------------TestMainMethod----------------------------		
//public static void main(String [] args) throws ClassNotFoundException, SQLException {	
//		  ItemPhotosDAO dao = new ItemPhotosDAO();
	  
	  
// ----------------------------insert----------------------------
//			ItemPhotosVO itemPhotosVO = new ItemPhotosVO();
//			itemPhotosVO.setIpItemId(1);
//			itemPhotosVO.setIpItem(null); 
//			itemPhotosVO.setIpUpdate(java.sql.Date.valueOf("2021-02-01"));
//			dao.insert(itemPhotosVO);

		
// ----------------------------delete----------------------------	  
//			dao.delete(7);
//			System.out.println("OK");
	  
	
// ----------------------------Update----------------------------
//			ItemPhotosVO itemVO2 = new ItemPhotosVO();
//			itemVO2.setIpId(1);
//			itemVO2.setIpItemId(1);
//			itemVO2.setIpItem(null);	
//			itemVO2.setIpUpdate(java.sql.Date.valueOf("2021-02-01"));	
//			dao.update(itemVO2);
//			System.out.println("OK");	  
	
	
// ----------------------------全部列出----------------------------	  
//		  List<ItemTypeVO> list = dao.getAll();
//		  for(ItemTypeVO itemTypeVO : list) {
//			  System.out.println(itemTypeVO.getItemtId()+",");
//			  System.out.println(itemTypeVO.getItemtName()+",");
//		  }
//		}
	
}