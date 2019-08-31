package com.zzh.controller.backend;


import com.zzh.common.ServerResponse;
import com.zzh.entity.Product;
import com.zzh.entity.ProductDesc;
import com.zzh.entity.ThemeProduct;
import com.zzh.service.IProductDescService;
import com.zzh.service.IProductService;
import com.zzh.service.IThemeProductService;
import com.zzh.service.IThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-02-13
 */
@Controller
@RequestMapping("/manager/product")
public class ProductManagerController {


    @Autowired
    private IProductService productService;
    @Autowired
    private IProductDescService productDescService;
    @Autowired
    private IThemeService themeService;
    @Autowired
    private IThemeProductService themeProductService;





    /**
     * 新增
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public ServerResponse save(Product product, ProductDesc productDesc, String[] themeName){

        System.out.println(product.getPrice());



        ThemeProduct[] themeProducts=new ThemeProduct[themeName.length];
        for (int i=0;i<themeName.length;i++){
            String themeId=themeService.selectIdByName(themeName[i]);
            if (null==themeId){
                return ServerResponse.createByErrorMessage("不存在该主题");
            }
            themeProducts[i]=new ThemeProduct();
            themeProducts[i].setThemeId(themeId);
            themeProducts[i].setThemeName(themeName[i]);
        }



        try {
            productService.create(product,productDesc,themeProducts);
        } catch (Exception e) {
            return ServerResponse.createByError();
        }

        return ServerResponse.createBySuccess();
    }

    @RequestMapping("/update/{pid}")
    @ResponseBody
    public ServerResponse update(@PathVariable String pid,Product product, ProductDesc productDesc, String[] themeName){

        product.setPid(pid);
        ThemeProduct[] themeProducts=new ThemeProduct[themeName.length];
        for (int i=0;i<themeName.length;i++){
            String themeId=themeService.selectIdByName(themeName[i]);
            if (null==themeId){
                return ServerResponse.createByErrorMessage("不存在该主题");
            }
            themeProducts[i]=new ThemeProduct();
            themeProducts[i].setThemeId(themeId);
            themeProducts[i].setThemeName(themeName[i]);
        }

        try {
            productService.update(product,productDesc,themeProducts);
        } catch (Exception e) {
            return ServerResponse.createByError();
        }

        return ServerResponse.createBySuccess();
    }



    /**
     * 下架
     * @param pid
     * @return
     */
    @ResponseBody
    @RequestMapping("/shelf/{pid}")
    public ServerResponse shelf(@PathVariable  String pid){
        Product product=new Product();
        product.setPid(pid);
        product.setStatus(2);//下架
        return ServerResponse.createByResult(product.updateById());
    }

    /**
     * 删除
     * @param pid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete/{pid}")
    public ServerResponse delete(@PathVariable  String pid){

        productService.cascadeDeleteById(pid);
        return ServerResponse.createBySuccess();
    }

    /**
     * 批量删除
     * @param pids
     * @return
     */

    @ResponseBody
    @RequestMapping("/deleteBatchIds")
    public ServerResponse deleteBatchIds(String[] pids){
        if (pids.length>60){
            return ServerResponse.createByErrorMessage("超出一次删除的记录");
        }
        productService.deleteBatchIds(pids);
        return ServerResponse.createBySuccess();
    }


    private boolean setThemeProduct(String[] themeName,ThemeProduct[] themeProducts){
        themeProducts=new ThemeProduct[themeName.length];
        for (int i=0;i<themeName.length;i++){
            String themeId=themeService.selectIdByName(themeName[i]);
            if (null==themeId){
                return false;
            }
            themeProducts[i]=new ThemeProduct();
            themeProducts[i].setThemeId(themeId);
            themeProducts[i].setThemeName(themeName[i]);
        }
        return true;
    }


    @RequestMapping("/addView")
    public String addView(Model model){

        model.addAttribute("theme",themeService.selectList(null));
        return "backend/product_add";
    }

    @RequestMapping("/listView")
    public String listView(){
        return "backend/product_list";
    }

    @RequestMapping("/updateView/{pid}")
    public String updateView(@PathVariable String pid, Model model){
        Product product=productService.selectById(pid);
        ProductDesc productDesc=productDescService.selectById(pid);

        model.addAttribute("product",product);
        model.addAttribute("productDesc",productDesc);
        model.addAttribute("theme",themeService.selectList(null));
        model.addAttribute("tp",themeProductService.selectByPid(pid));
//        model.addAttribute("themeProduct",themeProductService.selectByPid(product.getPid()));
        //复选框的值先缺着
        return "backend/product_update";
    }

    /**
     * 检查日期输入合法性
     * @return
     */
    private boolean checkDateInputIllegal(Date stratDate,Date endDate){
        //计算天数
        int  days = (int)(stratDate.getTime()-endDate.getTime())/ (1000*3600*24);
        if (days<0||days>60){
            return false;
        }
        return true;
    }

}

