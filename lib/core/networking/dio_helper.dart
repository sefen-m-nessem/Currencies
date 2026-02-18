import 'dart:developer';

import 'package:currency/core/networking/api_const.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio exchangeDio;
  static late Dio exploreDio;
  static init() {
    exchangeDio = Dio(
      BaseOptions(
        baseUrl: ApiConst.currencyBaseUrl,
        receiveDataWhenStatusError: true,
        // connectTimeout: Duration(seconds: 20),
        // receiveTimeout: Duration(seconds: 20),
      ),
    );
    exploreDio = Dio(
      BaseOptions(
        baseUrl: ApiConst.exploreBaseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
      ),
    );
  }

  static Future<Response> getExchangeCurrency({
    required String endPoint,
  }) async {
    final res = await exchangeDio.get(endPoint);
    log(res.data.toString());
    return res;
  }

  static Future<Response> getCurrencies() async {
    final res = await exploreDio.get(ApiConst.explorePricesEndPoint);
    log(res.data.toString());
    return res;
  }
}
