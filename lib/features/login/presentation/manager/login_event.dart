part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class SendOtpEvent extends LoginEvent {
  final SendOtpParams params;

  SendOtpEvent({required this.params});

  @override
  List<Object> get props => [params];
}
