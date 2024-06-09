import 'package:flutter_dio_retrofit/data/data_source/reqres_data_source.dart';
import 'package:flutter_dio_retrofit/data/repository_impl/reqres_repository_impl.dart';
import 'package:flutter_dio_retrofit/domain/repository/reqres_repository.dart';

import 'setup_di_locator.dart';

setupRepositoryModule() {
  getIt.registerLazySingleton<ReqresRepository>(
      () => ReqresRepositoryImpl(getIt<ReqresDataSource>()));
}
