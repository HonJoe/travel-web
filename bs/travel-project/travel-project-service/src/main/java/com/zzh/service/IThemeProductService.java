package com.zzh.service;

import com.baomidou.mybatisplus.service.IService;
import com.zzh.entity.ThemeProduct;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zzh
 * @since 2019-02-13
 */
public interface IThemeProductService extends IService<ThemeProduct> {

    public List<ThemeProduct>selectByPid(String pid);

}
