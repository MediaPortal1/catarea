import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/storage/repository/local_cats_repository.dart';
import '../../domain/cats/repository/cats_repository.dart';
import '../../domain/cats/usecase/get_history_usecase.dart';
import '../widgets/history/bloc/cat_history_bloc.dart';
import '../widgets/history/bloc/cat_history_event.dart';
import 'history_layout.dart';

const ROUTE_HISTORY = '/history';

class CatFactsHistoryPage extends StatelessWidget {
  const CatFactsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CatFactsRepository>(
        create: (context) => LocalCatsRepository(),
        child: BlocProvider<CatHistoryBloc>(
            create: (context) =>
                CatHistoryBloc(GetCatFactsHistoryUseCase(LocalCatsRepository()))
                  ..add(CatHistoryLoad()),
            child: const CatFactsHistoryLayout()));
  }
}
