class SendOtpResponse {
  final String message;
  final String data;
  final bool isSuccess;

  SendOtpResponse({
    required this.message,
    required this.data,
    required this.isSuccess,
  });
}
