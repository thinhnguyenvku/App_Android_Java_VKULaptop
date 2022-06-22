package com.example.honghanh.vkulaptop.model.EventBus;

import com.example.honghanh.vkulaptop.model.SanPhamMoi;

public class SuaXoaEvent {
    SanPhamMoi sanPhamMoi;
    public SuaXoaEvent(SanPhamMoi sanPhamMoi) {
        this.sanPhamMoi = sanPhamMoi;
    }

    public SanPhamMoi getSanPhamMoi() {
        return sanPhamMoi;
    }

    public void setSanPhamMoi(SanPhamMoi sanPhamMoi) {
        this.sanPhamMoi = sanPhamMoi;
    }
}
