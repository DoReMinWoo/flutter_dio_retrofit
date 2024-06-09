import 'package:dio/dio.dart';
import 'package:flutter_dio_retrofit/common/api/dio_client.dart';
import 'package:flutter_dio_retrofit/data/data_source/reqres_data_source.dart';
import 'package:flutter_dio_retrofit/data/repository_impl/reqres_repository_impl.dart';
import 'package:flutter_dio_retrofit/data/service/reqres_service.dart';
import 'package:flutter_dio_retrofit/domain/repository/reqres_repository.dart';
import 'package:flutter_dio_retrofit/domain/usecase/get_user_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  final dioClient = DioClient();
  getIt.registerSingleton<DioClient>(dioClient);

  getIt.registerLazySingleton<ReqresService>(() => ReqresService(getIt<DioClient>().dio));
  getIt.registerLazySingleton<ReqresDataSource>(
          () => ReqresDataSource(reqresService: getIt<ReqresService>()));
  getIt.registerLazySingleton<ReqresRepository>(
          () => ReqresRepositoryImpl(getIt<ReqresDataSource>()));
  getIt.registerLazySingleton<GetUserUseCase>(
          () => GetUserUseCase(repository: getIt<ReqresRepository>()));
}
