package com.zzh.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 地区码表
 * </p>
 *
 * @author zzh
 * @since 2019-02-03
 */
public class Area extends Model<Area> {

    private static final long serialVersionUID = 1L;

    /**
     * 地区Id
     */
    @TableId(value = "areaId", type = IdType.AUTO)
    private Integer areaId;
    /**
     * 地区编码
     */
    @TableField("areaCode")
    private String areaCode;
    /**
     * 地区名
     */
    @TableField("areaName")
    private String areaName;
    /**
     * 地区级别（1:省份province,2:市city,3:区县district,4:街道street）
     */
    private Integer level;
    /**
     * 城市编码
     */
    @TableField("cityCode")
    private String cityCode;
    /**
     * 城市中心点（即：经纬度坐标）
     */
    private String center;
    /**
     * 地区父节点
     */
    @TableField("parentId")
    private Integer parentId;


    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getCenter() {
        return center;
    }

    public void setCenter(String center) {
        this.center = center;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Override
    protected Serializable pkVal() {
        return this.areaId;
    }

    @Override
    public String toString() {
        return "Area{" +
        ", areaId=" + areaId +
        ", areaCode=" + areaCode +
        ", areaName=" + areaName +
        ", level=" + level +
        ", cityCode=" + cityCode +
        ", center=" + center +
        ", parentId=" + parentId +
        "}";
    }
}
