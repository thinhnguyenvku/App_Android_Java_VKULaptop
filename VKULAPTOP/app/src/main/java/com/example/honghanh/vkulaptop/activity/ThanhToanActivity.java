package com.example.honghanh.vkulaptop.activity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.example.honghanh.vkulaptop.R;
import com.example.honghanh.vkulaptop.model.NotiSendData;
import com.example.honghanh.vkulaptop.retrofit.ApiAppFinal;
import com.example.honghanh.vkulaptop.retrofit.ApiPushNofication;
import com.example.honghanh.vkulaptop.retrofit.RetrofitClient;
import com.example.honghanh.vkulaptop.retrofit.RetrofitClientNoti;
import com.example.honghanh.vkulaptop.utils.Utils;
import com.google.gson.Gson;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class ThanhToanActivity extends AppCompatActivity {

    EditText edtdiachi;
    TextView txttongtien, txtsdt, txtemail;
    Toolbar toolbar;
    Button btndathang;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiAppFinal apiAppFinal;
    long tongtien;
    int totalItem;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thanh_toan);

        initView();
        countItem();
        initControll();
    }

    private void countItem() {
        totalItem = 0;
        for (int i=0; i<Utils.mangmuahang.size(); i++) {
            totalItem = totalItem + Utils.mangmuahang.get(i).getSoluong();
        }
    }

    private void initControll() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });

        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        tongtien = getIntent().getLongExtra("tongtien", 0);

        txttongtien.setText(decimalFormat.format(tongtien) + " Đ");

        txtemail.setText(Utils.user_curent.getEmail());
        txtsdt.setText(Utils.user_curent.getSdt());


        btndathang.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String str_diachi = edtdiachi.getText().toString().trim();
                if (TextUtils.isEmpty(str_diachi)) {
                    Toast.makeText(getApplicationContext(), "Vui lòng nhập địa chỉ giao hàng", Toast.LENGTH_SHORT).show();
                }
                else {
                    // post data
                    String str_email = Utils.user_curent.getEmail();
                    String str_sdt = Utils.user_curent.getSdt();
                    int iduser = Utils.user_curent.getId();
                    Log.d("test", new Gson().toJson(Utils.mangmuahang));
                    compositeDisposable.add(apiAppFinal.createOrder(str_email, str_sdt, iduser, str_diachi, String.valueOf(tongtien), totalItem, new Gson().toJson(Utils.mangmuahang))
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe(
                                    userModel ->  {
//                                        pushNotiToUser();
                                        Toast.makeText(getApplicationContext(), "Mua hàng thành công", Toast.LENGTH_SHORT).show();
                                        Utils.mangmuahang.clear();
                                        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                                        startActivity(intent);
                                        finish();
                                    }, throwable -> {
                                        Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                                    }
                            ));
                }
            }
        });
    }

//    private void pushNotiToUser() {
//        // gettoken
//        compositeDisposable.add(apiAppFinal.gettoken(1)
//                .subscribeOn(Schedulers.io())
//                .observeOn(AndroidSchedulers.mainThread())
//                .subscribe(
//                        userModel -> {
//                            if (userModel.isSuccess()) { // nếu có user
//                                for (int i=0; i<userModel.getResult().size(); i++) {
//                                    Map<String, String> data = new HashMap<>();
//                                    data.put("title", "VKU LAPTOP");
//                                    data.put("body", "Bạn có đơn hàng mới");
//                                    NotiSendData notiSendData = new NotiSendData(userModel.getResult().get(i).getToken(), data);
//                                    ApiPushNofication apiPushNofication = RetrofitClientNoti.getInstance().create(ApiPushNofication.class);
//                                    compositeDisposable.add(apiPushNofication.sendNofication(notiSendData)
//                                            .subscribeOn(Schedulers.io())
//                                            .observeOn(AndroidSchedulers.mainThread())
//                                            .subscribe(
//                                                    notiResponse -> {
//
//                                                    },
//                                                    throwable -> {
//                                                        Log.d("log", throwable.getMessage());
//                                                    }
//                                            ));
//                                }
//                            }
//                        } ,
//                        throwable -> {
//                            Log.d("log", throwable.getMessage());
//                        }
//                ));
//
//
//    }


    private void initView() {
        toolbar = findViewById(R.id.toolbar);
        txtemail = findViewById(R.id.txtemail);
        txttongtien = findViewById(R.id.txttongtien);
        txtsdt = findViewById(R.id.txtsdt);
        edtdiachi = findViewById(R.id.edtdiachi);
        btndathang = findViewById(R.id.btndathang);

        apiAppFinal = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiAppFinal.class);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}