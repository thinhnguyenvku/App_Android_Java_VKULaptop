package com.example.honghanh.vkulaptop.adapter;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.honghanh.vkulaptop.Interface.IImageClickListener;
import com.example.honghanh.vkulaptop.R;
import com.example.honghanh.vkulaptop.model.EventBus.TinhTongEvent;
import com.example.honghanh.vkulaptop.model.GioHang;
import com.example.honghanh.vkulaptop.utils.Utils;

import org.greenrobot.eventbus.EventBus;

import java.text.DecimalFormat;
import java.util.List;

public class GioHangAdapter extends RecyclerView.Adapter<GioHangAdapter.MyViewHolder> {

    Context context;
    List<GioHang> gioHangList;

    public GioHangAdapter(Context context, List<GioHang> gioHangList) {
        this.context = context;
        this.gioHangList = gioHangList;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_giohang, parent,false);

        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {

        GioHang gioHang = gioHangList.get(position);
        holder.item_giohang_tensp.setText(gioHang.getTensp());
        holder.item_giohang_soluong.setText(gioHang.getSoluong() + " ");
        if (gioHang.getHinhsp().contains("http")) {
            Glide.with(context).load(gioHang.getHinhsp()).into(holder.item_giohang_image);
        }
        else {
            String hinhanh = Utils.BASE_URL + "images/" + gioHang.getHinhsp();
            Glide.with(context).load(hinhanh).into(holder.item_giohang_image);
        }
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.item_giohang_gia.setText("Giá: " + decimalFormat.format((gioHang.getGia())) + " Đ");
        long gia = gioHang.getSoluong() * gioHang.getGia();
        holder.item_giohang_giasp2.setText(decimalFormat.format(gia) + " Đ");
        holder.checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if (b) {
                    Utils.mangmuahang.add(gioHang);
                    EventBus.getDefault().postSticky(new TinhTongEvent());
                }
                else {
                    for (int i=0; i<Utils.mangmuahang.size(); i++) {
                        if (Utils.mangmuahang.get(i).getIdsp() == gioHang.getIdsp()) {
                            Utils.mangmuahang.remove(i);
                            EventBus.getDefault().postSticky(new TinhTongEvent());
                        }
                    }
                }
            }
        });


        holder.setListener(new IImageClickListener() {
            @Override
            public void onImageClick(View view, int pos, int giatri) {
                if (giatri == 1) {
                    if (gioHangList.get(pos).getSoluong() > 1) {
                        int soluongmoi = gioHangList.get(pos).getSoluong()-1;
                        gioHangList.get(pos).setSoluong(soluongmoi);

                        holder.item_giohang_soluong.setText(gioHangList.get(pos).getSoluong() + " ");
                        long gia = gioHangList.get(pos).getSoluong() * gioHangList.get(pos).getGia();
                        holder.item_giohang_giasp2.setText(decimalFormat.format(gia) + " Đ");

                        EventBus.getDefault().postSticky(new TinhTongEvent());
                    }
                    else if (gioHangList.get(pos).getSoluong() == 1) {
                        AlertDialog.Builder builder = new AlertDialog.Builder(view.getRootView().getContext());
                        builder.setTitle("Thông báo");
                        builder.setMessage("Bạn có muốn xóa sản phẩm này khỏi giỏ hàng không?");
                        builder.setPositiveButton("Đồng ý", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                Utils.manggiohang.remove(pos);
                                notifyDataSetChanged();
                                EventBus.getDefault().postSticky(new TinhTongEvent());
                            }
                        });
                        builder.setNegativeButton("Hủy", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                dialogInterface.dismiss();
                            }
                        });
                        builder.show();
                    }
                }
                else if (giatri == 2) {
                    if (gioHangList.get(pos).getSoluong() < 11) {
                        int soluongmoi = gioHangList.get(pos).getSoluong()+1;
                        gioHangList.get(pos).setSoluong(soluongmoi);
                    }

                    holder.item_giohang_soluong.setText(gioHangList.get(pos).getSoluong() + " ");
                    long gia = gioHangList.get(pos).getSoluong() * gioHangList.get(pos).getGia();
                    holder.item_giohang_giasp2.setText(decimalFormat.format(gia) + " Đ");

                    EventBus.getDefault().postSticky(new TinhTongEvent());
                }
            }
        });

    }

    @Override
    public int getItemCount() {
        return gioHangList.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        ImageView item_giohang_image, imgtru, imgcong;
        TextView item_giohang_tensp, item_giohang_gia, item_giohang_soluong, item_giohang_giasp2;
        IImageClickListener listener;
        CheckBox checkBox;


        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            checkBox = itemView.findViewById(R.id.item_giohang_check);
            item_giohang_image = itemView.findViewById(R.id.item_giohang_image);
            item_giohang_tensp = itemView.findViewById(R.id.item_giohang_tensp);
            item_giohang_gia = itemView.findViewById(R.id.item_giohang_gia);
            item_giohang_giasp2 = itemView.findViewById(R.id.item_giohang_giasp2);
            item_giohang_soluong = itemView.findViewById(R.id.item_giohang_soluong);
            imgtru = itemView.findViewById(R.id.item_giohang_tru);
            imgcong = itemView.findViewById(R.id.item_giohang_cong);

            // event click
            imgcong.setOnClickListener(this);
            imgtru.setOnClickListener(this);
        }

        public void setListener(IImageClickListener listener) {
            this.listener = listener;
        }

        @Override
        public void onClick(View view) {
            if (view == imgtru ) {
                // 1 = cong
                listener.onImageClick(view, getAdapterPosition(), 1);
            }
            else if (view == imgcong) {
                // 2 = tru
                listener.onImageClick(view, getAdapterPosition(), 2);
            }

        }
    }

}
