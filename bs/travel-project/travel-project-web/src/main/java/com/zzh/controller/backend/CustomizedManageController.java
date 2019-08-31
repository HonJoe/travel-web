package com.zzh.controller.backend;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.zzh.common.ResponseCode;
import com.zzh.common.ServerResponse;
import com.zzh.entity.Customization;
import com.zzh.service.ICustomizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by lenovo on 2019/1/27.
 */
@Controller
@RequestMapping("/manager/customization")
public class CustomizedManageController {

    @Autowired
    private ICustomizationService customizationService;

    /**
     *查看详情
     */
    @GetMapping("/{id}")
    @ResponseBody
    public ServerResponse<Customization> detail(@PathVariable String id){
        Customization customization=new Customization();
        customization.setId(id);
        return ServerResponse.createBySuccess(customization.selectById()) ;
    }

    @RequestMapping("/detailView/{id}")
    public String detailView(@PathVariable String id, Model model){
        Customization customization=new Customization();
        customization.setId(id);
        model.addAttribute("customization",customization.selectById());
        return "backend/customization";
    }

    /**
     * 设置状态
     */
    @RequestMapping("/update/{id}")
    @ResponseBody
    public ServerResponse updateStauts(@PathVariable String id, String status){
        Customization customization=new Customization();
        customization.setStatus(Integer.parseInt(status));
        customization.setId(id);
        return ServerResponse.createByResult(customization.updateById());
    }

    /*
    * 分页查看
    *
    * */

    @RequestMapping("list")
    @ResponseBody
    public ServerResponse list(String status, @RequestParam(value="current",defaultValue="1") int current, @RequestParam(value="size",defaultValue="10") int size){
        if (current<=0||size<=0){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        EntityWrapper entityWrapper=null;
        if (status!=null&&!"".equals(status)){
            entityWrapper=new EntityWrapper();
            entityWrapper.eq("status",Integer.parseInt(status));
        }

        return ServerResponse.createBySuccess(customizationService.selectMapsPage(new Page(current,size),entityWrapper)) ;
    }

}
