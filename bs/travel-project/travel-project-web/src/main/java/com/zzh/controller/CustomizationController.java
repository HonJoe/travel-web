package com.zzh.controller;


import com.zzh.common.Const;
import com.zzh.common.ServerResponse;
import com.zzh.entity.Customization;
import com.zzh.entity.User;
import com.zzh.service.ICustomizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zzh
 * @since 2019-01-27
 */
@Controller
@RequestMapping("/customization")
public class CustomizationController {

    @Autowired
    private ICustomizationService customizationService;


    @PostMapping("/save")
    @ResponseBody
    public ServerResponse<String> save(Customization customization, HttpSession session) throws IOException {
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorMessage("请登录");
        }
        customization.setUid(user.getId());
        customization.setStatus(0);
        System.out.println(customization.toString());
        return ServerResponse.createByResult(customization.insert());
    }


    @RequestMapping("listView")
    public String listView(HttpSession session, Model model){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return "index/index";
        }
        List<Customization> customizations=customizationService.selectListByUid(user.getId());
        model.addAttribute("customizations",customizations);
        model.addAttribute("user",user);
        return "index/cuslist";

    }

    @RequestMapping("/detailView/{id}")
    public String detailView(@PathVariable String id, Model model){
        Customization customization=customizationService.selectById(id);
        model.addAttribute("cus",customization);
        return "index/cus_detail";
    }

}

