package com.wsk.controller;

import com.wsk.bean.ShopContextBean;
import com.wsk.bean.ShopInformationBean;
import com.wsk.bean.UserWantBean;
import com.wsk.bean.Users;
import com.wsk.pojo.*;
import com.wsk.service.*;
import com.wsk.token.TokenProccessor;
import com.wsk.tool.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理关于商品的各种请求
 */
@Controller
@Slf4j
public class GoodsController {
    @Resource
    private ShopInformationService shopInformationService;
    @Resource
    private ShopContextService shopContextService;
    @Resource
    private UsersService usersService;
    @Resource
    private SpecificeService specificeService;
    @Resource
    private ClassificationService classificationService;
    @Resource
    private AllKindsService allKindsService;

    //进入到发布商品页面
    @RequestMapping(value = "/publish_product.do", method = RequestMethod.GET)
    public String publish(HttpServletRequest request, Model model) {
        log.info("进入发布商品页面, pulish_product.do!");
        //先判断用户有没有登录
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            //如果没有登录
            return "redirect:/login.do";
        } else {
            model.addAttribute("userInfo", userInfo);
        }

        String goodsToken = TokenProccessor.getInstance().makeToken();
        request.getSession().setAttribute("goodsToken", goodsToken);
        model.addAttribute("shopInformation", new ShopInformation());
        model.addAttribute("action", 1);
        model.addAttribute("token", goodsToken);
        return "page/publish_product";
    }

    //模糊查询商品
    @RequestMapping(value = "/findShopByName.do")
    public String findByName(HttpServletRequest request, Model model,
                             @RequestParam String name) {
        try {
            List<ShopInformation> shopInformations = shopInformationService.selectByName(name);
            Users userInfo = (Users) request.getSession().getAttribute("userInfo");
            if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
                Users user = new Users();
                model.addAttribute("userInfo", user);
            } else {
                model.addAttribute("userInfo", userInfo);
            }
            List<ShopInformationBean> shopInformationBeans = new ArrayList<>();
            String sortName;
            for (ShopInformation shopInformation : shopInformations) {
                int sort = shopInformation.getSort();
                sortName = getSort(sort);
                ShopInformationBean shopInformationBean = new ShopInformationBean();
                shopInformationBean.setId(shopInformation.getId());
                shopInformationBean.setName(shopInformation.getName());
                shopInformationBean.setLevel(shopInformation.getLevel());
                shopInformationBean.setRemark(shopInformation.getRemark());
                shopInformationBean.setPrice(shopInformation.getPrice().doubleValue());
                shopInformationBean.setQuantity(shopInformation.getQuantity());
                shopInformationBean.setTransaction(shopInformation.getTransaction());
                shopInformationBean.setSort(sortName);
                shopInformationBean.setUid(shopInformation.getUid());
                shopInformationBean.setImage(shopInformation.getImage());
                shopInformationBeans.add(shopInformationBean);
            }
            model.addAttribute("shopInformationBean", shopInformationBeans);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:mall_page.do";
        }
        return "page/mall_page";
    }

    //进入查看商品详情
    @RequestMapping(value = "/selectById.do")
    public String selectById(@RequestParam int id,
                             HttpServletRequest request, Model model) {

        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            userInfo = new Users();
            model.addAttribute("userInfo", userInfo);
        }
        try {
            ShopInformation shopInformation = shopInformationService.selectByPrimaryKey(id);
            //System.out.println(shopInformation);
            model.addAttribute("shopInformation", shopInformation);
            List<ShopContext> shopContexts = shopContextService.selectById(id);
            List<ShopContextBean> shopContextBeans = new ArrayList<>();
            for (ShopContext s : shopContexts) {
                ShopContextBean shopContextBean = new ShopContextBean();
               // System.out.println(s.getUid());
                Users u = usersService.selectByPrimaryKey(s.getUid());
                shopContextBean.setContext(s.getContext());
                shopContextBean.setId(s.getId());
                shopContextBean.setModified(s.getModified());
//                System.out.println("u.getSid():"+u.getSid());
//                System.out.println("Integer:"+Integer.parseInt(u.getSid()));
                shopContextBean.setUid(Integer.valueOf(u.getSid()));
                shopContextBean.setUsername(u.getName());
                shopContextBeans.add(shopContextBean);
            }
            String sort = getSort(shopInformation.getSort());
            String goodsToken = TokenProccessor.getInstance().makeToken();
            request.getSession().setAttribute("goodsToken", goodsToken);
            model.addAttribute("token", goodsToken);
            model.addAttribute("sort", sort);
            model.addAttribute("userInfo", userInfo);
            model.addAttribute("shopContextBeans", shopContextBeans);
            return "page/product_info";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }
    }


    //通过id查看商品的详情
    @RequestMapping(value = "/findShopById.do")
    @ResponseBody
    public ShopInformation findShopById(@RequestParam int id) {
        return shopInformationService.selectByPrimaryKey(id);
    }

    //通过分类选择商品
    @RequestMapping(value = "/selectBySort.do")
    @ResponseBody
    public List<ShopInformation> selectBySort(@RequestParam int sort) {
        return shopInformationService.selectBySort(sort);
    }

    //分页查询
    @RequestMapping(value = "/selectByCounts.do")
    @ResponseBody
    public List<ShopInformation> selectByCounts(@RequestParam int counts) {
        Map<String, Integer> map = new HashMap<>();
        map.put("start", (counts - 1) * 12);
        map.put("end", 12);
        return shopInformationService.selectTen(map);
    }
//    //通过id查看商品详情
//    @RequestMapping(value = "/showShop")
//    public String showShop(@RequestParam int id, HttpServletRequest request, Model model) {
//        ShopInformation shopInformation =
//    }

    //获取最详细的分类，第三层
    private Specific selectSpecificBySort(int sort) {
        return specificeService.selectByPrimaryKey(sort);
    }

    //获得第二层分类
    private Classification selectClassificationByCid(int cid) {
        return classificationService.selectByPrimaryKey(cid);
    }

    //获得第一层分类
    private AllKinds selectAllKindsByAid(int aid) {
        return allKindsService.selectByPrimaryKey(aid);
    }

    private String getSort(int sort) {
        StringBuilder sb = new StringBuilder();
        Specific specific = selectSpecificBySort(sort);
        int cid = specific.getCid();
        Classification classification = selectClassificationByCid(cid);
        int aid = classification.getAid();
        AllKinds allKinds = selectAllKindsByAid(aid);
        String allName = allKinds.getName();
        sb.append(allName);
        sb.append("-");
        sb.append(classification.getName());
        sb.append("-");
        sb.append(specific.getName());
        return sb.toString();
    }

}
