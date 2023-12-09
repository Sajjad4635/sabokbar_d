import 'package:equatable/equatable.dart';

class SendOtpParams extends Equatable {
  final String phoneNumber;
  final String userId;
  final String otpPassword;
  final String token;

  const SendOtpParams({
    required this.phoneNumber,
    required this.userId,
    required this.otpPassword,
    required this.token,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        userId,
        otpPassword,
        token,
      ];
}
