package com.wsk.controller;

import com.wsk.bean.Users;
import com.wsk.pojo.OrderForm;
import com.wsk.response.BaseResponse;
import com.wsk.service.OrderFormService;
import com.wsk.service.UsersService;
import com.wsk.tool.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台管理面板
 * 负责处理后台界面获取所有订单，用户, 商品信息的请求
 * 以及处理更新、删除的请求
 *
 */
@Slf4j
@Controller
public class Admin {

    @Resource
    UsersService usersService;

    @Resource
    OrderFormService orderFormService;

    /**
     * 获取订单信息
     * @return
     */
    @RequestMapping(value = "/admin.do")
    public String getAdmins(HttpServletRequest request, Model model){
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        //判断是否登录
        if(StringUtils.getInstance().isNullOrEmpty(userInfo)){
            return "redirect:login.do";
        }
        //判断当前登录者是否为管理员, 不是则返回主页
        if(!userInfo.getIsManager()){
            return "/home.do";
        }
        model.addAttribute("userInfo",userInfo);
        return "page/admin/admin";
    }


    /**
     * 返回所有用户信息
     * 返回layui需要的数据格式
     *     {"code":0,"msg":"","count":1000,"data":[{}] }
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getAllUsers.do")
    public Map<String,Object> getAllUsers(HttpServletRequest request){
        log.info("getAllUsers.do");
        //查用户数据
        List<Users> usersList = usersService.selectAll();
//        for (Users u:usersList) {
//            System.out.println(u.toString());
//        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",1000);
        map.put("data",usersList);

        return map;
    }

    /**
     * 返回所有订单信息
     * 返回layui需要的数据格式
     *     {"code":0,"msg":"","count":1000,"data":[{}] }
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getAllOrders.do")
    public Map<String,Object> getAllOrders(HttpServletRequest request){
        log.info("getAllOrders.do");
        //查用户数据
        List<OrderForm> ordersList = orderFormService.selectAll();
//        for (OrderForm o:ordersList) {
//            System.out.println(o.toString());
//        }
        HashMap<String, Object> order_map = new HashMap<>();
        order_map.put("code",0);
        order_map.put("msg","success");
        order_map.put("count",1000);
        order_map.put("data",ordersList);

        return order_map;
    }

    /**
     * 用户删除，(传递id数组)
     * @param list
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteUsers.do")
    public BaseResponse deleteUsers(@RequestParam(value = "list") int[] list){
        log.info("deleteUsers.do");
        for (int value : list) {
            //System.out.println(value);
            int i = usersService.deleteByPrimaryKey(value);
            if(i==1){
                log.info("用户"+value+"删除成功!");
            }else{
                log.info("用户"+value+"删除失败!");
                return BaseResponse.fail("fail");
            }
        }
        return BaseResponse.success("success");
    }

    /**
     * 订单删除
     * @param list
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteOrders.do")
    public BaseResponse deleteOrders(@RequestParam(value = "list") int[] list){
        log.info("deleteOrders.do");
        for (int value : list) {
            //System.out.println(value);
            OrderForm orderForm = new OrderForm();
            orderForm.setId(value);
            orderForm.setDisplay(0);
            int i = orderFormService.updateByPrimaryKeySelective(orderForm);
            if(i==1){
                log.info("订单"+value+"删除成功!");
            }else{
                log.info("订单"+value+"删除失败!");
                return BaseResponse.fail("fail");
            }
        }
        return BaseResponse.success("success");
    }

    /**
     * 用户更新
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updateUser.do")
    public BaseResponse updateUser(Users user){
        log.info("updateUser.do");
        log.info(user.toString());
        int i = usersService.updateByPrimaryKeySelective(user);
        if (i!=1){
            log.info("更新失败");
            return BaseResponse.fail("更新失败");
        }
        log.info("更新成功");
        return BaseResponse.success("success");
    }

    /**
     * 用户更新
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updateOrder.do")
    public BaseResponse updateOrder(OrderForm orderForm){
        log.info("updateOrder.do");
        log.info(orderForm.toString());
        int i = orderFormService.updateByPrimaryKeySelective(orderForm);
        if (i!=1){
            log.info("更新失败");
            return BaseResponse.fail("更新失败");
        }
        log.info("更新成功");
        return BaseResponse.success("success");
    }

}
