package com.example.honghanh.vkulaptop.activity;

import android.media.metrics.Event;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.honghanh.vkulaptop.R;
import com.example.honghanh.vkulaptop.adapter.DonHangAdapter;
import com.example.honghanh.vkulaptop.model.DonHang;
import com.example.honghanh.vkulaptop.model.EventBus.DonHangEvent;
import com.example.honghanh.vkulaptop.model.NotiSendData;
import com.example.honghanh.vkulaptop.retrofit.ApiAppFinal;
import com.example.honghanh.vkulaptop.retrofit.ApiPushNofication;
import com.example.honghanh.vkulaptop.retrofit.RetrofitClient;
import com.example.honghanh.vkulaptop.retrofit.RetrofitClientNoti;
import com.example.honghanh.vkulaptop.utils.Utils;
import com.google.android.gms.common.api.Api;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class XemDonActivity extends AppCompatActivity {
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiAppFinal apiAppFinal;
    RecyclerView redonhang;
    Toolbar toolbar;
    DonHang donHang;
    int tinhtrang;
    AlertDialog dialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_xem_don);
        initView();
        initToolbar();
        getOrder();

    }

    private void getOrder() {
        compositeDisposable.add(apiAppFinal.xemDonHang(0)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        donHangModel -> {
                            DonHangAdapter adapter = new DonHangAdapter(donHangModel.getResult(), getApplicationContext());
                            redonhang.setAdapter(adapter);
                        },
                        throwable -> {
                            Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                        }
                ));
    }

    private void initToolbar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }

    private void initView() {
        toolbar = findViewById(R.id.toolbar);
        apiAppFinal = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiAppFinal.class);
        redonhang = findViewById(R.id.recycleview_donhang);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this);
        redonhang.setLayoutManager(linearLayoutManager);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }

    @Subscribe(sticky = true, threadMode = ThreadMode.MAIN)
    public void evenDonHang(DonHangEvent event) {
        if (event != null ) {
            // lấy đơn hàng cần cập nhật
            donHang = event.getDonHang();
            showCustumDialog();

        }
    }

    private void showCustumDialog() {
        LayoutInflater inflater = getLayoutInflater();
        View view = inflater.inflate(R.layout.dialog_donhang, null);
        Spinner spinner = view.findViewById(R.id.spinner_dialog);
        Button btndongy = view.findViewById(R.id.dongy_dialog);

        // đổ dữ liệu về cho spinner
        List<String> list = new ArrayList<>();
        list.add("Đơn hàng đang được xử lí");
        list.add("Đơn hàng đã được xử lí");
        list.add("Đã giao cho đơn vị vận chuyển");
        list.add("Giao hàng thành công");
        list.add("Đã hủy");
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, list);
        spinner.setAdapter(adapter);
        spinner.setSelection(donHang.getTrangthai());

        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                tinhtrang = i;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        // update trạng thái đơn hàng lên db
        btndongy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                capNhatDonHang();
            }
        });

        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setView(view);
        dialog = builder.create();
        dialog.show();

    }

    private void capNhatDonHang() {     // update db
        compositeDisposable.add(apiAppFinal.suaDonHang(donHang.getId(), tinhtrang)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        messageModel -> {
                            getOrder();
                            dialog.dismiss();       //load lại
                            pushNotiToUser();
                        },
                        throwable -> {
                            Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                        }
                ));
    }


    private void pushNotiToUser() {
        // gettoken
        compositeDisposable.add(apiAppFinal.gettoken(0, donHang.getIduser())
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        userModel -> {
                            if (userModel.isSuccess()) { // nếu có user
                                for (int i=0; i<userModel.getResult().size(); i++) {
                                    Map<String, String> data = new HashMap<>();
                                    data.put("title", "VKU LAPTOP");
                                    data.put("body", trangThaiDon(tinhtrang));
                                    NotiSendData notiSendData = new NotiSendData(userModel.getResult().get(i).getToken(), data);
                                    ApiPushNofication apiPushNofication = RetrofitClientNoti.getInstance().create(ApiPushNofication.class);
                                    compositeDisposable.add(apiPushNofication.sendNofication(notiSendData)
                                            .subscribeOn(Schedulers.io())
                                            .observeOn(AndroidSchedulers.mainThread())
                                            .subscribe(
                                                    notiResponse -> {

                                                    },
                                                    throwable -> {
                                                        Log.d("log", throwable.getMessage());
                                                    }
                                            ));
                                }
                            }
                        } ,
                        throwable -> {
                            Log.d("log", throwable.getMessage());
                        }
                ));
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
    protected void onStart() {
        super.onStart();
        EventBus.getDefault().register(this);
    }

    @Override
    protected void onStop() {
        super.onStop();
        EventBus.getDefault().unregister(this);
    }
}