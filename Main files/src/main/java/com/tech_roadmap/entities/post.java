package com.tech_roadmap.entities;

import java.sql.Timestamp;

public class post {

    private int pid;
    private String title;
    private String content;
    private String code;
    private String p_pic;
    private Timestamp p_date;
    private int cid_ref;
    private int uid_ref;

//    starting of constructor

    public post(int pid, String title, String content, String code, String p_pic, Timestamp p_date, int cid_ref, int uid_ref) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.p_pic = p_pic;
        this.p_date = p_date;
        this.cid_ref = cid_ref;
        this.uid_ref = uid_ref;
    }

    public post(String title, String content, String code, String p_pic, int cid_ref, int uid_ref) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.p_pic = p_pic;
        this.cid_ref = cid_ref;
        this.uid_ref = uid_ref;
    }

    public post(String title, String content, String code, String p_pic) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.p_pic = p_pic;
    }

    public post() {
    }

    //    end of constructor

//  start  Getters and setters

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getP_pic() {
        return p_pic;
    }

    public void setP_pic(String p_pic) {
        this.p_pic = p_pic;
    }

    public Timestamp getP_date() {
        return p_date;
    }

    public void setP_date(Timestamp p_date) {
        this.p_date = p_date;
    }

    public int getCid_ref() {
        return cid_ref;
    }

    public void setCid_ref(int cid_ref) {
        this.cid_ref = cid_ref;
    }

    public int getUid_ref() {
        return uid_ref;
    }

    public void setUid_ref(int uid_ref) {
        this.uid_ref = uid_ref;
    }


    //    end of getters and setters

}
