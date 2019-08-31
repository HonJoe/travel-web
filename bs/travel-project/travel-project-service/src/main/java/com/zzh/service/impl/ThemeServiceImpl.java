package com.zzh.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zzh.dao.ThemeMapper;
import com.zzh.entity.Theme;
import com.zzh.service.IThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zzh
 * @since 2019-02-02
 */
@Service
public class ThemeServiceImpl extends ServiceImpl<ThemeMapper, Theme> implements IThemeService {

    @Autowired
    private ThemeMapper themeMapper;

    @Override
    public String selectIdByName(String themeName) {
//        Theme theme=new Theme();
//        theme.setThemeName(themeName);
//        theme=baseMapper.selectOne(theme);
        EntityWrapper<Theme> entityWrapper=new EntityWrapper();
        Theme theme=selectOne(entityWrapper.eq("theme_name",themeName));
        if (null==theme){
            return null;
        }
        return theme.getId();
    }

    @Override
    public List<Map<String, String>> listorderBythemeName() {
        return themeMapper.listorderBythemeName();
    }
}
