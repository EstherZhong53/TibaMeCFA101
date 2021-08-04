package com.itemphotos.model;

import java.util.*;

public interface ItemPhotosDAO_interface {
    public void insert(ItemPhotosVO itemPhotosVO); //新增
    public void delete(Integer ipId); //刪除
    public List<ItemPhotosVO> getItemPhoto(Integer ipItemId); //以ipItemId取得圖片
    public byte[] insertItemPhoto(String path); //新增圖片
	public byte[] getOnePic(Integer ipId);
	public List<ItemPhotosVO> getOneList(Integer ipItemId);
}