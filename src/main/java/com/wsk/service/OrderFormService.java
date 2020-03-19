package com.wsk.service;

import com.wsk.pojo.OrderForm;

import java.util.List;

/**
 * 订单接口
 */
public interface OrderFormService {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderForm record);

    int insertSelective(OrderForm record);

    OrderForm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderForm record);

    int updateByPrimaryKey(OrderForm record);

    int getCounts(int uid);

    List<OrderForm> selectByUid(int uid, int start);
    List<OrderForm> selectAllByUid(int uid);

    List<OrderForm> selectAll();
}
