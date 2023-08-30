import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../domain/cats/entity/cat_image.dart';

part 'cats_images_api_client.g.dart';

const IMAGES_API_KEY = "live_2E3P7h2vQ7BtRdl2EEUWXLiAwPwQueP6kIPOHt3OYXcJktneQihBTFxnrUm7pBjf";

@RestApi(baseUrl: "https://api.thecatapi.com/")
abstract class CatsImagesApiClient {
  factory CatsImagesApiClient(Dio dio, {String baseUrl}) = _CatsImagesApiClient;

  @GET("/v1/images/search")
  Future<List<CatImage>> getRandomImage();

}
