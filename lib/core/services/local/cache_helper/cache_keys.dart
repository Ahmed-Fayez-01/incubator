import '../../../enums/data_type.dart';
import 'cache_helper.dart';

class CacheKeysManger {
  static bool onBoardingStatus() =>
      CacheHelper.getData(key: 'onBoarding') ?? false;
  static String tokenStatus() =>
      CacheHelper.getData(key: 'token') ?? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vaGFtbWVkc2Vycnk1ODJAZ21haWwuY29tIiwiaWQiOiI2NjcyNzMzODMyNmVjZTcxNjZhMTljZjMiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MTg4NTk4MzYsImV4cCI6MTcxOTExOTAzNn0.howeR59aOoRkkAB2MGXS_UrkIUFb2DTLVV74ixr6YGY";
  static String? getUserLanguageFromCache() =>
      CacheHelper.getData(key: 'language')?? "fr";
}
