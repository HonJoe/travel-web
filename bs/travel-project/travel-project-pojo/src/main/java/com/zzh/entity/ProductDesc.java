package com.zzh.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zzh
 * @since 2019-02-13
 */
public class ProductDesc extends Model<ProductDesc> {

    private static final long serialVersionUID = 1L;

    /**
     * 产品id
     */
    @TableId(value = "pid", type = IdType.INPUT)
    private String pid;
    /**
     * 景点介绍
     */
    private String scenicDesc;
    /**
     * 行程安排
     */
    private String tripDesc;
    /**
     * 费用说明
     */
    private String costDesc;
    /**
     * 其他说明
     */
    private String otherDesc;


    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getScenicDesc() {
        return scenicDesc;
    }

    public void setScenicDesc(String scenicDesc) {
        this.scenicDesc = scenicDesc;
    }

    public String getTripDesc() {
        return tripDesc;
    }

    public void setTripDesc(String tripDesc) {
        this.tripDesc = tripDesc;
    }

    public String getCostDesc() {
        return costDesc;
    }

    public void setCostDesc(String costDesc) {
        this.costDesc = costDesc;
    }

    public String getOtherDesc() {
        return otherDesc;
    }

    public void setOtherDesc(String otherDesc) {
        this.otherDesc = otherDesc;
    }

    @Override
    protected Serializable pkVal() {
        return this.pid;
    }

    @Override
    public String toString() {
        return "ProductDesc{" +
        ", pid=" + pid +
        ", scenicDesc=" + scenicDesc +
        ", tripDesc=" + tripDesc +
        ", costDesc=" + costDesc +
        ", otherDesc=" + otherDesc +
        "}";
    }
}
