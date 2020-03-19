package com.wsk.controller;

import com.alibaba.fastjson.JSONObject;
import com.wsk.bean.GoodsCarBean;
import com.wsk.bean.ShopInformationBean;
import com.wsk.bean.Users;
import com.wsk.dao.UsersMapper;
import com.wsk.pojo.*;
import com.wsk.response.BaseResponse;
import com.wsk.service.*;
import com.wsk.token.TokenProccessor;
import com.wsk.tool.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;


/**
 *  用户控制器，包含登录，退出，查看购物车, 查看订单等等请求的处理操作
 *  userController
 */
@Controller
@Slf4j
public class UserController {
    @Resource
    private UserPasswordService userPasswordService;
    @Resource
    private UserCollectionService userCollectionService;
    @Resource
    private UserReleaseService userReleaseService;
    @Resource
    private UsersMapper usersMapper;
    @Resource
    private BoughtShopService boughtShopService;

    @Resource
    private ShopCarService shopCarService;
    @Resource
    private OrderFormService orderFormService;
    @Resource
    private GoodsOfOrderFormService goodsOfOrderFormService;
    @Resource
    private UserStateService userStateService;
    @Resource
    private ShopInformationService shopInformationService;
    @Resource
    private GoodsCarService goodsCarService;
    @Resource
    private SpecificeService specificeService;
    @Resource
    private ClassificationService classificationService;
    @Resource
    private AllKindsService allKindsService;
    @Resource
    private ShopContextService shopContextService;

    //进入登录界面
    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String login(HttpServletRequest request, Model model) {
        String token = TokenProccessor.getInstance().makeToken();
        log.info("进入登录界面，token为:" + token);
//        request.getSession().setAttribute("token", token);
//        Users user = (Users) request.getSession().getAttribute("userInfo");
//        model.addAttribute("userInfo",user);
//        model.addAttribute("token", token);
//        log.info(user.toString());
        return "page/login_page";
    }

//    /**
//     *
//     * @param request
//     * @param sid 登录账号
//     * @param pwd 登录密码
//     * @param model
//     * @return
//     *返回登录成功的提示信息，或者forword到别的路径
//     * 字段校验
//     */
//    //登录操作，用户信息存入session
    @RequestMapping(value = "/signin.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse signIn(HttpServletRequest request,
                          @RequestParam("sid") String sid,
                          @RequestParam("password") String pwd, Model model){
        log.info("singn in 方法");
        HttpSession session = request.getSession();

        //判断用户是否存在
        Users user = usersMapper.selectByPrimaryKey(sid);
        log.info("用户是否存在:"+user.toString());
        //用户存在，密码匹配
        if ((user!=null)&&(user.getPassword().equals(pwd))){
            //验证账号密码
            Boolean comfirm  = user.getPassword().equals(pwd);
            if(comfirm){
                //密码正确
                log.info("密码正确！");
                session.setAttribute("userInfo",user);
                session.setAttribute("uid",user.getSid());
                log.info("登录成功！");
                model.addAttribute("userInfo",user);
                return BaseResponse.success("登录成功！").add("username",user.getName());
            }else{
                //密码错误
                log.info("用户输入密码和数据库不匹配！");
                return BaseResponse.fail("账号或密码错误!");
            }
        }else{
            //用户不存在
            log.info("用户输入密码和数据库不匹配！");
            return BaseResponse.fail("账号或密码错误!");
        }
    }

    //退出
    @RequestMapping(value = "/logout.do")
    public String logout(HttpServletRequest request) {
        try {
            request.getSession().removeAttribute("userInfo");
            request.getSession().removeAttribute("uid");
            System.out.println("logout");
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/home.do";
        }
        return "redirect:/";
    }


    //查看用户基本信息
    @RequestMapping(value = "/personal_info.do")
    public String personalInfo(HttpServletRequest request, Model model) {
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            return "redirect:/login.do";
        }
        String personalInfoToken = TokenProccessor.getInstance().makeToken();
        request.getSession().setAttribute("personalInfoToken", personalInfoToken);
        model.addAttribute("token", personalInfoToken);
        model.addAttribute("userInfo", userInfo);
        return "page/personal/personal_info";
    }


    //修改用户信息
    /**
     * sid是必传的，已登录，必定有sid,且sid不可更改
     * @param request
     * @param name
     * @param token
     * @param sid
     * @return"
     */
    @RequestMapping(value = "/certification.do", method = RequestMethod.POST)
    @ResponseBody
    public Map certification(HttpServletRequest request,
                             @RequestParam(value = "name",required = false) String name,
                             @RequestParam(value = "token",required = false) String token,
                             @RequestParam(value = "password",required = false) String password,
                             @RequestParam(value = "sid") String sid) {
        log.info("certification.do!");
        Map<String, Integer> map = new HashMap<>();
        map.put("result", 0);
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        //该用户还没有登录
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            return map;
        }
//        String certificationToken = (String) request.getSession().getAttribute("personalInfoToken");
//        //防止重复提交
////        boolean b = token.equals(certificationToken);
//        if (StringUtils.getInstance().isNullOrEmpty(certificationToken)) {
//            return map;
//        } else {
//            request.getSession().removeAttribute("certificationToken");
//        }
        if (name != null) {
            name = StringUtils.getInstance().replaceBlank(name);
            log.info("修改的名字为："+name);
            userInfo.setName(name);
        }
        if (password!=null&&!password.equals("")) {
            userInfo.setPassword(password);
            log.info("修改的密码为："+password);
        }
        log.info(userInfo.toString());
        //执行数据库更新操作
        int result = usersMapper.updateByPrimaryKeySelective(userInfo);
        log.info("数据库语句结果："+String.valueOf(result));
        if (result != 1) {
            //更新失败，认证失败
            return map;
        }
        log.info("更改用户信息操作完成!");
        request.getSession().setAttribute("userInfo", userInfo);
        map.put("result", 1);
        return map;
    }


    //收藏
    //add the userCollection
    @RequestMapping(value = "/addUserCollection.do")
    @ResponseBody
    public BaseResponse addUserCollection(HttpServletRequest request, @RequestParam int sid) {
        //determine whether the user exits
        if (StringUtils.getInstance().isNullOrEmpty(request.getSession().getAttribute("userInformation"))) {
            //if the user no exits in the session,
            return BaseResponse.fail();
        }
        UserCollection userCollection = new UserCollection();
        userCollection.setModified(new Date());
        userCollection.setSid(sid);
        userCollection.setUid((Integer) request.getSession().getAttribute("uid"));
        //begin insert the userCollection
        int result = userCollectionService.insertSelective(userCollection);
        if (result != 1) {
            return BaseResponse.fail();
        }
        return BaseResponse.success();
    }


    // delete the userCollection
    @RequestMapping(value = "/deleteUserCollection.do")
    @ResponseBody
    public BaseResponse deleteUserCollection(HttpServletRequest request, @RequestParam int ucid) {
        if (StringUtils.getInstance().isNullOrEmpty(request.getSession().getAttribute("userInformation"))) {
            return BaseResponse.fail();
        }
        UserCollection userCollection = new UserCollection();
//        userCollection.setUid((Integer) request.getSession().getAttribute("uid"));
//        userCollection.setSid(sid);
        userCollection.setId(ucid);
        userCollection.setModified(new Date());
        userCollection.setDisplay(0);
        int result;
        result = userCollectionService.updateByPrimaryKeySelective(userCollection);
        if (result != 1) {
            return BaseResponse.fail();
        }
        return BaseResponse.success();
    }

    //购物车开始。。。。。。。。。。。
    //getShopCarCounts.do
    @RequestMapping(value = "/getShopCarCounts.do")
    @ResponseBody
    public BaseResponse getShopCarCounts(HttpServletRequest request) {
        if (StringUtils.getInstance().isNullOrEmpty(request.getSession().getAttribute("userInfo"))) {
            return BaseResponse.fail();
        }
        int uid = (int) request.getSession().getAttribute("uid");
        int counts = getShopCarCounts(uid);
        return BaseResponse.success();
    }

    //查看购物车
    @RequestMapping(value = "/shopping_cart.do")
    public String selectShopCar(HttpServletRequest request, Model model) {
        log.info("进入购物车");
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            Users user = new Users();
            model.addAttribute("userInfo", user);
//            list.add(shopCar);
            return "redirect:/login.do";
        } else {
            model.addAttribute("userInfo", userInfo);
        }
        String uid = userInfo.getSid();
        List<GoodsCar> goodsCars = goodsCarService.selectByUid(Integer.parseInt(uid));
        List<GoodsCarBean> goodsCarBeans = new ArrayList<>();
        for (GoodsCar goodsCar : goodsCars) {
            GoodsCarBean goodsCarBean = new GoodsCarBean();
            goodsCarBean.setUid(goodsCar.getUid());
            goodsCarBean.setSid(goodsCar.getSid());
            goodsCarBean.setModified(goodsCar.getModified());
            goodsCarBean.setId(goodsCar.getId());
            goodsCarBean.setQuantity(goodsCar.getQuantity());
            ShopInformation shopInformation = shopInformationService.selectByPrimaryKey(goodsCar.getSid());
           // log.info(" goodsCar.getSid():"+goodsCar.getSid());
            goodsCarBean.setName(shopInformation.getName());
            goodsCarBean.setRemark(shopInformation.getRemark());
            goodsCarBean.setImage(shopInformation.getImage());
            goodsCarBean.setPrice(shopInformation.getPrice().doubleValue());
            goodsCarBean.setSort(getSort(shopInformation.getSort()));
            goodsCarBeans.add(goodsCarBean);
        }
        model.addAttribute("list", goodsCarBeans);
        return "page/shopping_cart";
    }

//    //通过购物车的id获取购物车里面的商品
//    @RequestMapping(value = "/selectGoodsOfShopCar")
//    @ResponseBody
//    public List<GoodsCar> selectGoodsCar(HttpServletRequest request) {
//        List<GoodsCar> list = new ArrayList<>();
//        GoodsCar goodsCar = new GoodsCar();
//        if (Empty.isNullOrEmpty(request.getSession().getAttribute("userInformation"))) {
//            list.add(goodsCar);
//            return list;
//        }
//        try {
//            int scid = shopCarService.selectByUid((Integer) request.getSession().getAttribute("uid")).getId();
//            list = goodsCarService.selectByUid(scid);
//            return list;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return list;
//        }
//    }

    //添加到购物车
    @RequestMapping(value = "/insertGoodsCar.do")
    @ResponseBody
    public BaseResponse insertGoodsCar(HttpServletRequest request, @RequestParam int id) {
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            log.info("购物车页面 userInfo不存在！");
            return BaseResponse.fail();
        }
        String uid = userInfo.getSid();
        GoodsCar goodsCar = new GoodsCar();
        goodsCar.setDisplay(1);
        goodsCar.setModified(new Date());
        goodsCar.setQuantity(1);
        goodsCar.setUid(Integer.parseInt(uid));
        goodsCar.setSid(id);
        log.info("test:"+goodsCar);
        int result = goodsCarService.insertSelective(goodsCar);
        log.info("result:"+result);
        return BaseResponse.success();
    }


    //删除购物车的商品
    @RequestMapping(value = "/deleteShopCar.do")
    @ResponseBody
    public BaseResponse deleteShopCar(HttpServletRequest request, @RequestParam int id, @RequestParam int sid) {
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            return BaseResponse.fail();
        }
        String uid = userInfo.getSid();
        GoodsCar goodsCar = new GoodsCar();
        goodsCar.setDisplay(0);
        goodsCar.setId(id);
        goodsCar.setSid(sid);
        goodsCar.setUid(Integer.parseInt(uid));
        int result = goodsCarService.updateByPrimaryKeySelective(goodsCar);
        if (result != 1) {
            return BaseResponse.fail();
        }
        return BaseResponse.success();
    }

    //发布商品
    @RequestMapping(value = "/insertGoods.do", method = RequestMethod.POST)
    public String insertGoods(@RequestParam String name, @RequestParam int level,
                              @RequestParam String remark, @RequestParam double price,
                              @RequestParam int sort, @RequestParam int quantity,
                              @RequestParam String token, @RequestParam(required = false) MultipartFile image,
                              @RequestParam int action, @RequestParam(required = false) int id,
                              HttpServletRequest request, Model model) {
        log.info("insertGoods.do");
        String goodsToken = (String) request.getSession().getAttribute("goodsToken");
        String publishProductToken = TokenProccessor.getInstance().makeToken();
        request.getSession().setAttribute("token",publishProductToken);
        //防止重复提交
        if (StringUtils.getInstance().isNullOrEmpty(goodsToken) || !goodsToken.equals(token)) {
            return "redirect:publish_product.do?error=1";
        } else {
            request.getSession().removeAttribute("goodsToken");
        }
//        //从session中获得用户的基本信息
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        model.addAttribute("userInfo", userInfo);
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            //如果用户不存在，
            return "redirect:/login.do";
        }
        name = StringUtils.getInstance().replaceBlank(name);
        remark = StringUtils.getInstance().replaceBlank(remark);
        //judge the data`s format
        if (StringUtils.getInstance().isNullOrEmpty(name) || StringUtils.getInstance().isNullOrEmpty(level) || StringUtils.getInstance().isNullOrEmpty(remark) || StringUtils.getInstance().isNullOrEmpty(price)
                || StringUtils.getInstance().isNullOrEmpty(sort) || StringUtils.getInstance().isNullOrEmpty(quantity) || name.length() > 25 || remark.length() > 122) {
            model.addAttribute("message", "请输入正确的格式!!!!!");
            model.addAttribute("token", goodsToken);
            request.getSession().setAttribute("goodsToken", goodsToken);
            return "page/publish_product";
        }
        //插入
        if (action == 1) {
            if (StringUtils.getInstance().isNullOrEmpty(image)) {
                model.addAttribute("message", "请选择图片!!!");
                model.addAttribute("token", goodsToken);
                request.getSession().setAttribute("goodsToken", goodsToken);
                return "redirect:publish_product.do?error=请插入图片";
            }
            String random;
            String path = "E:\\BBW-tp\\", save = "";
            random = "image\\" + StringUtils.getInstance().getRandomChar() + System.currentTimeMillis() + ".jpg";

//            StringBuilder thumbnails = new StringBuilder();
//            thumbnails.append(path);
//            thumbnails.append("image/thumbnails/");
//            StringBuilder wsk = new StringBuilder();
//            wsk.append(StringUtils.getInstance().getRandomChar()).append(System.currentTimeMillis()).append(".jpg");
//            thumbnails.append(wsk);
//        String fileName = "\\" + random + ".jpg";
            File file = new File(path, random);
            if (!file.exists()) {
                file.mkdir();
            }
            try {
                image.transferTo(file);
            } catch (Exception e) {
                e.printStackTrace();
            }

//            //创建缩略图文件夹
//            File thumbnailsFile = new File(thumbnails.toString());
//            if (!thumbnailsFile.exists()) {
//                thumbnailsFile.mkdir();
//            }
//            if (StringUtils.getInstance().thumbnails(path + random, thumbnails.toString())) {
//                save = "/images/thumbnails/" + wsk.toString();
//            } else {
//                return "redirect:publish_product.do?error=生成缩略图失败";
//            }
            //begin insert the shopInformation to the MySQL
            ShopInformation shopInformation = new ShopInformation();
            shopInformation.setName(name);
            shopInformation.setLevel(level);
            shopInformation.setRemark(remark);
            shopInformation.setPrice(new BigDecimal(price));
            shopInformation.setSort(sort);
            shopInformation.setQuantity(quantity);
            shopInformation.setModified(new Date());
            shopInformation.setImage(random);//This is the other uniquely identifies
            shopInformation.setThumbnails(save);
//        shopInformation.setUid(4);
            String uid_s = (String) request.getSession().getAttribute("uid");
            int uid = Integer.parseInt(uid_s);
            shopInformation.setUid(Integer.valueOf(uid));
            try {
                int result = shopInformationService.insertSelective(shopInformation);
                //插入失败？？？
                if (result != 1) {
                    model.addAttribute("message", "请输入正确的格式!!!!!");
                    model.addAttribute("token", goodsToken);
                    request.getSession().setAttribute("goodsToken", goodsToken);
                    return "page/publish_product";
                }
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("token", goodsToken);
                model.addAttribute("message", "请输入正确的格式!!!!!");
                request.getSession().setAttribute("goodsToken", goodsToken);
                return "page/publish_product";
            }
            int sid = shopInformationService.selectIdByImage(random);// get the id which is belongs shopInformation
            //将发布的商品的编号插入到用户的发布中
            UserRelease userRelease = new UserRelease();
            userRelease.setModified(new Date());
            userRelease.setSid(sid);
            userRelease.setUid(uid);
            try {
                int result = userReleaseService.insertSelective(userRelease);
                //如果关联失败，删除对应的商品和商品图片
                if (result != 1) {
                    //if insert failure,transaction rollback.
                    shopInformationService.deleteByPrimaryKey(sid);
//                shopPictureService.deleteByPrimaryKey(spid);
                    model.addAttribute("token", goodsToken);
                    model.addAttribute("message", "请输入正确的格式!!!!!");
                    request.getSession().setAttribute("goodsToken", goodsToken);
                    return "page/publish_product";
                }
            } catch (Exception e) {
                //if insert failure,transaction rollback.
                shopInformationService.deleteByPrimaryKey(sid);
                e.printStackTrace();
                model.addAttribute("token", goodsToken);
                model.addAttribute("message", "请输入正确的格式!!!!!");
                request.getSession().setAttribute("goodsToken", goodsToken);
                return "page/publish_product";
            }
            shopInformation.setId(sid);
            goodsToken = TokenProccessor.getInstance().makeToken();
            request.getSession().setAttribute("goodsToken", goodsToken);
            model.addAttribute("token", goodsToken);
            model.addAttribute("shopInformation", shopInformation);
            model.addAttribute("userInfo", userInfo);
            String sb = getSort(sort);
            model.addAttribute("sort", sb);
            model.addAttribute("action", 2);
            return "redirect:/my_publish_product_page.do";
        } else if (action == 2) {//更新商品
            ShopInformation shopInformation = new ShopInformation();
            shopInformation.setModified(new Date());
            shopInformation.setQuantity(quantity);
            shopInformation.setSort(sort);
            shopInformation.setPrice(new BigDecimal(price));
            shopInformation.setRemark(remark);
            shopInformation.setLevel(level);
            shopInformation.setName(name);
            shopInformation.setId(id);
            try {
                int result = shopInformationService.updateByPrimaryKeySelective(shopInformation);
                if (result != 1) {
                    return "redirect:publish_product.do";
                }
            } catch (Exception e) {
                e.printStackTrace();
                return "redirect:publish_product.do";
            }
            goodsToken = TokenProccessor.getInstance().makeToken();
            request.getSession().setAttribute("goodsToken", goodsToken);
            model.addAttribute("token", goodsToken);
            shopInformation = shopInformationService.selectByPrimaryKey(id);
            model.addAttribute("userInfo", userInfo);
            model.addAttribute("shopInformation", shopInformation);
            model.addAttribute("action", 2);
            model.addAttribute("sort", getSort(sort));
        }
        return "redirect:/my_publish_product_page.do";
    }

    //从发布的商品直接跳转到修改商品
    @RequestMapping(value = "/modifiedMyPublishProduct.do")
    public String modifiedMyPublishProduct(HttpServletRequest request, Model model,
                                           @RequestParam int id) {
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            return "redirect:/login.do";
        }
        String goodsToken = TokenProccessor.getInstance().makeToken();
        request.getSession().setAttribute("goodsToken", goodsToken);
        model.addAttribute("token", goodsToken);
        ShopInformation shopInformation = shopInformationService.selectByPrimaryKey(id);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("shopInformation", shopInformation);
        model.addAttribute("action", 2);
        model.addAttribute("sort", getSort(shopInformation.getSort()));
        return "page/publish_product";
    }

    //发表留言
    @RequestMapping(value = "/insertShopContext.do")
    @ResponseBody
    public Map insertShopContext(@RequestParam int id, @RequestParam String context, @RequestParam String token,
                                 HttpServletRequest request) {
        log.info("发表留言请求~");
        log.info("留言内容："+context);
        String goodsToken = (String) request.getSession().getAttribute("goodsToken");
        Map<String, String> map = new HashMap<>();
        map.put("result", "1");
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            map.put("result", "2");
            log.info("sesseion的userInfo 为空！");
            return map;
        }
        if (StringUtils.getInstance().isNullOrEmpty(goodsToken) || !token.equals(goodsToken)) {
            log.info("goodsToken为："+goodsToken);
            return map;
        }
        ShopContext shopContext = new ShopContext();
        shopContext.setContext(context);
        Date date = new Date();
        shopContext.setModified(date);
        shopContext.setSid(id);
        log.info("id:"+id);
       // int uid = (int) request.getSession().getAttribute("uid");
        String uid = (String) request.getSession().getAttribute("uid");
        log.info("uid:"+uid);
        //log.info("uid:"+uid);
        shopContext.setUid(Integer.parseInt(uid));
        try {
            int result = shopContextService.insertSelective(shopContext);
            if (result != 1) {
                return map;
            }
        } catch (Exception e) {
            log.info("catch");
            e.printStackTrace();
            return map;
        }
        map.put("result", "1");
        map.put("username", userInfo.getName());
        map.put("context", context);
        map.put("time", StringUtils.getInstance().DateToString(date));
        return map;
    }

    //下架商品
    @RequestMapping(value = "/deleteShop.do")
    public String deleteShop(HttpServletRequest request, Model model, @RequestParam int id) {
//        Map<String, Integer> map = new HashMap<>();
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            return "redirect:/login.do";
        } else {
            model.addAttribute("userInfo", userInfo);
        }
        ShopInformation shopInformation = new ShopInformation();
        shopInformation.setModified(new Date());
        shopInformation.setDisplay(0);
        shopInformation.setId(id);
        try {
            int result = shopInformationService.updateByPrimaryKeySelective(shopInformation);
            if (result != 1) {
                return "redirect:my_publish_product_page.do";
            }
            return "redirect:my_publish_product_page.do";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:my_publish_product_page.do";
        }
    }

    //查看发布的所有商品总数
    @RequestMapping(value = "/getReleaseShopCounts.do")
    @ResponseBody
    public Map getReleaseShopCounts(HttpServletRequest request) {
        Map<String, Integer> map = new HashMap<>();
        if (StringUtils.getInstance().isNullOrEmpty(request.getSession().getAttribute("userInfo"))) {
            map.put("counts", -1);
            return map;
        }
        int counts = getReleaseCounts((Integer) request.getSession().getAttribute("uid"));
        map.put("counts", counts);
        return map;
    }

    //查看我的发布的商品
    @RequestMapping(value = "/my_publish_product_page.do")
    public String getReleaseShop(HttpServletRequest request, Model model) {
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if (StringUtils.getInstance().isNullOrEmpty(userInfo)) {
            return "redirect:/login.do";
        } else {
            model.addAttribute("userInfo", userInfo);
        }
        String uid = (String) request.getSession().getAttribute("uid");
        List<ShopInformation> shopInformations = shopInformationService.selectUserReleaseByUid(Integer.parseInt(uid));
        List<ShopInformationBean> list = new ArrayList<>();
        String stringBuffer;
//            int i=0;
        for (ShopInformation shopInformation : shopInformations) {
//                if (i>=5){
//                    break;
//                }
//                i++;
            stringBuffer = getSort(shopInformation.getSort());
            ShopInformationBean shopInformationBean = new ShopInformationBean();
            shopInformationBean.setId(shopInformation.getId());
            shopInformationBean.setName(shopInformation.getName());
            shopInformationBean.setLevel(shopInformation.getLevel());
            shopInformationBean.setPrice(shopInformation.getPrice().doubleValue());
            shopInformationBean.setRemark(shopInformation.getRemark());
            shopInformationBean.setSort(stringBuffer);
            shopInformationBean.setQuantity(shopInformation.getQuantity());
            shopInformationBean.setTransaction(shopInformation.getTransaction());
            shopInformationBean.setUid(shopInformation.getUid());
            shopInformationBean.setImage(shopInformation.getImage());
            list.add(shopInformationBean);
        }
        model.addAttribute("shopInformationBean", list);
        return "page/personal/my_publish_product_page";
    }



    /**
     *  //生成订单， 订单id(id自动生成) ,订单人id(从session获取) ,地址(从session获取) ,生成时间(后台生成)
     *              商品id、商品价格(从数据库查)、商品数量(参数传递)
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/insert_order.do",method = RequestMethod.POST )
    public BaseResponse addOrders(
            @RequestBody Map<String, Object> paramsMap,
            HttpServletRequest request,
            HttpServletResponse response,
            Model model) throws IOException {
        //System.out.println(paramsMap.getClass());
       // System.out.println(paramsMap.get("address"));
       // System.out.println(paramsMap.get("data_list"));
        String address = (String) paramsMap.get("address");
        //商品id,数量列表
        List data_list = (List) paramsMap.get("data_list");
        //System.out.println("data_list:"+data_list);

        //测试
        for (int i=0;i<data_list.size();i++){
            //System.out.println(data_list.get(i));
            log.info("商品id:"+((LinkedHashMap)data_list.get(i)).get("shopId"));
            log.info("购买数量:"+((LinkedHashMap)data_list.get(i)).get("shopNum"));
            //System.out.println(data_list.get(i).getClass());

        }

        log.info("订单生成 controller!");
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        model.addAttribute("userInfo",userInfo);
        String uid = userInfo.getSid();

        OrderForm orderForm = new OrderForm();
        orderForm.setId(null);
        orderForm.setUid(Integer.valueOf(uid));
        orderForm.setModified(new Timestamp(System.currentTimeMillis()));
        orderForm.setAddress(address);
        orderForm.setDisplay(1);
        //配置Mybatis返回自增主键赋值给 orderForm的id
        int order_id = orderFormService.insertSelective(orderForm);//插入订单-用户数据表
        log.info("自增订单id:"+orderForm.getId());

        log.info("循环订单-商品表开始：");
        int goodsOF_result = 0;
        //循环插入订单-商品表
        for (int i=0;i<data_list.size();i++){
            //类型转换  商品id
            Object shopId = ((LinkedHashMap) data_list.get(i)).get("shopId");
            String s_shopId = shopId.toString();
            Integer shopId_int = Integer.valueOf(s_shopId);
            //对应商品id的数量
            Object shopNum = ((LinkedHashMap) data_list.get(i)).get("shopNum");
            String s_shopNum = shopNum.toString();
            Integer shopNum_int = Integer.valueOf(s_shopNum);

            GoodsOfOrderForm goodsOfOrderForm = new GoodsOfOrderForm();
            goodsOfOrderForm.setId(null);
            goodsOfOrderForm.setOfid(orderForm.getId());
            goodsOfOrderForm.setSid(shopId_int);
            goodsOfOrderForm.setQuantity(shopNum_int);
            goodsOfOrderForm.setDisplay(1);
            goodsOfOrderForm.setModified(new Timestamp(System.currentTimeMillis()));
            goodsOF_result = goodsOfOrderFormService.insertSelective(goodsOfOrderForm);//插入订单-商品数据表
        }

        log.info("订单创建成功："+orderFormService.selectByPrimaryKey(orderForm.getId()));
        return BaseResponse.success();
    }

    /**
     * 个人账号获取订单
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "getMyOrders.do")
    public String showMyOrders(HttpServletRequest request,
                               Model model){
        Users userInfo = (Users) request.getSession().getAttribute("userInfo");
        if(StringUtils.getInstance().isNullOrEmpty(userInfo)){
            //如果当前没有登录则跳转到登录界面
            return "redirect:/login.do";
        }
        model.addAttribute("userInfo",userInfo);
        String uid = userInfo.getSid();

        //存订单id的list
        ArrayList<Integer> orderIdList = new ArrayList<>();
        //存商品列表的list
        List<GoodsCarBean> goodsCarBeans = new ArrayList<>();
        //获取当前账号的订单列表
        //返回model， 通过user id 获取订单号，返回订单中包含的商品信息(名字，价格，图片等等)
        List<OrderForm> orderForms = orderFormService.selectAllByUid(Integer.valueOf(uid));
        for (OrderForm o : orderForms) {
            orderIdList.add(o.getId());
            //订单-商品表 对象   //整个list的订单号都是一样的
            List<GoodsOfOrderForm> goodsOfOrderForms = goodsOfOrderFormService.selectByOFid(o.getId());
            log.info("订单-商品表 对象"+goodsOfOrderForms.toString());
            //for循环去读订单-商品表
            for (GoodsOfOrderForm goodsOfOrderForm:goodsOfOrderForms){
                GoodsCarBean goodsCarBean = new GoodsCarBean();
                goodsCarBean.setUid(o.getUid());
                goodsCarBean.setModified(o.getModified());
                goodsCarBean.setId(o.getId());
                System.out.println("每次当前商品id:"+goodsOfOrderForm.getSid());
                //当前商品数量
                goodsCarBean.setQuantity(goodsOfOrderForm.getQuantity());
                //通过商品id获取商品信息表 对象
                ShopInformation shopInformation = shopInformationService.selectByPrimaryKey(goodsOfOrderForm.getSid());
                log.info("订单-商品表id：" + goodsOfOrderForm.getId() + "商品号：" + shopInformation.getId());
                goodsCarBean.setSid(shopInformation.getId());
                goodsCarBean.setName(shopInformation.getName());
                goodsCarBean.setRemark(shopInformation.getRemark());
                goodsCarBean.setImage(shopInformation.getImage());
                goodsCarBean.setPrice(shopInformation.getPrice().doubleValue());
                goodsCarBean.setSort(getSort(shopInformation.getSort()));
                goodsCarBeans.add(goodsCarBean);
            }
        }
        model.addAttribute("orderList",goodsCarBeans);     //返回订单里的商品里列表 Model
        model.addAttribute("orderIdList",orderIdList);     //返回订单里的商品里列表 Model
        for (GoodsCarBean gcb:goodsCarBeans) {
            System.out.println(gcb.toString());
        }
        return "page/personal/my_orders";
    }


    //=======================================================================
    //  分割线
    // 下面都是封装号的方法，便于contrller处理方法中的操作调用

    //更新商品信息
    private String getSort(int sort) {
        StringBuilder sb = new StringBuilder();
        Specific specific = selectSpecificBySort(sort);
        int cid = specific.getCid();
        Classification classification = selectClassificationByCid(cid);
        int aid = classification.getAid();
        AllKinds allKinds = selectAllKindsByAid(aid);
        sb.append(allKinds.getName());
        sb.append("-");
        sb.append(classification.getName());
        sb.append("-");
        sb.append(specific.getName());
        return sb.toString();
    }

    //查看用户收藏的货物的总数
    private int getCollectionCounts(int uid) {
        int counts;
        try {
            counts = userCollectionService.getCounts(uid);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return counts;
    }

    //查看收藏，一次10个
    private List<UserCollection> selectContectionByUid(int uid, int start) {
        try {
            return userCollectionService.selectByUid(uid, (start - 1) * 10);
        } catch (Exception e) {
            e.printStackTrace();
            List<UserCollection> list = new ArrayList<>();
            list.add(new UserCollection());
            return list;
        }
    }

    //查看用户发布的货物的总数
    private int getReleaseCounts(int uid) {
        try {
            return userReleaseService.getCounts(uid);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    //查看发布的货物，一次10个
    private List<UserRelease> selectReleaseByUid(int uid, int start) {
        try {
            return userReleaseService.selectByUid(uid, (start - 1) * 10);
        } catch (Exception e) {
            e.printStackTrace();
            List<UserRelease> list = new ArrayList<>();
            list.add(new UserRelease());
            return list;
        }
    }

    //查看用户购买到的物品的总数
    private int getBoughtShopCounts(int uid) {
        try {
            return boughtShopService.getCounts(uid);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    //查看用户的购买，10个
    private List<BoughtShop> selectBoughtShopByUid(int uid, int start) {
        try {
            return boughtShopService.selectByUid(uid, (start - 1) * 10);
        } catch (Exception e) {
            e.printStackTrace();
            List<BoughtShop> list = new ArrayList<>();
            list.add(new BoughtShop());
            return list;
        }
    }




    //我的购物车总数
    private int getShopCarCounts(int uid) {
        try {
            return shopCarService.getCounts(uid);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    //购物车列表  10
    private ShopCar selectShopCarByUid(int uid) {
        try {
            return shopCarService.selectByUid(uid);
        } catch (Exception e) {
            e.printStackTrace();
//            List<ShopCar> list
            return new ShopCar();
        }
    }

    //根据user id查看订单总数
    private int getOrderFormCounts(int uid) {
        try {
            return orderFormService.getCounts(uid);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    //订单列表 10个
    private List<OrderForm> selectOrderFormByUid(int uid, int start) {
        try {
            return orderFormService.selectByUid(uid, (start - 1) * 10);
        } catch (Exception e) {
            e.printStackTrace();
            List<OrderForm> list = new ArrayList<>();
            list.add(new OrderForm());
            return list;
        }
    }

    //订单中的商品
    private List<GoodsOfOrderForm> selectGoodsOfOrderFormByOFid(int ofid) {
        try {
            return goodsOfOrderFormService.selectByOFid(ofid);
        } catch (Exception e) {
            e.printStackTrace();
            List<GoodsOfOrderForm> list = new ArrayList<>();
            list.add(new GoodsOfOrderForm());
            return list;
        }
    }

    //查看用户的状态
    private UserState selectUserStateByUid(int uid) {
        try {
            return userStateService.selectByUid(uid);
        } catch (Exception e) {
            e.printStackTrace();
            return new UserState();
        }
    }


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

    public void save(ShopInformation shopInformation, UserRelease userRelease) {
        shopInformationService.insertSelective(shopInformation);
        userReleaseService.insertSelective(userRelease);
    }

    //循环插入商品
    //发布商品 ,,批量插入数据用的
    @RequestMapping(value = "/test")
    public String insertGoods() {
        Random random = new Random();
        ShopInformation shopInformation;
        UserRelease userRelease;
        int level, uid, quantity;
        double price;
        for (int i = 1, k = 1, j = 189; i < 1000; i++, j++, k++) {
            if (k > 94) {
                k = 1;
            }
            level = random.nextInt(10) + 1;
            price = Math.random() * 1000 + 1;
            quantity = random.nextInt(10) + 1;
            uid = random.nextInt(100) + 1;
            shopInformation = new ShopInformation();
            shopInformation.setId(j);
            shopInformation.setName("百年孤独");
            shopInformation.setModified(new Date());
            shopInformation.setLevel(level);
            shopInformation.setRemark("看上的请联系我，QQ：test，微信：test");
//            double price = Math.random()*1000.00+1;
            shopInformation.setPrice(new BigDecimal(price));
            shopInformation.setSort(k);
            shopInformation.setQuantity(quantity);
            shopInformation.setImage("/image/QyBHYiMfYQ4XZFCqxEv0.jpg");
//            int uid = random.nextInt(100)+1;
            shopInformation.setUid(uid);
//            userRelease = new UserRelease();
//            userRelease.setUid(uid);
//            userRelease.setSid(j);
//            userRelease.setModified(new Date());
//            userRelease.setDisplay(1);
            shopInformationService.updateByPrimaryKeySelective(shopInformation);
//            userReleaseService.insertSelective(userRelease);
        }
        System.out.println("success");
        return "page/publish_product";
    }
}
