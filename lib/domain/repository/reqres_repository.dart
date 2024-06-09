import 'package:flutter_dio_retrofit/domain/entity/reqres_entity.dart';

abstract class ReqresRepository {
  Future<List<ReqresEntity>> getUser();
}
