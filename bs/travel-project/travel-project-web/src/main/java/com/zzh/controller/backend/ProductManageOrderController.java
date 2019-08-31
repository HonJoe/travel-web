package com.zzh.controller.backend;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.zzh.common.ServerResponse;
import com.zzh.entity.ProductOrder;
import com.zzh.service.IProductOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/manager/productOrder")
public class ProductManageOrderController {

    @Autowired
    private IProductOrderService productOrderService;

    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list(String keyword, @RequestParam(value="current",defaultValue="1") int current, @RequestParam(value="size",defaultValue="10") int size){
        EntityWrapper entityWrapper=new EntityWrapper();
        if (keyword!=null&!"".equals(keyword)){
            entityWrapper.eq("order_no",keyword).or().eq("username",keyword);
            entityWrapper.orderBy("create_time",false);
        }

        return ServerResponse.createBySuccess(productOrderService.selectPage(new Page<ProductOrder>(current,size),entityWrapper));
    }

    @RequestMapping("/detailView/{id}")
    public String detailView(@PathVariable String id, Model model){
        ProductOrder productOrder=productOrderService.selectById(id);
        model.addAttribute("order",productOrder);
        return "backend/order_detail";
    }

    @RequestMapping("/listView")
    public String listView(){
        return "backend/order_list";
    }



}

