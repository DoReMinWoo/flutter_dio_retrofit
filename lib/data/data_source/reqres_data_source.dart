import 'package:flutter_dio_retrofit/data/models/response/reqres_model_response.dart';
import 'package:flutter_dio_retrofit/data/service/reqres_service.dart';
import 'package:get_it/get_it.dart';

class ReqresDataSource {
  final ReqresService _reqresService;

  ReqresDataSource({required ReqresService reqresService})
      : _reqresService = reqresService;

  Future<ReqresModelResponse> getUser() {
    return _reqresService.getUsers();
  }
}
