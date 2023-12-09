import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sabokbar_d/core/network/chopper_api.dart';
import 'package:sabokbar_d/features/login/data/models/send_otp_response_model.dart';
import 'package:sabokbar_d/features/login/domain/use_cases/params/send_otp_params.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/local_storage/local_data.dart';

abstract class LoginApi {
  Future<SendOtpResponseModel> sendOtp(SendOtpParams params);
}

class LoginApiImpl implements LoginApi {
  final ChopperAPI chopperAPI;
  final LocalData localData;

  LoginApiImpl({required this.chopperAPI, required this.localData});

  @override
  Future<SendOtpResponseModel> sendOtp(SendOtpParams params) async {
    try {
      print(params.phoneNumber);
      var response = await chopperAPI.sendOtp(
          {
            "phoneNumber": params.phoneNumber,
            "userId": "string",
            "otpPassword": "string",
            "token": "string"
          }
      );
      print(response.base.request);
      print(response.statusCode);
      if (response.statusCode == 200 && response.body != null) {
        debugPrint(response.bodyString);
        return SendOtpResponseModel.fromJson(json.decode(response.bodyString));
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }
}
