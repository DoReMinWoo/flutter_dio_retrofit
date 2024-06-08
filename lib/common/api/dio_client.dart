import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dio_interceptor.dart';

class DioClient {
  late final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final option = BaseOptions(
    baseUrl: dotenv.get('BASE_URL'),
  );

  DioClient() {
    _dio = Dio(option);
    _dio.interceptors.add(DioInterceptor(storage: _storage));
  }

  Dio get dio => _dio;
}
