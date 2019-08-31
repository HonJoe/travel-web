package com.zzh.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zzh.common.ServerResponse;
import com.zzh.dao.ProductDescMapper;
import com.zzh.dao.ProductMapper;
import com.zzh.dao.ThemeProductMapper;
import com.zzh.entity.Product;
import com.zzh.entity.ProductDesc;
import com.zzh.entity.ThemeProduct;
import com.zzh.service.IProductService;
import com.zzh.util.IDUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
 * @since 2019-02-13
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductDescMapper productDescMapper;
    @Autowired
    private ThemeProductMapper themeProductMapper;



    /**
     * 创建一个产品，同时将生成产品描述(产品表切割),主题产品（中间表）
     * @param product
     * @param productDesc
     * @param  themeProducts
     * @return
     */
    @Override
    public ServerResponse create(Product product, ProductDesc productDesc, ThemeProduct[] themeProducts) throws Exception {
        //生成产品Id
        String productId=Long.toString(IDUtils.genItemId());
        product.setPid(productId);
        product.setCreateTime(new Date());

        //设置产品描述的产品id
        productDesc.setPid(productId);

        //设置主题产品的id
        List<ThemeProduct> tpList=new ArrayList();
        for (int i=0;i<themeProducts.length;i++){
            themeProducts[i].setProductId(productId);
            tpList.add(themeProducts[i]);
        }

        /********持久化到数据库****************/
        //保存
        for (int i=0;i<themeProducts.length;i++){

            if (themeProductMapper.insert(themeProducts[i])<=0){
                throw new Exception();
            }
        }

        if (productDescMapper.insert(productDesc)<=0){
            throw new Exception();
        }
        if (productMapper.insert(product)<=0){
            throw  new Exception();
        }
        return ServerResponse.createBySuccess();
    }

    /**
     * 删除
     * @param pid
     */
    public void cascadeDeleteById(String pid){

        themeProductMapper.delete(new EntityWrapper<ThemeProduct>().eq("product_id",pid));
        productDescMapper.deleteById(pid);
        productMapper.deleteById(pid);
    }

    /**
     * 批量删除
     * @param pids
     */
    @Override
    public void deleteBatchIds(String[] pids) {
        for (int i=0;i<pids.length;i++){
            cascadeDeleteById(pids[i]);
        }
    }

    /**
     * 更新
     * @param product
     * @param productDesc
     * @param themeProducts
     * @return
     * @throws Exception
     */
    public void update(Product product, ProductDesc productDesc, ThemeProduct[] themeProducts) throws Exception {

        String productId=product.getPid();
        product.setUpdateTime(new Date());
        //设置产品描述的产品id
        productDesc.setPid(productId);

        //设置主题产品的id
        List<ThemeProduct> tpList=new ArrayList();
        for (int i=0;i<themeProducts.length;i++){
            themeProducts[i].setProductId(productId);
            tpList.add(themeProducts[i]);
        }

        /********持久化到数据库****************/



        //先删除后插入
        if (themeProducts.length>0){
            themeProductMapper.delete(new EntityWrapper<ThemeProduct>().eq("product_id",themeProducts[0].getProductId()));
        }
        for (int i=0;i<themeProducts.length;i++){
            if (themeProductMapper.insert(themeProducts[i])<=0){
                throw  new Exception();
            }
        }
        if (productDescMapper.updateById(productDesc)<=0){
            throw  new Exception();
        }
        if (productMapper.updateById(product)<=0){
            throw new Exception();
        }




    }

    @Override
    public List<Product> getIndexproduct(int size) {
        EntityWrapper entityWrapper=new EntityWrapper();
        entityWrapper.orderBy("create_time",false);
        entityWrapper.eq("status",1);
        List<Product> productList=selectList(entityWrapper);
        return productList.subList(0,size);
    }

    @Override
    public List<Product> hotProduct(int size) {
        EntityWrapper entityWrapper=new EntityWrapper();
        entityWrapper.orderBy("sell",false);
        String limt="limit "+size;
        entityWrapper.last(limt);
        return selectList(entityWrapper);
    }


}
