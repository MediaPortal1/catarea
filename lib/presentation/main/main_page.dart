import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/remote/api/facts/cats_api_client.dart';
import '../../data/remote/api/images/cats_images_api_client.dart';
import '../../data/remote/repository/network_cats_repository.dart';
import '../../data/storage/repository/local_cats_repository.dart';
import '../../domain/cats/repository/cats_repository.dart';
import '../../domain/cats/usecase/cat_fact_liked_usecase.dart';
import '../../domain/cats/usecase/cat_image_usecase.dart';
import '../../domain/cats/usecase/cats_facts_usecase.dart';
import '../widgets/facts/bloc/cat_fact_event.dart';
import '../widgets/facts/bloc/cat_facts_bloc.dart';
import '../widgets/image/bloc/cat_image_bloc.dart';
import '../widgets/image/bloc/cat_image_event.dart';
import 'main_layout.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => RepositoryProvider<CatFactsRepository>(
        create: (context) {
          final dio = Dio();
          dio.options.headers["api_key"] = IMAGES_API_KEY;
          return NetworkCatsRepository(
              CatsApiClient(Dio()), CatsImagesApiClient(dio));
        },
        child: MultiBlocProvider(providers: [
          BlocProvider<CatFactsBloc>(
              create: (context) => CatFactsBloc(
                  CatFactsUseCase(context.read<CatFactsRepository>()),
                  CatFactLikedUseCase(LocalCatsRepository()))
                ..add(LoadCatFactEvent())),
          BlocProvider<CatImageBloc>(
              create: (context) => CatImageBloc(CatImageUseCase(
                  context.read<CatFactsRepository>() as CatsImageRepository))
                ..add(CatImageLoadingEvent()))
        ], child: const MainLayout()),
      );
}
