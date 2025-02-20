import 'package:injectable/injectable.dart';

import '../../../../../core/cache/cache_helper.dart';

@injectable
class ToggleIcon{
  final CacheHelper cacheHelper;

  ToggleIcon(this.cacheHelper);

  Future<void> saveToggleIcon(int value,int key) async {
    await cacheHelper.saveData(key: key.toString(), value: value);
  }

  int? getToggleIcon(int movieId) {
    return cacheHelper.getData(key: movieId.toString());
  }

}