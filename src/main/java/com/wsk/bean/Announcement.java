package com.wsk.bean;

public class Announcement {
    private Integer id;

    private String announcement;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement == null ? null : announcement.trim();
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "id=" + id +
                ", announcement='" + announcement + '\'' +
                '}';
    }
}