import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabokbar_d/features/login/domain/entities/send_otp_response.dart';
import 'package:sabokbar_d/features/login/domain/use_cases/params/send_otp_params.dart';

import '../../../../core/error/failures.dart';
import '../../domain/use_cases/send_otp_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SendOtpUseCase sendOtpUseCase;

  LoginBloc({
    required this.sendOtpUseCase,
  }) : super(const Empty()) {
    on<SendOtpEvent>((event, emit) async {
      emit(SendOtpLoadingState());
      final either = await sendOtpUseCase.call(SendOtpParams(
        phoneNumber: event.params.phoneNumber,
        userId: event.params.userId,
        otpPassword: event.params.otpPassword,
        token: event.params.token,
      ));
      either.fold((l) {
        handleFailure(l, emit);
      }, (r) {
        emit(OtpSentState(otp: r));
      });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case DataFailure:
        emit(
          SendOtpError(
            message: (failure as DataFailure).message,
          ),
        );
        break;
      case ApiFailure:
        emit(
          SendOtpError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          SendOtpError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      default:
        emit(
          const Error(
            message: 'Fatal Error!',
          ),
        );
    }
  }
}
