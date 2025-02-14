import 'package:injectable/injectable.dart';

import '../../../../../core/cache/cache_helper.dart';

@injectable
class ToggleIcon{
  final CacheHelper cacheHelper;

  ToggleIcon(this.cacheHelper);

  Future<void> saveToggleIcon(int toggle) async {
    await cacheHelper.saveData(key: 'toggle', value: toggle);
  }

  int? getToggleIcon() {
    return cacheHelper.getData(key: 'toggle');
  }

}