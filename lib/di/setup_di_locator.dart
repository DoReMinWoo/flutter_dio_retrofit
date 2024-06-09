import 'package:flutter_dio_retrofit/di/data_source_module.dart';
import 'package:flutter_dio_retrofit/di/dio_module.dart';
import 'package:flutter_dio_retrofit/di/repository_module.dart';
import 'package:flutter_dio_retrofit/di/service_module.dart';
import 'package:flutter_dio_retrofit/di/use_case_module.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDiLocator() {
  setupDioModule();
  setupDataSourceModule();
  setupRepositoryModule();
  setupServiceModule();
  setupUseCaseModule();
}
