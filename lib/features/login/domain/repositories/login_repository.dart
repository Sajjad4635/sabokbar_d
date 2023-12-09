import 'package:dartz/dartz.dart';
import 'package:sabokbar_d/features/login/domain/entities/send_otp_response.dart';
import 'package:sabokbar_d/features/login/domain/use_cases/params/send_otp_params.dart';

import '../../../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, SendOtpResponse>> sendOtp(SendOtpParams params);
}
