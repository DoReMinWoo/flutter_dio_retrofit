import 'package:flutter_dio_retrofit/data/data_source/reqres_data_source.dart';
import 'package:flutter_dio_retrofit/domain/entity/reqres_entity.dart';
import 'package:flutter_dio_retrofit/domain/repository/reqres_repository.dart';

class ReqresRepositoryImpl implements ReqresRepository {
  final ReqresDataSource reqresDataSource;

  ReqresRepositoryImpl(this.reqresDataSource);

  @override
  Future<List<ReqresEntity>> getUser() async {
    final response = await reqresDataSource.getUser();

    return response.data.map((data) => ReqresEntity(
      id: data.id,
      email: data.email,
      firstName: data.firstName,
      lastName: data.lastName,
      avatar: data.avatar,
    )).toList();
  }
}