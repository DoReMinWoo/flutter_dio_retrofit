import 'package:flutter_dio_retrofit/domain/entity/reqres_entity.dart';
import 'package:flutter_dio_retrofit/domain/repository/reqres_repository.dart';

class GetUserUseCase {
  final ReqresRepository _repository;

  GetUserUseCase({required ReqresRepository repository}) : _repository = repository;

  Future<List<ReqresEntity>> call() async {
    return await _repository.getUser();
  }
}
