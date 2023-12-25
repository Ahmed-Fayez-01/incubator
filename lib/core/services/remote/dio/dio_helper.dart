import 'package:dio/dio.dart';

import '../../local/cache_helper/cache_keys.dart';
import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (sendAuthToken) "Authorization": "Bearer ${CacheKeysManger.getUserTokenFromCache()}",
    };
    return await dio.get(
      url,
      queryParameters: {"language": CacheKeysManger.getLanguageFromCache()},
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (sendAuthToken) "Authorization": "Bearer ${CacheKeysManger.getUserTokenFromCache()}",
    };
    return await dio.post(
      url,
      queryParameters: {"language": CacheKeysManger.getLanguageFromCache()},
      data: data,
    );
  }

  static Future<Response> postForm({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (sendAuthToken) "Authorization": "Bearer ${CacheKeysManger.getUserTokenFromCache()}",
    };
    return await dio.post(
      url,
      queryParameters: {"language": CacheKeysManger.getLanguageFromCache()},
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (sendAuthToken) "Authorization": "Bearer ${CacheKeysManger.getUserTokenFromCache()}",
    };
    return await dio.patch(
      url,
      queryParameters: {"language": CacheKeysManger.getLanguageFromCache()},
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      if (sendAuthToken) "Authorization": "Bearer ${CacheKeysManger.getUserTokenFromCache()}",
    };
    return await dio.delete(
      url,
      data: data,
      queryParameters: {"language": CacheKeysManger.getLanguageFromCache()},
    );
  }
}
