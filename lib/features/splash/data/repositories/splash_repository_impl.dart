// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:sabokbar_d/core/error/failures.dart';
// import 'package:sabokbar_d/core/network/network_info.dart';
// import 'package:sabokbar_d/features/login/domain/entities/verify_code_response.dart';
// import 'package:sabokbar_d/features/splash/data/data_sources/login_api.dart';
// import 'package:sabokbar_d/features/splash/domain/entities/send_otp_response.dart';
// import 'package:sabokbar_d/features/splash/domain/repositories/login_repository.dart';
//
// import '../../../../core/constants/string_consts.dart';
// import '../../../../core/error/exceptions.dart';
//
// class SplashRepositoryImpl implements SplashRepository {
//   final NetworkInfo networkInfo;
//   final SplashData splashData;
//
//   SplashRepositoryImpl({required this.networkInfo, required this.splashData});
//
//   @override
//   Future<Either<Failure, SettingResponse>> getSetting() async {
//     var value = await networkInfo.isConnected;
//     if (value) {
//       try {
//         var response = await splashData.getSetting();
//         if (response.success) {
//           return Right(response);
//         } else {
//           return Left(ApiFailure(message: response.message));
//         }
//       } on ServerException catch (e) {
//         debugPrint(e.toString());
//         return const Left(ServerFailure(message: SERVER_ERROR));
//       }
//     } else {
//       return const Left(InternetFailure(message: NO_INTERNET));
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> getToken() async {
//     String? token = await splashData.getToken();
//     if (token != null) {
//       print(token);
//       return Right(token);
//     } else {
//       return const Left(DataFailure(message: DATA_NOT_AVAILABLE));
//     }
//   }
//
//   @override
//   Future<Either<Failure, UserResponse>> getUser() async {
//     UserResponse? user = await splashData.getUser();
//     if (user != null) {
//       return Right(user);
//     } else {
//       return const Left(DataFailure(message: DATA_NOT_AVAILABLE));
//     }
//   }
// }
