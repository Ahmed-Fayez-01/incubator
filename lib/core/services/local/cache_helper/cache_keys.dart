import '../../../enums/data_type.dart';
import 'cache_helper.dart';

class CacheKeysManger {
  static String getLanguageFromCache() => CacheHelper.getData(key: 'lang', dataType: DataType.string) ?? 'ar';

  static String? getUserTokenFromCache() => CacheHelper.getData(key: 'userToken', dataType: DataType.string);
  static String? getLoginModelFromCache() => CacheHelper.getData(key: 'userLogin', dataType: DataType.string);
  static String? getUserIDFromCache() => CacheHelper.getData(key: 'userID', dataType: DataType.string);
  static String? getDeviceToken() => CacheHelper.getData(key: 'deviceToken', dataType: DataType.string);
}
