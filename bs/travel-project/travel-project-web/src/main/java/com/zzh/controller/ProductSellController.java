package com.zzh.controller;


import com.zzh.common.ServerResponse;
import com.zzh.service.IProductSellService;
import com.zzh.vo.PriceCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-02-19
 */
@Controller
@RequestMapping("/productSell")
public class ProductSellController {

    @Autowired
    private IProductSellService productSellService;

    @ResponseBody
    @RequestMapping("/{id}")
    public ServerResponse detail(@PathVariable String id){
        return ServerResponse.createBySuccess(productSellService.selectById(id));
    }

    @ResponseBody
    @RequestMapping("/listpsVo/{pid}")
    public List<PriceCalendar> getPriCal(@PathVariable String pid){


        return productSellService.getPriCal(pid);

    }



}

