package com.zzh.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zzh
 * @since 2019-02-17
 */
public class Product extends Model<Product> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "pid", type = IdType.INPUT)
    private String pid;
    private String title;
    private Double price;
    /**
     * 产品主图,url相对地址
     */
    private String mainImage;
    /**
     * 图片地址,json格式,扩展用
     */
    private String subImages;
    /**
     * 销量
     */
    private Integer sell;
    /**
     * 商品状态，1-正常，2-下架，3-删除
     */
    private Integer status;
    /**
     * 活动人数
     */
    private Integer activeNum;
    /**
     * 活动天数
     */
    private Integer activeDays;
    /**
     * 出发地地址id
     */
    @TableField("start_areaId")
    private Integer startAreaid;
    /**
     * 目的地区域id
     */
    @TableField("end_areaId")
    private Integer endAreaid;
    /**
     * 冗余字段
     */
    @TableField("start_areaName")
    private String startAreaname;
    /**
     * 冗余字段
     */
    @TableField("end_areaName")
    private String endAreaname;
    private Date createTime;
    private Date updateTime;

    public Integer getSell() {
        return sell;
    }

    public void setSell(Integer sell) {
        this.sell = sell;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public String getSubImages() {
        return subImages;
    }

    public void setSubImages(String subImages) {
        this.subImages = subImages;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getActiveNum() {
        return activeNum;
    }

    public void setActiveNum(Integer activeNum) {
        this.activeNum = activeNum;
    }

    public Integer getActiveDays() {
        return activeDays;
    }

    public void setActiveDays(Integer activeDays) {
        this.activeDays = activeDays;
    }

    public Integer getStartAreaid() {
        return startAreaid;
    }

    public void setStartAreaid(Integer startAreaid) {
        this.startAreaid = startAreaid;
    }

    public Integer getEndAreaid() {
        return endAreaid;
    }

    public void setEndAreaid(Integer endAreaid) {
        this.endAreaid = endAreaid;
    }

    public String getStartAreaname() {
        return startAreaname;
    }

    public void setStartAreaname(String startAreaname) {
        this.startAreaname = startAreaname;
    }

    public String getEndAreaname() {
        return endAreaname;
    }

    public void setEndAreaname(String endAreaname) {
        this.endAreaname = endAreaname;
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
        return this.pid;
    }

    @Override
    public String toString() {
        return "Product{" +
        ", pid=" + pid +
        ", title=" + title +
        ", price=" + price +
        ", mainImage=" + mainImage +
        ", subImages=" + subImages +
        ", status=" + status +
        ", activeNum=" + activeNum +
        ", activeDays=" + activeDays +
        ", startAreaid=" + startAreaid +
        ", endAreaid=" + endAreaid +
        ", startAreaname=" + startAreaname +
        ", endAreaname=" + endAreaname +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
