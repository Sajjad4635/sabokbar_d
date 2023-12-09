import 'dart:convert';

import 'package:sabokbar_d/features/login/domain/entities/send_otp_response.dart';

SendOtpResponseModel sendOtpResponseModelFromJson(String str) => SendOtpResponseModel.fromJson(json.decode(str));

String sendOtpResponseModelToJson(SendOtpResponseModel data) => json.encode(data.toJson());

class SendOtpResponseModel extends SendOtpResponse{

  SendOtpResponseModel({
    required message,
    required data,
    required isSuccess,
  }):super(
      message: message,
      data: data,
      isSuccess: isSuccess,
  );

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) => SendOtpResponseModel(
    message: json["message"],
    data: json["data"],
    isSuccess: json["isSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
    "isSuccess": isSuccess,
  };
}
