package com.item.model;

import java.util.*;

public interface ItemDAO_interface {
    public void insert(ItemVO itemVO); //新增
    public void update(ItemVO itemVO); //修改
    public ItemVO findByPrimaryKey(Integer itemId); //以itemId(商品ID)查詢
    public List<ItemVO> getAll(); //全部列出

}
