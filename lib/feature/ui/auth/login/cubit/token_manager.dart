import 'package:movie_app/core/cache/cache_helper.dart';

class TokenManager {
  final CacheHelper cacheHelper;

  TokenManager(this.cacheHelper);

  Future<void> saveToken(String token) async {
    await cacheHelper.saveData(key: 'Token', value: token);
  }

  String? getToken() {
    return cacheHelper.getData(key: 'Token');
  }

  Future<void> clearToken() async {
    await cacheHelper.removeData(key: 'Token');
  }
}
