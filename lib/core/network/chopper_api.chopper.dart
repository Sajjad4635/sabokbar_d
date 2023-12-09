// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$ChopperAPI extends ChopperAPI {
  _$ChopperAPI([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChopperAPI;

  @override
  Future<Response<dynamic>> sendOtp(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('api/Account/SendOtp');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
