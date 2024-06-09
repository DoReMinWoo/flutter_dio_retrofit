import 'package:flutter_dio_retrofit/domain/entity/reqres_entity.dart';
import 'package:flutter_dio_retrofit/domain/usecase/get_user_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final userProvider = FutureProvider<List<ReqresEntity>>((ref) async {
  final getUserUseCase = GetIt.I<GetUserUseCase>();
  final userList = await getUserUseCase.call();
  return userList;
});
