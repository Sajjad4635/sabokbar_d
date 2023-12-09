part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class Empty extends LoginState {
  const Empty();
}

class Error extends LoginState {
  final String message;

  const Error({required this.message});
}

class SendOtpLoadingState extends LoginState {}

class OtpSentState extends LoginState {
  final SendOtpResponse otp;

  const OtpSentState({required this.otp});

  @override
  List<Object> get props => [otp];
}

class SendOtpError extends LoginState {
  final String message;

  const SendOtpError({required this.message});
}
