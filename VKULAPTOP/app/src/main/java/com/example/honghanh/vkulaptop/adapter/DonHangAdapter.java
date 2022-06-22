package com.example.honghanh.vkulaptop.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.honghanh.vkulaptop.Interface.ItemClickListener;
import com.example.honghanh.vkulaptop.R;
import com.example.honghanh.vkulaptop.model.DonHang;
import com.example.honghanh.vkulaptop.model.EventBus.DonHangEvent;

import org.greenrobot.eventbus.EventBus;

import java.util.List;

public class DonHangAdapter extends RecyclerView.Adapter<DonHangAdapter.MyViewHolder> {
    private RecyclerView.RecycledViewPool viewPool = new RecyclerView.RecycledViewPool();
    List<DonHang> listdonhang;
    Context context;

    public DonHangAdapter(List<DonHang> listdonhang, Context context) {
        this.listdonhang = listdonhang;
        this.context = context;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_donhang, parent, false);

        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        DonHang donHang = listdonhang.get(position);
        holder.txtdonhang.setText("Đơn hàng: " + donHang.getId() );
        holder.trangthai.setText(trangThaiDon(donHang.getTrangthai()));

        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(
                holder.reChitiet.getContext(),
                LinearLayoutManager.VERTICAL,
                false
        );
        linearLayoutManager.setInitialPrefetchItemCount(donHang.getItem().size());

        // adapter chitiet
        ChitietAdapter chitietAdapter = new ChitietAdapter(context, donHang.getItem());
        holder.reChitiet.setLayoutManager(linearLayoutManager);
        holder.reChitiet.setAdapter(chitietAdapter);
        holder.reChitiet.setRecycledViewPool(viewPool);

        // bắt sự kiện update trình trạng đơn hàng
//        holder.setListener(new ItemClickListener() {
//            @Override
//            public void onClick(View view, int pos, boolean isLongClick) {
//                if (isLongClick) {      // click
//                    EventBus.getDefault().postSticky(new DonHangEvent(donHang));
//                }
//            }
//        });

        holder.trangthai.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EventBus.getDefault().postSticky(new DonHangEvent(donHang));
            }
        });
    }

    private  String trangThaiDon(int status) {
        String result  = "";
        switch (status) {
            case 0:
                result = "Đơn hàng đang được xử lí";
                break;
            case 1:
                result = "Đơn hàng đã được xử lí";
                break;
            case 2:
                result = "Đã giao cho đơn vị vận chuyển";
                break;
            case 3:
                result = "Giao hàng thành công";
                break;
            case 4:
                result = "Đã hủy";
                break;
        }
        return result;
    }

    @Override
    public int getItemCount() {
        return listdonhang.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnLongClickListener {
        TextView txtdonhang;
        RecyclerView reChitiet;
        ItemClickListener listener;
        Button trangthai;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            txtdonhang = itemView.findViewById(R.id.iddonhang);
            trangthai = itemView.findViewById(R.id.tinhtrang);
            reChitiet = itemView.findViewById(R.id.recyclerview_chitiet);
            itemView.setOnLongClickListener(this);

        }

        public void setListener(ItemClickListener listener) {
            this.listener = listener;
        }

        @Override
        public boolean onLongClick(View view) {
            listener.onClick(view,getAdapterPosition(), true);

            return false;
        }
    }
}
