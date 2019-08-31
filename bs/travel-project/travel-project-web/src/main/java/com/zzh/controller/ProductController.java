package com.zzh.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.zzh.common.ServerResponse;
import com.zzh.entity.Product;
import com.zzh.entity.ProductDesc;
import com.zzh.entity.ThemeProduct;
import com.zzh.service.*;
import com.zzh.vo.PriceCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-02-13
 */
@Controller
@RequestMapping("/product")
public class ProductController {


    @Autowired
    private IProductService productService;
    @Autowired
    private IThemeProductService themeProductService;
    @Autowired
    private IProductSellService productSellService;
    @Autowired
    private IProductDescService productDescService;

    /**
     * list
     * @param map
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list(@RequestParam Map map,@RequestParam(value="current",defaultValue="1") int current,@RequestParam(value="size",defaultValue="10") int size){
        EntityWrapper entityWrapper=new EntityWrapper();
        if (map.get("startAreaname")!=null&&!"".equals(map.get("startAreaname"))){
            String startAreaname= (String) map.get("startAreaname");
            entityWrapper.eq("start_areaName",startAreaname);
        }
        if (map.get("endAreaname")!=null&&!"".equals(map.get("endAreaname"))){
            String endAreaname= (String) map.get("endAreaname");
            entityWrapper.eq("end_areaName",endAreaname);
        }
        if (map.get("title")!=null&&!"".equals(map.get("title"))){
            String title= (String) map.get("title");
            entityWrapper.like("title",title);
        }
        if (map.get("activeDays")!=null&&!"不限".equals(map.get("activeDays"))){
            String activeDays= (String) map.get("activeDays");
            int day;
            if (activeDays.equals("1-2天")){
                entityWrapper.le("active_days",2);
            }else if (activeDays.equals("3-5天")){
                entityWrapper.between("active_days",3,5);
            }else{
                entityWrapper.gt("active_days",5);
            }

        }
        if (map.get("orderBy")!=null){
            String orderBy= (String) map.get("orderBy");
            if (orderBy.equals("priceAsc")){
                entityWrapper.orderBy("price",true);
            }else if (orderBy.equals("priceDesc")){
                entityWrapper.orderBy("price",false);
            }
        }else {
            entityWrapper.orderBy("create_time",false);
        }
        if (map.get("type")!=null&&!"全部".equals(map.get("type"))){
            String type= (String) map.get("type");
             List<ThemeProduct> tplist=themeProductService.selectList(new EntityWrapper<ThemeProduct>().eq("theme_name",type));
             List idlist=new ArrayList();
             for (ThemeProduct themeProduct:tplist){
                 idlist.add(themeProduct.getProductId());
             }
            entityWrapper.in("pid",idlist);
        }
        if (map.get("status")!=null){
            int status= Integer.parseInt((String) map.get("status"));
            entityWrapper.eq("status",status);//上架产品
        }
        return ServerResponse.createBySuccess(productService.selectPage(new Page<Product>(current,size),entityWrapper));
    }




    @RequestMapping("detailView/{pid}")
    public String detailView(@PathVariable String pid, Model model){
        Product product=productService.selectById(pid);
        ProductDesc productDesc=productDescService.selectById(pid);
        List<PriceCalendar> priceCalendars=productSellService.getPriCal(product.getPid());
        List<ThemeProduct> themeProducts=themeProductService.selectByPid(product.getPid());

        model.addAttribute("product",product);
        model.addAttribute("productDesc",productDesc);
        model.addAttribute("priceCalendars",priceCalendars);
        model.addAttribute("themeProducts",themeProducts);
        return "index/product_detail";
    }

    //根据销量排行
    @RequestMapping("/hot")
    @ResponseBody
    public List<Product> hotProduct(int size){

        return productService.hotProduct(size);
    }


   @RequestMapping("/list2")
   @ResponseBody
    public List<Product> listBycondition(@RequestParam Map map,@RequestParam(value="current",defaultValue="5") int size){
       EntityWrapper entityWrapper=new EntityWrapper();
       if (map.get("activeDays")!=null){
           String activeDays= (String) map.get("activeDays");
           int day;
           if (activeDays.equals("1-2天")){
               entityWrapper.le("active_days",2);
           }else if (activeDays.equals("3-5天")){
               entityWrapper.between("active_days",3,5);
           }else{
               entityWrapper.gt("active_days",5);
           }

       }
       if (map.get("type")!=null){
           String type= (String) map.get("type");

           List<ThemeProduct> tplist=themeProductService.selectList(new EntityWrapper<ThemeProduct>().eq("theme_name",type));
           List idlist=new ArrayList();
           for (ThemeProduct themeProduct:tplist){
               idlist.add(themeProduct.getProductId());
           }
           entityWrapper.in("pid",idlist);
       }
       entityWrapper.eq("status",1);
       String limt="limit "+size;
        entityWrapper.last(limt);
       return productService.selectList(entityWrapper);

   }

}

