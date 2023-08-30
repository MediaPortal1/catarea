import '../entity/cat_fact.dart';
import '../repository/cats_repository.dart';
import 'usecase.dart';

class CatFactsUseCase extends UseCaseIn<List<CatFact>>{

  final CatFactsRepository _repository;

  CatFactsUseCase(this._repository);

  @override
  Future<List<CatFact>> invoke() async => _repository.getFunnyCatFacts();

}