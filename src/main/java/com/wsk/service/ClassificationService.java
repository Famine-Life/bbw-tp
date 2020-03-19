package com.wsk.service;

import com.wsk.pojo.Classification;

import java.util.List;

/**
 * 发布的商品分类
 */
public interface ClassificationService {
    int deleteByPrimaryKey(Integer id);

    int insert(Classification record);

    int insertSelective(Classification record);

    Classification selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Classification record);

    int updateByPrimaryKey(Classification record);

    List<Classification> selectByAid(int aid);
}
