package com.zzh.controller.backend;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.zzh.common.ResponseCode;
import com.zzh.common.ServerResponse;
import com.zzh.entity.Area;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/manager/area")
public class AreaManageController {


    @ResponseBody
    @RequestMapping("/create")
    public ServerResponse create(Area area){
        if (StringUtils.isBlank(area.getAreaName())||null==area.getLevel()){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }else if (null!=area.selectOne(new EntityWrapper().eq("areaName",area.getAreaName()))){
            return ServerResponse.createByErrorMessage("城市已存在");
        }
        return ServerResponse.createByResult(area.insert());
    }




}

