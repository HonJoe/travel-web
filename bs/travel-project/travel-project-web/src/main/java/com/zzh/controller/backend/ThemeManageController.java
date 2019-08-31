package com.zzh.controller.backend;


import com.zzh.common.ServerResponse;
import com.zzh.entity.Theme;
import com.zzh.service.IThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
 * @since 2019-02-02
 */
@Controller
@RequestMapping("/manager/theme")
public class ThemeManageController {

    @Autowired
    private IThemeService themeService;


    @ResponseBody
    @RequestMapping("/save")
    public ServerResponse save(Theme theme){
        return  ServerResponse.createByResult(theme.insert());
    }

    @ResponseBody
    @RequestMapping("/update/{tId}")
    public ServerResponse update(@PathVariable String tId, Theme theme){
        theme.setId(tId);
        return ServerResponse.createByResult(theme.updateById());
    }

    @ResponseBody
    @RequestMapping("/delete/{tId}")
    public ServerResponse delete(@PathVariable String tId){
        Theme theme=new Theme();
        theme.setId(tId);
        return ServerResponse.createByResult(theme.deleteById());
    }

    @RequestMapping("/detailView/{id}")
    public String themeView(@PathVariable String id, Model model){
        Theme theme=new Theme();
        theme.setId(id);
        model.addAttribute("theme",theme.selectById());
        return "backend/theme_add";
    }

    @RequestMapping("/addView")
    public String addView(){
        return "backend/theme_add";
    }



    @RequestMapping("/test")
    @ResponseBody
    public List test(){
        return themeService.listorderBythemeName();
    }


}

