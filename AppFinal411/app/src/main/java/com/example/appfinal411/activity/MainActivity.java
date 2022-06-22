package com.example.appfinal411.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.appcompat.widget.Toolbar;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;


import com.bumptech.glide.Glide;
import com.example.appfinal411.R;
import com.example.appfinal411.adapter.LoaiSpAdapter;
import com.example.appfinal411.adapter.SanPhamMoiAdapter;
import com.example.appfinal411.model.LoaiSp;
import com.example.appfinal411.model.SanPhamMoi;
import com.example.appfinal411.model.User;
import com.example.appfinal411.retrofit.ApiAppFinal;
import com.example.appfinal411.retrofit.RetrofitClient;
import com.example.appfinal411.utils.Utils;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.material.navigation.NavigationView;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.messaging.FirebaseMessaging;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.paperdb.Paper;
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.core.Scheduler;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MainActivity extends AppCompatActivity {
    Toolbar toolbar;
    ViewFlipper viewFlipper;
    RecyclerView recyclerViewManHinhChinh;
    NavigationView navigationView;
    ListView listViewManHinhChinh;
    DrawerLayout drawerLayout;
    LoaiSpAdapter loaiSpAdapter;
    List<LoaiSp> mangloaisp;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiAppFinal apiAppFinal;
    List<SanPhamMoi> mangSpMoi;
    SanPhamMoiAdapter spAdapter;
    NotificationBadge badge;
    FrameLayout frameLayout;
    ImageView imgsearch;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        apiAppFinal = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiAppFinal.class);

        Paper.init(this);
        if (Paper.book().read("user") != null ) {
            User user = Paper.book().read("user");
            Utils.user_curent = user;
        }

        getToken();
        Anhxa();
        ActionBar();

//        Log.d("AAA", "DA DEN DAY 1111");
        if(isConnected(this)){
//            Log.d("logg", "DA DEN DAY");
            ActionViewFlipper();
            getLoaiSanPham();
            getSpMoi();
            getEventClick();
        }else{
            Toast.makeText(getApplicationContext(), "Không có Internet", Toast.LENGTH_LONG).show();
        }
    }

    private void getToken() {
        FirebaseMessaging.getInstance().getToken()
                .addOnSuccessListener(new OnSuccessListener<String>() {
                    @Override
                    public void onSuccess(String s) {
                        if (!TextUtils.isEmpty(s)) {
                            compositeDisposable.add(apiAppFinal.suaToken(Utils.user_curent.getId(), s)
                                    .subscribeOn(Schedulers.io())
                                    .observeOn(AndroidSchedulers.mainThread())
                                    .subscribe(
                                            messageModel -> {

                                            },
                                            throwable -> {
                                                Log.d("log", throwable.getMessage());
                                            }
                                    ));

                        }
                    }
                });
    }


    private void getEventClick() {
        listViewManHinhChinh.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                switch (i) {
                    case 0:
                        Intent trangchu = new Intent(getApplicationContext(), MainActivity.class);
                        startActivity(trangchu);
                        break;
                    case 1:
                        Intent dienthoai = new Intent(getApplicationContext(), DienThoaiActivity.class);
                        dienthoai.putExtra("loai", 1);
                        startActivity(dienthoai);
                        break;
                    case 2:
                        Intent laptop = new Intent(getApplicationContext(), DienThoaiActivity.class);
                        laptop.putExtra("loai", 2);
                        startActivity(laptop);
                        break;
                    case 3:
                        Intent lienhe = new Intent(getApplicationContext(), LienHeActivity.class);
                        startActivity(lienhe);
                        break;
                    case 5:
                        Intent donhang = new Intent(getApplicationContext(), XemDonActivity.class);
                        startActivity(donhang);
                        break;
                    case 6:
                        // xoa key user
                        Paper.book().delete("user");

                        Intent dangxuat = new Intent(getApplicationContext(), DangNhapActivity.class);
                        startActivity(dangxuat);
                        finish();
                        FirebaseAuth.getInstance().signOut();
                        break;
                }
            }
        });
    }

    private void getSpMoi() {
        compositeDisposable.add(apiAppFinal.getSpMoi()
        .subscribeOn(Schedulers.io())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(
                sanPhamMoiModel -> {
                    if (sanPhamMoiModel.isSuccess()) {
                        mangSpMoi = sanPhamMoiModel.getResult();
                        spAdapter = new SanPhamMoiAdapter(getApplicationContext(), mangSpMoi);
                        recyclerViewManHinhChinh.setAdapter(spAdapter);

                    }
                },
                throwable -> {
                    Toast.makeText(getApplicationContext(), "Không kết nối được với sever" + throwable.getMessage(), Toast.LENGTH_SHORT).show();
                }
        ));
    }

    private void getLoaiSanPham() {

        compositeDisposable.add(apiAppFinal.getLoaiSp()
        .subscribeOn(Schedulers.io())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(
                loaiSpModel -> {
                    if(loaiSpModel.isSuccess()){
//                        Toast.makeText(getApplicationContext(), loaiSpModel.getResult().get(0).getTensanpham(), Toast.LENGTH_LONG).show();

                        mangloaisp = loaiSpModel.getResult();
                        mangloaisp.add(new LoaiSp("Đăng xuất", "https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281562710_1316976985458073_7585343962020212534_n.jpg?_nc_cat=107&ccb=1-6&_nc_sid=730e14&_nc_ohc=WwRYUB--g2UAX81T1tv&_nc_ht=scontent.fdad8-1.fna&oh=00_AT9VAY89YXqLnEQE988IwEUzM78frAY-3a8zVOgRMSkK5A&oe=6287CC6C"));
                        // khoi tao Adapter
                        loaiSpAdapter = new LoaiSpAdapter(getApplicationContext(), mangloaisp);
                        listViewManHinhChinh.setAdapter(loaiSpAdapter);

                    }
                }
                ,

                throwable -> {

                    Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_LONG).show();
                }
        ));
    }

    private void ActionViewFlipper() {
        List<String> mangquangcao = new ArrayList<>();
        mangquangcao.add("https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/280631064_1317041472118291_3425428384280277557_n.jpg?_nc_cat=108&ccb=1-6&_nc_sid=730e14&_nc_ohc=aph9JronDD0AX8d_c7k&_nc_ht=scontent.fdad8-1.fna&oh=00_AT_WXgnE_RUfHfsTU5NqHraa26JVffXRyPWFmQcc9RibJQ&oe=6286ED1B");
        mangquangcao.add("https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/280687445_1317041505451621_6176539950053285317_n.jpg?_nc_cat=111&ccb=1-6&_nc_sid=730e14&_nc_ohc=_oEGLzMHfuAAX9msg0F&_nc_ht=scontent.fdad8-1.fna&oh=00_AT-PPYmS1kgQ2ylNFVLUuh4mBZ5cHlCEE0YVrEU858J7iA&oe=628762EA");
        mangquangcao.add("https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281727792_1317041538784951_5205306332369010609_n.jpg?_nc_cat=111&ccb=1-6&_nc_sid=730e14&_nc_ohc=Jp_FzNq5LEsAX_ftp9Y&_nc_ht=scontent.fdad8-1.fna&oh=00_AT-P9gENCMGKE_ctJJVcqEdjeK3PKKnWfJmYKEg_pYQDDw&oe=6287110F");
        for(int i=0; i<mangquangcao.size(); i++){
            ImageView imageView = new ImageView(getApplicationContext());
            Glide.with(getApplicationContext()).load(mangquangcao.get(i)).into(imageView);
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            viewFlipper.addView(imageView);
        }
        viewFlipper.setFlipInterval(3000);
        viewFlipper.setAutoStart(true);
        Animation slide_in = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_in_right);
        Animation slide_out = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_out_right);
        viewFlipper.setInAnimation(slide_in);
        viewFlipper.setOutAnimation(slide_out);
    }

    private void ActionBar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationIcon(android.R.drawable.ic_menu_sort_by_size);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });

    }


    private void Anhxa() {
        toolbar = findViewById(R.id.toobarmanhinhchinh);
        viewFlipper = findViewById(R.id.viewlipper);

        recyclerViewManHinhChinh = this.findViewById(R.id.RecycleView);
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(this,2);
        recyclerViewManHinhChinh.setLayoutManager(layoutManager);
        recyclerViewManHinhChinh.setHasFixedSize(true);
        listViewManHinhChinh = findViewById(R.id.listviewmanhinhchinh);
        navigationView = findViewById(R.id.navigationview);
        drawerLayout = findViewById(R.id.drawerlayout);
        badge = findViewById(R.id.menu_sl);
        frameLayout = findViewById(R.id.framegiohang);
        imgsearch = findViewById(R.id.imgsearch);

        // khoi tao list
        mangloaisp = new ArrayList<>();
        mangSpMoi = new ArrayList<>();
        if (Utils.manggiohang == null) {
            Utils.manggiohang = new ArrayList<>();
        }
        else {
            int totalItem = 0;
            for (int i=0; i<Utils.manggiohang.size(); i++) {
                totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
            }

            badge.setText(String.valueOf(totalItem));
        }


        frameLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent giohang = new Intent(getApplicationContext(), GioHangActivity.class);
                startActivity(giohang);
            }
        });


        imgsearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), SearchActivity.class);
                startActivity(intent);
            }
        });

    }

    @Override
    protected void onResume() {
        super.onResume();
        int totalItem = 0;
        for (int i=0; i<Utils.manggiohang.size(); i++) {
            totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
        }

        badge.setText(String.valueOf(totalItem));
    }

    private boolean isConnected (Context context){
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo wifi = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
        NetworkInfo mobile = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
        if((wifi != null && wifi.isConnected()) || (mobile != null && mobile.isConnected())){
            return true;
        }else{
            return false;
        }
    }

    @Override
    protected  void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }

}