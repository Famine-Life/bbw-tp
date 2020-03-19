package com.wsk.service;

import com.wsk.bean.Users;

import java.util.List;

/**
 * 用户接口
 */
public interface UsersService {
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);

    List<Users> selectAll();

    List<Users> getAllForeach(List<Integer> list);

}

