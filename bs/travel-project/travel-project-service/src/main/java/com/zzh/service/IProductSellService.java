package com.zzh.service;

import com.baomidou.mybatisplus.service.IService;
import com.zzh.entity.ProductSell;
import com.zzh.vo.PriceCalendar;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zzh
 * @since 2019-02-19
 */
public interface IProductSellService extends IService<ProductSell> {

    public List<PriceCalendar> getPriCal(String pid);

}
