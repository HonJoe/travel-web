package com.zzh.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
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
 * @since 2019-01-27
 */
public class Customization extends Model<Customization> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
    *用户id
     */
    @TableField("uid")
    private String uid;
    @TableField("start_areaName")
    private String startAreaname;
    @TableField("end_areaName")
    private String endAreaname;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startDate;
    /**
     * 旅游天数
     */
    private String days;
    /**
     * 出发人数
     */
    private Integer number;
    /**
     * 人均消费
     */
    private String percapitaConsumption;
    /**
     * 联系人
     */
    private String personName;
    private String phone;
    /**
     * 备注
     */
    private String remarks;
    /**
     * 0未读，1已读
     */
    private Integer status;

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUid() {

        return uid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getPercapitaConsumption() {
        return percapitaConsumption;
    }

    public void setPercapitaConsumption(String percapitaConsumption) {
        this.percapitaConsumption = percapitaConsumption;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Customization{" +
        ", id=" + id +
        ", startAreaname=" + startAreaname +
        ", endAreaname=" + endAreaname +
        ", startDate=" + startDate +
        ", days=" + days +
        ", number=" + number +
        ", percapitaConsumption=" + percapitaConsumption +
        ", personName=" + personName +
        ", phone=" + phone +
        ", remarks=" + remarks +
        ", status=" + status +
        "}";
    }
}
