import 'package:flutter_dio_retrofit/data/service/reqres_service.dart';

import 'dio_module.dart';
import 'setup_di_locator.dart';

setupServiceModule() {
  getIt.registerLazySingleton<ReqresService>(
          () => ReqresService(getIt<DioClient>().dio));
}