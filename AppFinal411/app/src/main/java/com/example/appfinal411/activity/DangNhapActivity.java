package com.example.appfinal411.activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.example.appfinal411.R;
import com.example.appfinal411.retrofit.ApiAppFinal;
import com.example.appfinal411.retrofit.RetrofitClient;
import com.example.appfinal411.utils.Utils;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

import io.paperdb.Paper;
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class DangNhapActivity extends AppCompatActivity {

    TextView txtdangky, txtresetpass;
    EditText email, pass;
    Button btndangnhap;
    ApiAppFinal apiAppFinal;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    boolean isLogin = false;
    FirebaseUser user;
    FirebaseAuth firebaseAuth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dang_nhap);

        initView();
        initControl();
    }

    private void initControl() {
        txtdangky.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), DangKyActivity.class);
                startActivity(intent);
            }
        });


        btndangnhap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String str_email = email.getText().toString().trim();
                String str_pass = pass.getText().toString().trim();

                if (TextUtils.isEmpty(str_email)) {
                    Toast.makeText(getApplicationContext(), "Vui lòng nhập Email", Toast.LENGTH_SHORT).show();
                }
                else if (TextUtils.isEmpty(str_pass)) {
                    Toast.makeText(getApplicationContext(), "Vui lòng nhập mật khẩu", Toast.LENGTH_SHORT).show();
                }
                else {

                    // save dangnhap
                    Paper.book().write("email", str_email);
                    Paper.book().write("pass", str_pass);

                    if (user != null) {
                        // use đã đăng nhập firebase
                        dangNhap(str_email, str_pass);
                    }
                    else {
                        // user đã đx
                        firebaseAuth.signInWithEmailAndPassword(str_email, str_pass)
                                .addOnCompleteListener(DangNhapActivity.this, new OnCompleteListener<AuthResult>() {
                                    @Override
                                    public void onComplete(@NonNull Task<AuthResult> task) {
                                        if (task.isSuccessful()) {
                                            dangNhap(str_email, str_pass);
                                        }
                                    }
                                });
                    }

                }

            }
        });

        txtresetpass.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), ResetPassActivity.class);
                startActivity(intent);
            }
        });
    }

    private void initView() {

        Paper.init(this);
        apiAppFinal = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiAppFinal.class);
        txtdangky = findViewById(R.id.txtdangky);
        email = findViewById(R.id.email);
        pass = findViewById(R.id.pass);
        btndangnhap = findViewById(R.id.btndangnhap);
        txtresetpass = findViewById(R.id.txtresetpass);
        firebaseAuth = FirebaseAuth.getInstance();
        user = firebaseAuth.getCurrentUser();


        // read data dangnhap
        if (Paper.book().read("email") != null && Paper.book().read("pass") != null ) {
            email.setText(Paper.book().read("email"));
            pass.setText(Paper.book().read("pass"));

            if (Paper.book().read("isLogin") != null) {
                boolean flag = Paper.book().read("isLogin");
                if (flag) {
                    new Handler().postDelayed(new Runnable() {
                        @Override
                        public void run() {
//                            dangNhap(Paper.book().read("email"), Paper.book().read("pass"));
                        }
                    }, 500);
                }
            }
        }
    }

    private void dangNhap(String email, String pass) {
        compositeDisposable.add(apiAppFinal.dangNhap(email, pass, 0)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        userModel -> {
                            if (userModel.isSuccess()) {

                                // ghi nhớ trạng thái đăng nhập
                                isLogin = true;
                                Paper.book().write("isLogin", isLogin);

                                Utils.user_curent = userModel.getResult().get(0);

                                // luu lai thong tin nguoi dung dangnhap
                                Paper.book().write("user", userModel.getResult().get(0));

                                Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                                startActivity(intent);
                                finish();
                            }

                        },
                        throwable -> {
                            Toast.makeText(getApplicationContext(), "lỗi rồi kinh beo" + throwable.getMessage(), Toast.LENGTH_SHORT).show();
                        }
                ));
    }


    @Override
    protected void onResume() {
        super.onResume();

        if (Utils.user_curent.getEmail() != null && Utils.user_curent.getPass() != null) {
            email.setText(Utils.user_curent.getEmail());
            pass.setText(Utils.user_curent.getPass());
        }
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}