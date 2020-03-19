package com.wsk.controller;

import com.sun.org.apache.xpath.internal.objects.XNull;
import com.wsk.bean.Announcement;
import com.wsk.bean.Users;
import com.wsk.response.BaseResponse;
import com.wsk.service.AnnouncementService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class AnnouncementController {

    @Resource
    AnnouncementService announcementService;

    /**
     * 获取公告编辑页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "edit_announcement.do",method = RequestMethod.GET)
    public String selectAnnounce(HttpServletRequest request, Model model,HttpServletResponse res) throws IOException {
        Users userInfo = (Users)request.getSession().getAttribute("userInfo");
        if(userInfo==null){
            res.sendRedirect("/login.do");
        }
        model.addAttribute("userInfo",userInfo);

        Announcement announcement = announcementService.selectByPrimaryKey(1);
        model.addAttribute("announce",announcement);
        return "page/edit_announcement";
    }

    /**
     * 更新公告
     * @param announce
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "edit_announcement.do",method = RequestMethod.POST)
    public BaseResponse updateAnnounce(@RequestParam(value = "announce") String announce, HttpServletRequest request, Model model, HttpServletResponse res){
        Announcement announcement = new Announcement();
        announcement.setId(1);
        announcement.setAnnouncement(announce);
        int i = announcementService.updateByPrimaryKeySelective(announcement);
        if(i!=1){
            return BaseResponse.fail("修改失败!");
        }
        return BaseResponse.success("修改成功");
    }

}
