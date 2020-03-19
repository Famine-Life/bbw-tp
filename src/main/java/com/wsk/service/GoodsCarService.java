package com.wsk.service;

import com.wsk.pojo.GoodsCar;

import java.util.List;

/**
 * 购物车业务接口
 */
public interface GoodsCarService {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsCar record);

    int insertSelective(GoodsCar record);

    GoodsCar selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsCar record);

    int updateByPrimaryKey(GoodsCar record);

    List<GoodsCar> selectByUid(int uid);
}
