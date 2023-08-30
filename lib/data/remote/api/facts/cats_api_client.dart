import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../domain/cats/entity/cat_fact.dart';

part 'cats_api_client.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com/")
abstract class CatsApiClient {
  factory CatsApiClient(Dio dio, {String baseUrl}) = _CatsApiClient;

  @GET("/facts")
  Future<List<CatFact>> getFacts();
}
