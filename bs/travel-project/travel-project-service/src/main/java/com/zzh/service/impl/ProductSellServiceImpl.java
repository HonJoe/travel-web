package com.zzh.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zzh.dao.ProductSellMapper;
import com.zzh.entity.ProductSell;
import com.zzh.service.IProductSellService;
import com.zzh.vo.PriceCalendar;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zzh
 * @since 2019-02-19
 */
@Service
public class ProductSellServiceImpl extends ServiceImpl<ProductSellMapper, ProductSell> implements IProductSellService {

    @Override
    public List<PriceCalendar> getPriCal(String pid) {
        EntityWrapper entityWrapper=new EntityWrapper();
        entityWrapper.eq("pid",pid);
        entityWrapper.gt("start_date",new Date());
        entityWrapper.gt("stock",0);
        entityWrapper.orderBy("start_date",true);
        List<ProductSell> productSellList=selectList(entityWrapper);

        return splicing(productSellList);
    }

    //拼装返回vo
    private List<PriceCalendar> splicing(List<ProductSell> productSellList){
        List<PriceCalendar> priceCalendars=new ArrayList<>();
        for (ProductSell productSell:productSellList){
            PriceCalendar priceCalendar=new PriceCalendar(productSell.getStartDate(),productSell.getpPrice(),productSell.getId());
            priceCalendars.add(priceCalendar);
        }
        return priceCalendars;
    }

}
