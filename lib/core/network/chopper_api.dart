import 'package:chopper/chopper.dart';
import 'package:sabokbar_d/core/constants/url_consts.dart';

/// this is necessary for the generated code to find your class
part 'chopper_api.chopper.dart';

@ChopperApi()
abstract class ChopperAPI extends ChopperService {
  static ChopperAPI create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(BASE_URL),
      services: [_$ChopperAPI()],
      converter: const JsonConverter(),
    );
    return _$ChopperAPI(client);
  }

  @Post(path: SEND_OTP)
  Future<Response> sendOtp(
    @Body() Map<String, dynamic> body,
  );

}
