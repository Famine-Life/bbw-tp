package com.wsk.controller;

import com.wsk.bean.Users;
import com.wsk.pojo.UserInformation;
import com.wsk.pojo.UserPassword;
import com.wsk.response.BaseResponse;
import com.wsk.service.UserPasswordService;
import com.wsk.service.UsersService;
import com.wsk.tool.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 忘记密码，检查密码是否正确控制器，但是已关闭功能，可删
 */
@RestController
public class ForgetController {
    @Resource
    private UserPasswordService userPasswordService;
    @Resource
    private UsersService userInformationService;

    @RequestMapping(value = "checkCode.do", method = {RequestMethod.POST, RequestMethod.GET})
    public Map checkPhone(HttpServletRequest request, Model model,
                          @RequestParam String code, @RequestParam String token) {
        Map<String, Integer> map = new HashMap<>();
        String name = request.getParameter("name");
        if (!StringUtils.getInstance().isNullOrEmpty(name)) {
            request.getSession().setAttribute("name", name);
        }
        String checkCodeToken = (String) request.getSession().getAttribute("token");
        if (StringUtils.getInstance().isNullOrEmpty(checkCodeToken) || !checkCodeToken.equals(token)) {
            map.put("result", 0);
            return map;
        }
        //验证码错误
        if (!checkCodePhone(code, request)) {
            map.put("result", 0);
            return map;
        }
        map.put("result", 1);
        return map;
    }

    //更新密码
    @RequestMapping("updatePassword.do")
    public BaseResponse updatePassword(HttpServletRequest request, Model model,
                                       @RequestParam String password, @RequestParam String token) {
        //防止重复提交
        String updatePasswordToken = (String) request.getSession().getAttribute("token");
        if (StringUtils.getInstance().isNullOrEmpty(updatePasswordToken) || !updatePasswordToken.equals(token)) {
            return BaseResponse.fail();
        }
        UserPassword userPassword = new UserPassword();
        String newPassword = StringUtils.getInstance().getMD5(password);

        Users userInfo = (Users) request.getSession().getAttribute("userInfo");

        String uid = userInfo.getSid();
        int id = userPasswordService.selectByUid(Integer.valueOf(uid)).getId();
        userPassword.setId(id);
        userPassword.setUid(Integer.valueOf(uid));
        userPassword.setModified(new Date());
        userPassword.setPassword(newPassword);
        int result;
        try {
            result = userPasswordService.updateByPrimaryKeySelective(userPassword);
        } catch (Exception e) {
            return BaseResponse.fail();
        }
        //更新失败
        if (result != 1) {
            return BaseResponse.fail();
        }
        Users user = userInformationService.selectByPrimaryKey(Integer.valueOf(uid));
        request.getSession().setAttribute("userInfo", user);
        return BaseResponse.success();
    }

    //check the phone`s code
    private boolean checkCodePhone(String codePhone, HttpServletRequest request) {
        String trueCodePhone = "12251103";
        return codePhone.equals(trueCodePhone);
    }
}
