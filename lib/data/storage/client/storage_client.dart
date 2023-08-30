import 'package:hive/hive.dart';
import '../../../../domain/cats/entity/cat_fact.dart';

class HiveStorageClient{

  HiveStorageClient._privateConstructor();
  static final HiveStorageClient _instance = HiveStorageClient._privateConstructor();

  factory HiveStorageClient() {
    return _instance;
  }

  late Box box;

  void initBox() async{
    box = await Hive.openBox('cats');
  }

  List<CatFact> getLikedFactsList(){
    List<CatFact> current;
    try{
      current = box.get('liked');
    } catch(e){
      current = [];
    }
    return current;
  }

  void putLikedList(List<CatFact> list){
    box.put('liked', list);
  }
}