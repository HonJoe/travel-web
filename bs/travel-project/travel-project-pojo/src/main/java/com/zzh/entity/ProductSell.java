package com.zzh.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.Version;
import com.baomidou.mybatisplus.enums.IdType;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zzh
 * @since 2019-02-19
 */
public class ProductSell extends Model<ProductSell> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 产品id
     */
    private String pid;
    /**
     * 产品名称
     */
    private String pName;
    /**
     * 价格
     */
    private Double pPrice;
    /**
     * 销售状态,1正常,2下架
     */
    private Integer status;
    /**
     * 出发日期
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startDate;
    /**
     * 活动天数
     */
    private Integer activeDays;
    /**
     * 库存
     */
    private Integer stock;
    /**
     * 版本
     */
    @Version
    private Integer version;
    private Date createTime;
    private Date updateTime;

    public ProductSell(){
        super();
    }
    public ProductSell(ProductSell productSell){
        this.pid=productSell.getPid();
        this.pName=productSell.getpName();
        this.pPrice=productSell.getpPrice();
        this.status=productSell.getStatus();
        this.startDate=productSell.getStartDate();
        this.stock=productSell.getStock();
        this.activeDays=productSell.getActiveDays();
        this.createTime=productSell.getCreateTime();
        this.updateTime=productSell.getUpdateTime();


    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Double getpPrice() {
        return pPrice;
    }

    public void setpPrice(Double pPrice) {
        this.pPrice = pPrice;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Integer getActiveDays() {
        return activeDays;
    }

    public void setActiveDays(Integer activeDays) {
        this.activeDays = activeDays;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ProductSell{" +
        ", id=" + id +
        ", pid=" + pid +
        ", pName=" + pName +
        ", pPrice=" + pPrice +
        ", status=" + status +
        ", startDate=" + startDate +
        ", activeDays=" + activeDays +
        ", stock=" + stock +
        ", version=" + version +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
