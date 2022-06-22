package com.example.honghanh.vkulaptop.model.EventBus;

import com.example.honghanh.vkulaptop.model.DonHang;

public class DonHangEvent {
    DonHang donHang;

    public DonHang getDonHang() {
        return donHang;
    }

    public void setDonHang(DonHang donHang) {
        this.donHang = donHang;
    }

    public DonHangEvent(DonHang donHang) {
        this.donHang = donHang;
    }
}
