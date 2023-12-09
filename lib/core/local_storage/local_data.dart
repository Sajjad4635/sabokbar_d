import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalData {
  Future<String?> get profileString;

  Future<String?> get token;

  void setProfileString(String data);

  void setToken(String data);

  void removeToken(String data);

  void setLocalPass(String data);

  void removeLocalPass(String data);
}

class LocalDataImpl implements LocalData {
  SharedPreferences storage;

  LocalDataImpl({required this.storage});

  @override
  Future<String?> get profileString async => storage.getString('profile');

  @override
  Future<String?> get token async => storage.getString('token');

  @override
  void setProfileString(String data) async {
    await storage.setString('profile', data);
  }

  @override
  void setToken(String data) async {
    await storage.setString('token', data);
  }

  @override
  void removeToken(String data) async {
    await storage.remove(data);
  }

  @override
  void removeLocalPass(String data) async {
    await storage.setString('pass', data);
  }

  @override
  void setLocalPass(String data) async {
    await storage.remove(data);
  }
}
