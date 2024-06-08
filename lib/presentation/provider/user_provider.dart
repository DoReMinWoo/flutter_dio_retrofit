import 'package:flutter_dio_retrofit/common/api/dio_client.dart';
import 'package:flutter_dio_retrofit/data/data_source/reqres_data_source.dart';
import 'package:flutter_dio_retrofit/data/models/response/reqres_model_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ReqresDataSource>((ref) {
  final dio = DioClient().dio;
  return ReqresDataSource(dio);
});

final userProvider = FutureProvider<ReqresModelResponse>((ref) async {
  final userService = ref.read(apiServiceProvider);
  final ReqresModelResponse reqresModel = await userService.getUsers();
  return reqresModel;
});
