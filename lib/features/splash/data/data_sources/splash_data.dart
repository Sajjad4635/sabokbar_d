// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:sabokbar_d/core/network/chopper_api.dart';
// import 'package:sabokbar_d/features/splash/data/models/send_otp_response_model.dart';
//
// import '../../../../core/error/exceptions.dart';
// import '../../../../core/local_storage/local_data.dart';
// import '../../../login/data/models/verify_code_response_model.dart';
//
// abstract class SplashData {
//   Future<SettingResponseModel> getSetting();
//
//   Future<String?> getToken();
//
//   Future<UserResponseModel?> getUser();
// }
//
// class SplashDataImpl implements SplashData {
//   final ChopperAPI chopperAPI;
//   final LocalData localData;
//
//   SplashDataImpl({required this.chopperAPI, required this.localData});
//
//   @override
//   Future<SettingResponseModel> getSetting() async {
//     try {
//       var response = await chopperAPI.getSetting();
//       if (response.statusCode == 200 && response.body != null) {
//         debugPrint(response.bodyString);
//         return SettingResponseModel.fromJson(json.decode(response.bodyString));
//       } else {
//         throw ServerException(statusCode: response.statusCode, error: response.bodyString);
//       }
//     } catch (e) {
//       throw ServerException(statusCode: 501, error: e.toString());
//     }
//   }
//
//   @override
//   Future<String?> getToken() async {
//     return await localData.token;
//   }
//
//   @override
//   Future<UserResponseModel?> getUser() async {
//     String? profileString = await localData.profileString;
//     if (profileString == null) {
//       return null;
//     } else {
//       return UserResponseModel.fromJson(json.decode(profileString));
//     }
//   }
// }
