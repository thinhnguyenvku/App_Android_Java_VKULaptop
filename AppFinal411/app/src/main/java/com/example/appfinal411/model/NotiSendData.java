package com.example.appfinal411.model;

import java.util.Map;

public class NotiSendData {
    private String to;
    Map<String, String> notification;

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public Map<String, String> getNotification() {
        return notification;
    }

    public void setNotification(Map<String, String> notification) {
        this.notification = notification;
    }

    public NotiSendData(String to, Map<String, String> notification) {
        this.to = to;
        this.notification = notification;

    }
}
