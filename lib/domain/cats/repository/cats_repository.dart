import '../entity/cat_fact.dart';
import '../entity/cat_image.dart';

abstract class CatFactsRepository{

  Future<List<CatFact>> getFunnyCatFacts();

  bool saveFunnyCatFact(CatFact fact);

}

abstract class CatsImageRepository{
Future<CatImage> getFunnyCatImage();
}