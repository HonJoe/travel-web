package com.zzh.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author zzh
 * @since 2019-03-05
 */
public class ProductOrder extends Model<ProductOrder> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单id
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 订单号
     */
    private Long orderNo;
    /**
     * 用户id
     */
    private String userId;
    /**
     * 产品id
     */
    private String productId;
    /**
     * 产品销售id
     */
    private String productsellId;
    /**
     * 联系人
     */
    private String username;
    /**
     * 联系号码
     */
    private String phone;
    /**
     * 备注
     */
    private String remarks;
    /**
     * 产品数量
     */
    private Integer pruductNum;
    /**
     * 实际付款金额,单位是元,保留两位小数
     */
    private BigDecimal payment;
    /**
     * 支付类型,1-在线支付
     */
    private Integer paymentType;
    /**
     * 订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭
     */
    private Integer status;
    /**
     * 支付时间
     */
    private Date paymentTime;
    /**
     * 交易完成时间
     */
    private Date endTime;
    /**
     * 交易关闭时间
     */
    private Date closeTime;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Long orderNo) {
        this.orderNo = orderNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductsellId() {
        return productsellId;
    }

    public void setProductsellId(String productsellId) {
        this.productsellId = productsellId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getPruductNum() {
        return pruductNum;
    }

    public void setPruductNum(Integer pruductNum) {
        this.pruductNum = pruductNum;
    }

    public BigDecimal getPayment() {
        return payment;
    }

    public void setPayment(BigDecimal payment) {
        this.payment = payment;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
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
        return "ProductOrder{" +
                ", id=" + id +
                ", orderNo=" + orderNo +
                ", userId=" + userId +
                ", productId=" + productId +
                ", productsellId=" + productsellId +
                ", username=" + username +
                ", phone=" + phone +
                ", remarks=" + remarks +
                ", pruductNum=" + pruductNum +
                ", payment=" + payment +
                ", paymentType=" + paymentType +
                ", status=" + status +
                ", paymentTime=" + paymentTime +
                ", endTime=" + endTime +
                ", closeTime=" + closeTime +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }
}
