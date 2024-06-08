import 'package:dio/dio.dart';
import 'package:flutter_dio_retrofit/data/models/response/reqres_model_response.dart';
import 'package:retrofit/http.dart';

part 'reqres_data_source.g.dart';

@RestApi()
abstract class ReqresDataSource {
  factory ReqresDataSource(Dio dio) = _ReqresDataSource;

  @FormUrlEncoded()
  @GET("/api/users?page=2")
  Future<ReqresModelResponse> getUsers();
}
