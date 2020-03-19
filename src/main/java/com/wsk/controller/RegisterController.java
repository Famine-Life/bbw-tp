package com.wsk.controller;

import com.wsk.bean.Users;
import com.wsk.dao.AdminInformationMapper;
import com.wsk.dao.UsersMapper;
import com.wsk.pojo.UserPassword;
import com.wsk.response.BaseResponse;
import com.wsk.service.UserPasswordService;
import com.wsk.tool.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * 注册控制器，负责注册请求
 */
@Controller
@Slf4j
public class RegisterController {
    @Resource
    private UserPasswordService userPasswordService;

    @Autowired
    private UsersMapper usersMapper;
    private Object Exception;

    //开始注册用户
    @RequestMapping("/insertUser.do")
    @ResponseBody
    public BaseResponse insertUser(HttpServletRequest request,
                                   @RequestParam("sid") String sid,
                                   @RequestParam("username") String username,
                                   @RequestParam("password") String password,
                                   @RequestParam("password2") String password2,Model model) {
        log.info("insertUser.do ~");
        Users user = new Users();
        user.setSid(sid);
        user.setName(username);
        user.setPassword(password);
        user.setIsManager(false);    //默认false
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        log.info("注册信息为："+user.toString());

        //判断用户是否存在
        Users isExist = usersMapper.selectByPrimaryKey(sid);
        log.info("用户是否存在:"+isExist);
        //不存在，且两次密码输入相同则执行插入语句
        if ((isExist==null)&&(password.equals(password2))) {
            log.info("密码一致！");
            int result = usersMapper.insertSelective(user);
            if (result == 1) {
                //sucess
                request.getSession().setAttribute("user", user);
                log.info("insert success!");
                return BaseResponse.success("注册成功！快去登陆吧~");
            }else{
                log.error("sql插入语句执行失败");
                return BaseResponse.fail("注册失败，请重新尝试！");
            }
        }else {
            //失败
            log.error("注册失败：用户已存在！");
            return BaseResponse.fail("用户存在");
        }

    }
}
