import '../entity/cat_fact.dart';
import '../repository/cats_repository.dart';
import 'usecase.dart';

class CatFactLikedUseCase extends UseCaseOut<CatFact>{

  final CatFactsRepository _repository;

  CatFactLikedUseCase(this._repository);

  @override
  Future<bool> invoke(CatFact v) => Future.value(_repository.saveFunnyCatFact(v));

}