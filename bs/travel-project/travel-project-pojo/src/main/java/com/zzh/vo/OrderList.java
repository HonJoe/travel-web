package com.zzh.vo;


import java.util.Date;

/**
 * Created by lenovo on 2019/3/5.
 */
public class OrderList {

    private String oid;
    private String pid;
    private String orderNum;
    private String title;
    private String picUrl;
    private Date stratDate;
    private int pruductNum;
    private double price;
    private Date payment;

    public int getPruductNum() {
        return pruductNum;
    }

    public void setPruductNum(int pruductNum) {
        this.pruductNum = pruductNum;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getOid() {
        return oid;
    }

    public String getPid() {
        return pid;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public void setStratDate(Date stratDate) {
        this.stratDate = stratDate;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setPayment(Date payment) {
        this.payment = payment;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public String getTitle() {
        return title;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public Date getStratDate() {
        return stratDate;
    }

    public double getPrice() {
        return price;
    }

    public Date getPayment() {
        return payment;
    }
}
