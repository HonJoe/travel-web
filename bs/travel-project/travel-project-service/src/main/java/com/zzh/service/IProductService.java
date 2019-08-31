package com.zzh.service;

import com.baomidou.mybatisplus.service.IService;
import com.zzh.common.ServerResponse;
import com.zzh.entity.Product;
import com.zzh.entity.ProductDesc;
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
public interface IProductService extends IService<Product> {

    public ServerResponse create(Product product, ProductDesc productDesc, ThemeProduct[] themeProducts) throws Exception;

    public void cascadeDeleteById(String pid);

    public void deleteBatchIds(String[] pids);

    public void update(Product product, ProductDesc productDesc, ThemeProduct[] themeProducts) throws Exception;

    public List<Product> getIndexproduct(int size);

    public List<Product> hotProduct(int size);

}
