import '../entity/cat_fact.dart';
import '../repository/cats_repository.dart';
import 'usecase.dart';

class GetCatFactsHistoryUseCase extends UseCaseIn<List<CatFact>>{
  final CatFactsRepository _repository;

  GetCatFactsHistoryUseCase(this._repository);

  @override
  Future<List<CatFact>> invoke() async => _repository.getFunnyCatFacts();

}