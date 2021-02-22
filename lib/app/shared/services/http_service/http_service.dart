import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../../constants.dart';
import '../interceptors/info_interceptors.dart';

class HttpService extends DioForNative implements IHttpService {
  @override
  HttpClientAdapter httpClientAdapter = DefaultHttpClientAdapter();

  HttpService() {
    options.baseUrl = BASE_URL;
    setUpInterceptors();
  }

  @override
  void setUpInterceptors() {
    this.interceptors.add(InfoInterceptors());
  }
}

abstract class IHttpService extends DioForNative {
  void setUpInterceptors();
}
