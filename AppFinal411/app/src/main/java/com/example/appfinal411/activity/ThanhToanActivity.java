package com.example.appfinal411.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.appfinal411.R;
import com.example.appfinal411.model.CreateOrder;
import com.example.appfinal411.model.NotiSendData;
import com.example.appfinal411.retrofit.ApiAppFinal;
import com.example.appfinal411.retrofit.ApiPushNofication;
import com.example.appfinal411.retrofit.RetrofitClient;
import com.example.appfinal411.retrofit.RetrofitClientNoti;
import com.example.appfinal411.utils.Utils;
import com.google.gson.Gson;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import vn.momo.momo_partner.AppMoMoLib;
import vn.zalopay.sdk.Environment;
import vn.zalopay.sdk.ZaloPayError;
import vn.zalopay.sdk.ZaloPaySDK;
import vn.zalopay.sdk.listeners.PayOrderListener;

public class ThanhToanActivity extends AppCompatActivity {

    EditText edtdiachi;
    TextView txttongtien, txtsdt, txtemail;
    Toolbar toolbar;
    Button btndathang, btnmomo, btnzalo;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiAppFinal apiAppFinal;
    long tongtien;
    int totalItem;
    int iddonghang;

    private String amount = "1000000";
    private String fee = "0";
    int environment = 0;  //developer default
    private String merchantName = "VKU LAPTOP";
    private String merchantCode = "MOMOG9MR20220526";
    private String merchantNameLabel = "VKU LAPTOP";
    private String description = "Mua máy tính và phụ kiện tại VKU LAPTOP";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thanh_toan);

        // momo
        AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT); // AppMoMoLib.ENVIRONMENT.PRODUCTION

        //zalo
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        ZaloPaySDK.init(2554, Environment.SANDBOX);

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


    //Get token through MoMo app
    private void requestPayment(String iddonhang) {
        AppMoMoLib.getInstance().setAction(AppMoMoLib.ACTION.PAYMENT);
        AppMoMoLib.getInstance().setActionType(AppMoMoLib.ACTION_TYPE.GET_TOKEN);

        Map<String, Object> eventValue = new HashMap<>();
        //client Required
        eventValue.put("merchantname", merchantName); //Tên đối tác. được đăng ký tại https://business.momo.vn. VD: Google, Apple, Tiki , CGV Cinemas
        eventValue.put("merchantcode", merchantCode); //Mã đối tác, được cung cấp bởi MoMo tại https://business.momo.vn
        eventValue.put("amount", amount); //Kiểu integer
        eventValue.put("orderId", iddonhang); //uniqueue id cho Bill order, giá trị duy nhất cho mỗi đơn hàng
        eventValue.put("orderLabel", iddonhang); //gán nhãn

        //client Optional - bill info
        eventValue.put("merchantnamelabel", "Dịch vụ");//gán nhãn
        eventValue.put("fee", "0"); //Kiểu integer
        eventValue.put("description", description); //mô tả đơn hàng - short description

        //client extra data
        eventValue.put("requestId",  merchantCode+"merchant_billId_"+System.currentTimeMillis());
        eventValue.put("partnerCode", merchantCode);
        //Example extra data
        JSONObject objExtraData = new JSONObject();
        try {
            objExtraData.put("site_code", "008");
            objExtraData.put("site_name", "CGV Cresent Mall");
            objExtraData.put("screen_code", 0);
            objExtraData.put("screen_name", "Special");
            objExtraData.put("movie_name", "Kẻ Trộm Mặt Trăng 3");
            objExtraData.put("movie_format", "2D");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        eventValue.put("extraData", objExtraData.toString());

        eventValue.put("extra", "");
        AppMoMoLib.getInstance().requestMoMoCallBack(this, eventValue);


    }
    //Get token callback from MoMo app an submit to server side
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode == AppMoMoLib.getInstance().REQUEST_CODE_MOMO && resultCode == -1) {
            if(data != null) {
                if(data.getIntExtra("status", -1) == 0) {
                    //TOKEN IS AVAILABLE

                    Log.d("thanhcong", data.getStringExtra("message"));


//                    tvMessage.setText("message: " + "Get token " + data.getStringExtra("message"));

                    String token = data.getStringExtra("data"); //Token response

                    compositeDisposable.add(apiAppFinal.updatemomo(iddonghang,token)
                            .subscribeOn(Schedulers.io())
                            .observeOn(AndroidSchedulers.mainThread())
                            .subscribe(
                                    messageModel -> {
                                        if (messageModel.isSuccess()) {
                                            Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                                            startActivity(intent);
                                            pushNotiToUser();
                                            finish();
                                        }
                                    },
                                    throwable -> {
                                        Log.d("error", throwable.getMessage());
                                    }
                            ));

                    String phoneNumber = data.getStringExtra("phonenumber");
                    String env = data.getStringExtra("env");
                    if(env == null){
                        env = "app";
                    }

                    if(token != null && !token.equals("")) {
                        // TODO: send phoneNumber & token to your server side to process payment with MoMo server
                        // IF Momo topup success, continue to process your order
                    } else {

                        Log.d("thanhcong", "không thành công");


//                        tvMessage.setText("message: " + this.getString(R.string.not_receive_info));
                    }
                } else if(data.getIntExtra("status", -1) == 1) {
                    //TOKEN FAIL
                    String message = data.getStringExtra("message") != null?data.getStringExtra("message"):"Thất bại";

                    Log.d("thanhcong", "không thành công");

//                    tvMessage.setText("message: " + message);
                } else if(data.getIntExtra("status", -1) == 2) {
                    //TOKEN FAIL
//                    tvMessage.setText("message: " + this.getString(R.string.not_receive_info));

                    Log.d("thanhcong", "không thành công");

                } else {
                    //TOKEN FAIL

//                    tvMessage.setText("message: " + this.getString(R.string.not_receive_info));

                    Log.d("thanhcong", "không thành công");

                }
            } else {
//                tvMessage.setText("message: " + this.getString(R.string.not_receive_info));

                Log.d("thanhcong", "không thành công");

            }
        } else {
//            tvMessage.setText("message: " + this.getString(R.string.not_receive_info_err));

            Log.d("thanhcong", "không thành công");
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
                                    messageModel ->  {
                                        pushNotiToUser();

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


        btnmomo.setOnClickListener(new View.OnClickListener() {
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
                                    messageModel ->  {
                                        iddonghang = Integer.parseInt(messageModel.getIddonhang());

                                        requestPayment(messageModel.getIddonhang());

//                                        Toast.makeText(getApplicationContext(), "Mua hàng thành công", Toast.LENGTH_SHORT).show();
                                        Utils.mangmuahang.clear();

//                                        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
//                                        startActivity(intent);
//                                        finish();
                                    }, throwable -> {
                                        Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                                    }
                            ));
                }
            }
        });




        btnzalo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
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
                                    messageModel ->  {
                                        iddonghang = Integer.parseInt(messageModel.getIddonhang());

                                        requestZalo();

//                                        Toast.makeText(getApplicationContext(), "Mua hàng thành công", Toast.LENGTH_SHORT).show();
                                        Utils.mangmuahang.clear();

//                                        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
//                                        startActivity(intent);
//                                        finish();
                                    }, throwable -> {
                                        Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                                    }
                            ));
                }
            }
        });
    }

    private void requestZalo() {
        CreateOrder orderApi = new CreateOrder();

        try {
            JSONObject data = orderApi.createOrder("1000000");
            String code = data.getString("return_code");

            if (code.equals("1")) {
                String token = data.getString("zp_trans_token");
                Log.d("test", token);

                ZaloPaySDK.getInstance().payOrder(ThanhToanActivity.this, token, "demozpdk://app", new PayOrderListener() {
                    @Override
                    public void onPaymentSucceeded(String s, String s1, String s2) {
                        compositeDisposable.add(apiAppFinal.updatemomo(iddonghang,token)
                                .subscribeOn(Schedulers.io())
                                .observeOn(AndroidSchedulers.mainThread())
                                .subscribe(
                                        messageModel -> {
                                            if (messageModel.isSuccess()) {
                                                Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                                                startActivity(intent);
                                                pushNotiToUser();
                                                finish();
                                            }
                                        },
                                        throwable -> {
                                            Log.d("error", throwable.getMessage());
                                        }
                                ));

                    }

                    @Override
                    public void onPaymentCanceled(String s, String s1) {

                    }

                    @Override
                    public void onPaymentError(ZaloPayError zaloPayError, String s, String s1) {

                    }
                });
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void pushNotiToUser() {
        // gettoken
        compositeDisposable.add(apiAppFinal.gettoken(1)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                       userModel -> {
                           if (userModel.isSuccess()) { // nếu có user
                                for (int i=0; i<userModel.getResult().size(); i++) {
                                    Map<String, String> data = new HashMap<>();
                                    data.put("title", "VKU LAPTOP");
                                    data.put("body", "Bạn có đơn hàng mới");
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

    private void initView() {
        toolbar = findViewById(R.id.toolbar);
        txtemail = findViewById(R.id.txtemail);
        txttongtien = findViewById(R.id.txttongtien);
        txtsdt = findViewById(R.id.txtsdt);
        edtdiachi = findViewById(R.id.edtdiachi);
        btndathang = findViewById(R.id.btndathang);
        btnmomo = findViewById(R.id.btnmomo);
        btnzalo = findViewById(R.id.btnzalopay);

        apiAppFinal = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiAppFinal.class);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        ZaloPaySDK.getInstance().onResult(intent);
    }
}