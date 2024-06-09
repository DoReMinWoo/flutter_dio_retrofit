import 'package:dio/dio.dart';
import 'package:flutter_dio_retrofit/data/models/response/reqres_model_response.dart';
import 'package:retrofit/retrofit.dart';

part 'reqres_service.g.dart';

@RestApi()
abstract class ReqresService {
  factory ReqresService(Dio dio) = _ReqresService;

  @FormUrlEncoded()
  @GET("/api/users?page=2")
  Future<ReqresModelResponse> getUsers();
}
