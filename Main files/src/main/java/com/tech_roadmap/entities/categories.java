package com.tech_roadmap.entities;

public class categories {

    private int cid;
    private String name;
    private String description;
    private String cimg;

//   start of constructor

    public categories(int cid, String name, String description, String cimg) {
        this.cid = cid;
        this.name = name;
        this.description = description;
        this.cimg = cimg;
    }

    public categories() {
    }

    public categories(String name, String description, String cimg) {
        this.name = name;
        this.description = description;
        this.cimg = cimg;
    }

//    end of constructor

//  start getters and setters

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCimg() {
        return cimg;
    }

    public void setCimg(String cimg) {
        this.cimg = cimg;
    }

//    end of getters and setters

}
