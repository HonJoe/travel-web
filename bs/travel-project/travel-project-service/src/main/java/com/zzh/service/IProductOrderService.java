package com.zzh.service;

import com.baomidou.mybatisplus.service.IService;
import com.zzh.common.ServerResponse;
import com.zzh.entity.ProductOrder;
import com.zzh.entity.ProductSell;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zzh
 * @since 2019-03-04
 */
public interface IProductOrderService extends IService<ProductOrder> {

    public ServerResponse createOrder(ProductOrder productOrder, ProductSell productSell )throws Exception;

    public List myOrderList(String uid);
}
