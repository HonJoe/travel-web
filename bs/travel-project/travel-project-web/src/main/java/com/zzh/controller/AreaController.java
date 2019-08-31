package com.zzh.controller;


import com.zzh.common.ServerResponse;
import com.zzh.entity.Area;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 地区码表 前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-02-03
 */
@Controller
@RequestMapping("/area")
public class AreaController {

    @ResponseBody
    @RequestMapping("/list")
    public ServerResponse list(){
        Area area=new Area();
        return ServerResponse.createBySuccess(area.selectAll());
    }

    @ResponseBody
    @GetMapping("/{id}")
    public ServerResponse detail(@PathVariable Integer id){
        Area area=new Area();
        area.setAreaId(id);
        return ServerResponse.createBySuccess(area.selectById());
    }


}

