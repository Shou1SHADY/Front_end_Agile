import '../Locale/shared_pref.dart';
//import 'cache_helper.dart';

class CacheKeysManger {
  static String getLanguageFromCache() =>
      CacheHelper.getData(key: 'lang') ?? 'ar';
}
