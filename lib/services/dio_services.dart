import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:get_storage/get_storage.dart';
import 'package:thetech_getx/components/storage_const.dart';

class DioServices {
  Dio dio = Dio();
  Future<dynamic> getMethode(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(
              responseType: ResponseType.json,
              method: 'GET',
            ))
        .then(
      (response) {
        return response;
      },
    ).catchError((error) {
      if (error is DioException) {
        return error.response!;
      }
    });
  }

  Future<dynamic> postMethode(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    var token = GetStorage().read(StorageKey.token);
    if (token != null) {
      dio.options.headers['Authorization'] = '$token';
    }
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST '))
        .then(
      (response) {
        log(response.headers.toString());
        log(response.data.toString());
        log(response.statusCode.toString());
        return response;
      },
    ).catchError((error) {
      if (error is DioException) {
        return error.response!;
      }
    });
  }
}
