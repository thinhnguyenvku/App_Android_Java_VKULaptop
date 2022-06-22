package com.example.appfinal411.retrofit;

import com.example.appfinal411.model.DonHangModel;
import com.example.appfinal411.model.LoaiSpModel;
import com.example.appfinal411.model.MessageModel;
import com.example.appfinal411.model.SanPhamMoi;
import com.example.appfinal411.model.SanPhamMoiModel;
import com.example.appfinal411.model.UserModel;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface ApiAppFinal {
    @GET("getloaisp.php")
    Observable<LoaiSpModel> getLoaiSp();

    @GET("getspmoi.php")
    Observable<SanPhamMoiModel> getSpMoi();

    @POST("chitiet.php")
    @FormUrlEncoded
    Observable<SanPhamMoiModel> getSanPham(
            @Field("page") int page,
            @Field("loai") int loai
    );

    @POST("dangky.php")
    @FormUrlEncoded
    Observable<UserModel> dangKy(
            @Field("email") String email,
            @Field("pass") String pass,
            @Field("username") String username,
            @Field("sdt") String sdt,
            @Field("uid") String uid,
            @Field("status") int status
    );

    @POST("dangnhap.php")
    @FormUrlEncoded
    Observable<UserModel> dangNhap(
            @Field("email") String email,
            @Field("pass") String pass,
            @Field("status") int status
    );

    @POST("reset.php")
    @FormUrlEncoded
    Observable<UserModel> resetPass(
            @Field("email") String email
    );


    @POST("donhang.php")
    @FormUrlEncoded
    Observable<MessageModel> createOrder(
            @Field("email") String email,
            @Field("sdt") String sdt,
            @Field("iduser") int iduser,
            @Field("diachi") String diachi,
            @Field("tongtien") String tongtien,
            @Field("soluong") int soluong,
            @Field("chitiet") String chitiet
    );

    @POST("xemdonhang.php")
    @FormUrlEncoded
    Observable<DonHangModel> xemDonHang(
            @Field("iduser") int iduser
    );


    @POST("timkiem.php")
    @FormUrlEncoded
    Observable<SanPhamMoiModel> search(
            @Field("search") String search
    );

    @POST("suatoken.php")
    @FormUrlEncoded
    Observable<MessageModel> suaToken(
            @Field("id") int id,
            @Field("token") String token
    );

    @POST("gettoken.php")
    @FormUrlEncoded
    Observable<UserModel> gettoken(
            @Field("status") int status
    );

    @POST("capnhat_momo.php")
    @FormUrlEncoded
    Observable<MessageModel> updatemomo(
            @Field("id") int id,
            @Field("token") String token
    );

}
