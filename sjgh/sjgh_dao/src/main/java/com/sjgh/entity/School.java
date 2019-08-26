package com.sjgh.entity;

/*
*
* 学校实体类
*
* */

public class School {
    private Integer school_id;
    private String school_name;
    private String sheng_shi;//省或直辖市

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public String getSheng_shi() {
        return sheng_shi;
    }

    public void setSheng_shi(String sheng_shi) {
        this.sheng_shi = sheng_shi;
    }
}
