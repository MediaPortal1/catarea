import '../../../domain/cats/entity/cat_fact.dart';
import '../../../domain/cats/entity/cat_image.dart';
import '../../../domain/cats/repository/cats_repository.dart';
import '../api/facts/cats_api_client.dart';
import '../api/images/cats_images_api_client.dart';

class NetworkCatsRepository extends CatFactsRepository implements CatsImageRepository{
  final CatsApiClient _apiClient;
  final CatsImagesApiClient _apiImagesClient;

  NetworkCatsRepository(this._apiClient, this._apiImagesClient);

  @override
  Future<List<CatFact>> getFunnyCatFacts() => _apiClient.getFacts();

  @override
  Future<CatImage> getFunnyCatImage() => _apiImagesClient.getRandomImage().then((value) => value.first);

  @override
  bool saveFunnyCatFact(CatFact fact) => false;

}