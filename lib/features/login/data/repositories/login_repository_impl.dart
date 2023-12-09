import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sabokbar_d/core/error/failures.dart';
import 'package:sabokbar_d/core/network/network_info.dart';
import 'package:sabokbar_d/features/login/data/data_sources/login_api.dart';
import 'package:sabokbar_d/features/login/domain/entities/send_otp_response.dart';
import 'package:sabokbar_d/features/login/domain/repositories/login_repository.dart';
import 'package:sabokbar_d/features/login/domain/use_cases/params/send_otp_params.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/error/exceptions.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo networkInfo;
  final LoginApi loginApi;

  LoginRepositoryImpl({required this.networkInfo, required this.loginApi});

  @override
  Future<Either<Failure, SendOtpResponse>> sendOtp(SendOtpParams params) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await loginApi.sendOtp(params);
        if (response.isSuccess) {
          return Right(response);
        } else {
          return Left(ApiFailure(message: response.message));
        }
      } on ServerException catch (e) {
        debugPrint(e.toString());
        return const Left(ServerFailure(message: SERVER_ERROR));
      }
    } else {
      return const Left(InternetFailure(message: NO_INTERNET));
    }
  }
}
