package com.zzh.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zzh.common.ServerResponse;
import com.zzh.dao.ProductOrderMapper;
import com.zzh.entity.Product;
import com.zzh.entity.ProductOrder;
import com.zzh.entity.ProductSell;
import com.zzh.service.IProductOrderService;
import com.zzh.service.IProductSellService;
import com.zzh.service.IProductService;
import com.zzh.util.IDUtils;
import com.zzh.vo.OrderList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zzh
 * @since 2019-03-04
 */
@Service
public class ProductOrderServiceImpl extends ServiceImpl<ProductOrderMapper, ProductOrder> implements IProductOrderService {

    @Autowired
    private IProductSellService productSellService;
    @Autowired
    private IProductService productService;



    @Transactional(rollbackFor = Exception.class)
    @Override
    public ServerResponse createOrder(ProductOrder productOrder, ProductSell productSell) throws Exception {
        //设置id
        productOrder.setOrderNo(IDUtils.genItemId());
        //计算价格
        int num=productOrder.getPruductNum();
        double unitPrice=productSell.getpPrice();
        productOrder.setPayment(new BigDecimal(num*unitPrice));
        //判断库存
        if (productSell.getStock()<=0){
            return ServerResponse.createByErrorMessage("已销售完");
        }
        //扣除库存
        productSell.setStock(productSell.getStock()-num);
        //增加销量
        Product product=productService.selectById(productSell.getPid());
        product.setSell(product.getSell()+num);
        product.setUpdateTime(new Date());
        //更新
        productSell.setUpdateTime(new Date());
        if (!productSellService.updateById(productSell)){
                throw new Exception();
        }
        if (!productService.updateById(product)){
            throw new Exception();
        }

        //取消支付功能，默认支付成功
        productOrder.setStatus(20);
        productOrder.setCreateTime(new Date());
        productOrder.setPaymentTime(new Date());
         if (!insert(productOrder)){
             throw new Exception();
         }
         return ServerResponse.createBySuccess();
    }

    public List myOrderList(String uid){
        EntityWrapper<ProductOrder> entityWrapper=new EntityWrapper();
        entityWrapper.eq("user_id",uid);
        entityWrapper.orderBy("create_time",false);

        return splicing(selectList(entityWrapper));
    }

    private List<OrderList> splicing(List<ProductOrder> productOrders){
        List<OrderList> orderLists=new ArrayList<>();
        Product product;
        ProductSell productSell;
        for (ProductOrder productOrder:productOrders){

            OrderList orderList=new OrderList();
            orderList.setOid(productOrder.getId());
            orderList.setPid(productOrder.getProductId());
            orderList.setOrderNum(Long.toString(productOrder.getOrderNo()));
            orderList.setPayment(productOrder.getPaymentTime());
            orderList.setPrice(productOrder.getPayment().doubleValue());
            orderList.setPruductNum(productOrder.getPruductNum());
            product=productService.selectById(productOrder.getProductId());
            orderList.setTitle(product.getTitle());
            orderList.setPicUrl(product.getMainImage());
            productSell=productSellService.selectById(productOrder.getProductsellId());
            orderList.setStratDate(productSell.getStartDate());

            orderLists.add(orderList);
        }
        return orderLists;
    }
}
