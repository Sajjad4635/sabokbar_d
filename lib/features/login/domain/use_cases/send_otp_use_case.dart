import 'package:dartz/dartz.dart';
import 'package:sabokbar_d/core/error/failures.dart';
import 'package:sabokbar_d/core/usecases/usecase.dart';
import 'package:sabokbar_d/features/login/domain/entities/send_otp_response.dart';
import 'package:sabokbar_d/features/login/domain/repositories/login_repository.dart';
import 'package:sabokbar_d/features/login/domain/use_cases/params/send_otp_params.dart';

class SendOtpUseCase implements UseCase<SendOtpResponse, SendOtpParams> {
  final LoginRepository repository;

  SendOtpUseCase(this.repository);

  @override
  Future<Either<Failure, SendOtpResponse>> call(SendOtpParams params) async {
    return await repository.sendOtp(params);
  }
}
