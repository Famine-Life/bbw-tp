package com.wsk.service.Impl;

import com.wsk.bean.Users;
import com.wsk.dao.UsersMapper;
import com.wsk.service.UsersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Resource
    UsersMapper usersmapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int i = usersmapper.deleteByPrimaryKey(id.toString());
        return i;
    }

    @Override
    public int insert(Users record) {
        return this.usersmapper.insert(record);
    }

    @Override
    public int insertSelective(Users record) {
        return this.usersmapper.insertSelective(record);
    }

    @Override
    public Users selectByPrimaryKey(Integer id) {
        return this.usersmapper.selectByPrimaryKey(id.toString());
    }

    @Override
    public int updateByPrimaryKeySelective(Users record) {
        return this.usersmapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Users record) {
        return this.usersmapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Users> selectAll() {
        return this.usersmapper.selectAll();
    }

    @Override
    public List<Users> getAllForeach(List<Integer> list) {
        return this.usersmapper.getAllForeach(list);
    }
}
