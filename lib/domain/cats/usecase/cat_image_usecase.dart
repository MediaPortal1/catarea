import '../entity/cat_image.dart';
import '../repository/cats_repository.dart';
import 'usecase.dart';

class CatImageUseCase extends UseCaseIn<CatImage>{

  final CatsImageRepository _repository;

  CatImageUseCase(this._repository);

  @override
  Future<CatImage> invoke() async => _repository.getFunnyCatImage();

}