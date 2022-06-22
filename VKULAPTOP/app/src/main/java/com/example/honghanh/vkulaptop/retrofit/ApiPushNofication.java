package com.example.honghanh.vkulaptop.retrofit;

import com.example.honghanh.vkulaptop.model.NotiResponse;
import com.example.honghanh.vkulaptop.model.NotiSendData;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.http.Body;
import retrofit2.http.Headers;
import retrofit2.http.POST;

public interface ApiPushNofication {
    @Headers(
            {
                    "content-type: application/json",
                    "authorization: key=AAAAh_Qam4k:APA91bHZjW_bfX3udQwBkhPfmfB2kwlHJKLFPSywBQrW8s8WgbF4Xh20PrhCfJX1tdJdBAAhgqHe3icTApjUdBNbCFGU9RbU1RLztBcqWI2tQUvHIiYf4EGlNIAiOYCMWIbsRyNqKfff"
            }
    )
    @POST("fcm/send")
    Observable<NotiResponse> sendNofication(@Body NotiSendData data);
}
