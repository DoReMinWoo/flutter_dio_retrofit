import 'package:dio/dio.dart';
import 'package:flutter_dio_retrofit/util/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'setup_di_locator.dart';

setupDioModule() {
  getIt.registerSingleton<DioClient>(DioClient());
}

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

class DioInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  DioInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log.d('Request [${options.method}] ${options.uri}');

    // // 보내려는 요청의 헤더
    // if (options.headers['accessToken'] == 'true') {
    //   // 헤더 삭제
    //   options.headers.remove('accessToken');
    //
    //   // 실제 토큰 대체
    //   final token = await storage.read(key: ACCESS_TOKEN_KEY);
    //   options.headers.addAll({'authorization': 'Bearer $token'});
    // }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d('State Code : ${response.statusCode}\n'
        '${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // AccessToken 만료시 RefreshToken으로 재발급
    log.e('State Code : ${err.response!.statusCode}\n'
        'Error Message : ${err.response!.statusMessage}');
    //
    // final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    //
    // if (refreshToken == null) {
    //   return handler.reject(err);
    // }
    //
    // final isStatus401 = err.response?.statusCode == 401;
    // final isPathRefresh = err.requestOptions.path == '/auth/token';
    //
    // // accessToken을 필요로 한다면
    // if (isStatus401 && !isPathRefresh) {
    //   final dio = Dio();
    //
    //   // AccessToken 재발급
    //   try {
    //     final resp = await dio.post(
    //       'http://$testApi/token',
    //       options: Options(
    //         headers: {'authorization': 'Bearer $refreshToken'},
    //       ),
    //     );
    //
    //     // 재발급 받은 AccessToken 등록
    //     final accessToken = resp.data['accessToken'];
    //
    //     final options = err.requestOptions;
    //
    //     options.headers.addAll({'authorization': 'Bearer $accessToken'});
    //
    //     await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
    //
    //     final response = await dio.fetch(options);
    //
    //     return handler.resolve(response);
    //
    //   }
    //   catch (e) {
    //     return handler.reject(err);
    //   }
    // }
    // return handler.reject(err);
  }
}
