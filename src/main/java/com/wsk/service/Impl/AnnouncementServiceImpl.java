package com.wsk.service.Impl;

import com.wsk.bean.Announcement;
import com.wsk.bean.AnnouncementExample;
import com.wsk.dao.AnnouncementMapper;
import com.wsk.service.AnnouncementService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Resource
    private AnnouncementMapper announcementMapper;

    @Override
    public long countByExample(AnnouncementExample example) {
        return 0;
    }

    @Override
    public int deleteByExample(AnnouncementExample example) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Announcement record) {
        return 0;
    }

    @Override
    public int insertSelective(Announcement record) {
        return 0;
    }

    @Override
    public List<Announcement> selectByExample(AnnouncementExample example) {
        return null;
    }

    @Override
    public Announcement selectByPrimaryKey(Integer id) {
        return announcementMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(Announcement record, AnnouncementExample example) {
        return 0;
    }

    @Override
    public int updateByExample(Announcement record, AnnouncementExample example) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(Announcement record) {
        return announcementMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Announcement record) {
        return 0;
    }
}
