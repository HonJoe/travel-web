package com.zzh.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.zzh.common.Const;
import com.zzh.common.ServerResponse;
import com.zzh.entity.Product;
import com.zzh.entity.ProductOrder;
import com.zzh.entity.ProductSell;
import com.zzh.entity.User;
import com.zzh.service.IProductOrderService;
import com.zzh.service.IProductSellService;
import com.zzh.service.IProductService;
import com.zzh.vo.OrderList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/productOrder")
public class ProductOrderController {

    @Autowired
    private IProductOrderService productOrderService;
    @Autowired
    private IProductSellService productSellService;
    @Autowired
    private IProductService productService;

    @RequestMapping("/create")
    @ResponseBody
    public ServerResponse buy(String psid,ProductOrder productOrder, HttpSession session)  {
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        //获取对应sell记录
        ProductSell productSell=productSellService.selectById(psid);
        //更新order其他信息
        productOrder.setUserId(user.getId());
        productOrder.setProductId(productSell.getPid());
        productOrder.setProductsellId(productSell.getId());
//        productOrder.setPruductNum(num);
        ServerResponse serverResponse;
        try {
           serverResponse= productOrderService.createOrder(productOrder,productSell);
        } catch (Exception e) {
            e.printStackTrace();
            return ServerResponse.createByErrorMessage("购买失败");
        }
        return serverResponse;
    }

    @ResponseBody
    @RequestMapping("/myOrder")
    public ServerResponse myOrderList(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorMessage("用户未登录");
        }
        return ServerResponse.createBySuccess(productOrderService.myOrderList(user.getId()));
    }

    @RequestMapping("/orderView")
    public String myOrderListView(HttpSession session, Model model){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "index/index";
        }
        List<OrderList> orderLists=productOrderService.myOrderList(user.getId());
        model.addAttribute("user",user);
        model.addAttribute("orderLists",orderLists);
        return "index/my_order";
    }


    //根据销量排行
    @RequestMapping("/hot")
    @ResponseBody
    public List<Product> hotProduct(int size){
        EntityWrapper entityWrapper=new EntityWrapper();
        entityWrapper.groupBy("product_id");
        entityWrapper.orderBy("COUNT(*)",false);
//        entityWrapper.orderDesc()

        return productOrderService.selectList(entityWrapper);
    }

    //填写订单
    @RequestMapping("/fillView")
    public String fillView(HttpSession session,Model model,String psid,int num){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "index/index";
        }
        if (null==psid||"".equals(psid)||num==0){
            return "index/index";
        }
        ProductSell productSell=productSellService.selectById(psid);
        Product product=productService.selectById(productSell.getPid());
        model.addAttribute("productSell",productSell);
        model.addAttribute("product",product);
        model.addAttribute("num",num);
        double sum=num*productSell.getpPrice();
        model.addAttribute("sum",sum);
        return "index/fill_order";
    }

    //订单详情页面
    @RequestMapping("/detailView")
    public String detailView(HttpSession session,Model model,String pid,String oid){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "index/index";
        }
        if (null==pid||null==oid){
            return "index/index";
        }
        ProductOrder productOrder=productOrderService.selectById(oid);
        Product product=productService.selectById(pid);
        ProductSell productSell=productSellService.selectOne(new EntityWrapper<ProductSell>().eq("pid",pid));
        model.addAttribute("productOrder",productOrder);
        model.addAttribute("product",product);
        model.addAttribute("productSell",productSell);
        return "index/order_detail";
    }
}

