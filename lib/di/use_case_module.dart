import 'package:flutter_dio_retrofit/domain/repository/reqres_repository.dart';
import 'package:flutter_dio_retrofit/domain/usecase/get_user_use_case.dart';

import 'setup_di_locator.dart';

setupUseCaseModule() {
  getIt.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(repository: getIt<ReqresRepository>()));
}
