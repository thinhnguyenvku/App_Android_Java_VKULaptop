package com.example.honghanh.vkulaptop.retrofit;

import com.example.honghanh.vkulaptop.model.DonHangModel;
import com.example.honghanh.vkulaptop.model.LoaiSpModel;
import com.example.honghanh.vkulaptop.model.MessageModel;
import com.example.honghanh.vkulaptop.model.SanPhamMoiModel;
import com.example.honghanh.vkulaptop.model.UserModel;

import io.reactivex.rxjava3.core.Observable;
import okhttp3.MultipartBody;
import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.Multipart;
import retrofit2.http.POST;
import retrofit2.http.Part;

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
    Observable<UserModel> createOrder(
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

    @POST("themsp.php")
    @FormUrlEncoded
    Observable<MessageModel> themSp(
            @Field("tensp") String tensp,
            @Field("gia") String gia,
            @Field("hinhanh") String hinhanh,
            @Field("mota") String mota,
            @Field("loai") int id
    );

    @POST("suasp.php")
    @FormUrlEncoded
    Observable<MessageModel> suaSp(
            @Field("tensp") String tensp,
            @Field("gia") String gia,
            @Field("hinhanh") String hinhanh,
            @Field("mota") String mota,
            @Field("loai") int idloai,
            @Field("id") int id
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
            @Field("status") int status,
            @Field("iduser") int iduser
    );

    @POST("gettoken.php")
    @FormUrlEncoded
    Observable<UserModel> getTK(
            @Field("status") int status
    );

    @Multipart
    @POST("upload.php")
    Call<MessageModel> uploadFile(@Part MultipartBody.Part file);

    @POST("xoa.php")
    @FormUrlEncoded
    Observable<MessageModel> xoaSanPham(
            @Field("id") int id
    );

    @POST("capnhat_donhang.php")
    @FormUrlEncoded
    Observable<MessageModel> suaDonHang(
            @Field("id") int id,
            @Field("trangthai") int trangthai
    );
}
