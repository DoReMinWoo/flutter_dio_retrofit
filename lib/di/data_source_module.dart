import 'package:flutter_dio_retrofit/data/data_source/reqres_data_source.dart';
import 'package:flutter_dio_retrofit/data/service/reqres_service.dart';

import 'setup_di_locator.dart';

setupDataSourceModule() {
  getIt.registerLazySingleton<ReqresDataSource>(
          () => ReqresDataSource(reqresService: getIt<ReqresService>()));
}