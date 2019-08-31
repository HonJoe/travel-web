package com.zzh.controller.backend;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.zzh.common.ResponseCode;
import com.zzh.common.ServerResponse;
import com.zzh.entity.ProductSell;
import com.zzh.service.IProductSellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-02-19
 */
@Controller
@RequestMapping("/manager/productSell")
public class ProductSellManageController {

    @Autowired
    private IProductSellService productSellService;

    /**
     * 列表
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list(@RequestParam(value="current",defaultValue="1") int current, @RequestParam(value="size",defaultValue="10") int size){

        if (current<0||size<0){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }

        return ServerResponse.createBySuccess(productSellService.selectPage(new Page(current,size))) ;
    }

    /**
     * 列表
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/list/{pid}")
    @ResponseBody
    public ServerResponse listBypid(@PathVariable String pid,@RequestParam(value="current",defaultValue="1") int current, @RequestParam(value="size",defaultValue="10") int size){

        if (current<0||size<0){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        EntityWrapper<ProductSell> entityWrapper=new EntityWrapper();
        entityWrapper.eq("pid",pid);
        entityWrapper.orderBy("start_date",true);
        return ServerResponse.createBySuccess(productSellService.selectPage(new Page(current,size),entityWrapper)) ;
    }

    /**
     * 新增
     * @param productSell
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public ServerResponse create(ProductSell productSell){
        productSell.setCreateTime(new Date());
        return ServerResponse.createBySuccess(productSell.insert());
    }

    /**
     *修改
     * @param id
     * @param productSell
     * @return
     */
    @ResponseBody
    @RequestMapping("/update/{id}")
    public ServerResponse update(@PathVariable  String id, ProductSell productSell){
        productSell.setId(id);
        productSell.setUpdateTime(new Date());
        return ServerResponse.createByResult(productSell.updateById());
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete/{id}")
    public  ServerResponse delete(@PathVariable String id){
        ProductSell productSell=new ProductSell();
        productSell.setId(id);
        return ServerResponse.createByResult(productSell.deleteById());
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    public  ServerResponse delete(String[] ids){
        return ServerResponse.createByResult(productSellService.deleteBatchIds(Arrays.asList(ids)));
    }

    /**
     * 批量新增
     * @param productSells
     * @return
     */
    @RequestMapping("/insertBatch")
    @ResponseBody
    public ServerResponse insertBatch(ProductSell productSells,int days){
        if (days>30){
            return ServerResponse.createByErrorMessage("不能连续设置超过30天的产品销售");
        }
        ArrayList<ProductSell> productSellArrayList=new ArrayList<>();
        for (int i=1;i<=days;i++){
            ProductSell productSell=new ProductSell(productSells);
            Calendar c = Calendar.getInstance();
            c.setTime(productSell.getStartDate());
            c.add(Calendar.DAY_OF_MONTH, i);// +i天
            productSell.setStartDate(c.getTime());
            productSell.setCreateTime(new Date());
            productSellArrayList.add(productSell);
        }

        return ServerResponse.createByResult(productSellService.insertBatch(productSellArrayList));
    }

    @RequestMapping("/addView")
    public String addView(String pid, String title,Double price, Model model) throws UnsupportedEncodingException {
        String param = new String(title.getBytes("ISO8859-1"), "UTF-8");//解决get乱码
        model.addAttribute("pid",pid);
        model.addAttribute("title",param);
        model.addAttribute("price",price);
        return "backend/productSell_add";
    }

    @RequestMapping("/listView/{pid}")
    public String listView(@PathVariable String pid,Model model){
        model.addAttribute("pid",pid);
        return "backend/productSell_list";
    }

    @RequestMapping("/updateView/{id}")
    public String updateView(@PathVariable String id,Model model){
        model.addAttribute("productSell", productSellService.selectById(id));
        return "backend/productSell_update";
    }
}

