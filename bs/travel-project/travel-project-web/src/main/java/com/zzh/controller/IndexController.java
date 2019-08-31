package com.zzh.controller;

import com.zzh.entity.Product;
import com.zzh.entity.Theme;
import com.zzh.service.IProductService;
import com.zzh.service.IThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by lenovo on 2019/2/11.
 */
@Controller
public class IndexController {

    @Autowired
    private IProductService productService;
    @Autowired
    private IThemeService themeService;

    @RequestMapping("/register")
    public String register(){
        return "index/register";
    }

    @RequestMapping("/customized")
    public String customized(){
        return "index/customized";
    }

    @RequestMapping("/navigation")
    public String navigation(){
        return "index/navigation";
    }

    @RequestMapping("/productlistView")
    public String plView(Model model){
        List<Theme> themes=themeService.selectList(null);
        model.addAttribute("themes",themes);
        return "index/product_list";
    }

    @RequestMapping("/indexView")
    public String indexView(Model model){
        List<Product> productList=productService.getIndexproduct(6);
        List<Product> hotPList=productService.hotProduct(6);
        model.addAttribute("hotPList",hotPList);
        model.addAttribute("productList",productList);
        return "index/index";
    }

    @RequestMapping("/userinfoView")
    public String userinfoView(){
        return "index/user_info";
    }

    @RequestMapping("/myorder")
    public String myorder(){

        return "index/my_order";
    }
    @RequestMapping("/plistView")
    public String plistView(){

        return "index/plist";
    }

    @RequestMapping("/adminLoginView")
    public String adloginView(){
        return "backend/admin_login";
    }
}
