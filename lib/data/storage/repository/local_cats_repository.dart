import '../../../domain/cats/entity/cat_fact.dart';
import '../../../domain/cats/repository/cats_repository.dart';
import '../client/storage_client.dart';

class LocalCatsRepository extends CatFactsRepository{
  final HiveStorageClient _storageClient = HiveStorageClient();

  @override
  Future<List<CatFact>> getFunnyCatFacts() => Future.value(_storageClient.getLikedFactsList());

  @override
  bool saveFunnyCatFact(CatFact fact) {
    List<CatFact> current;

    try{
      current = _storageClient.getLikedFactsList();
    } catch(e){
      current = [];
    }
    if(!current.contains(fact)) current.add(fact);
    else current.remove(fact);
    _storageClient.putLikedList(current);
    return true;
  }

}