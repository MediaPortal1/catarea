import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/cats/usecase/get_history_usecase.dart';
import 'cat_history_event.dart';
import 'cat_history_state.dart';

class CatHistoryBloc extends Bloc<CatHistoryEvent, CatHistoryState>{
  final GetCatFactsHistoryUseCase getCatFactsHistoryUseCase;
  CatHistoryBloc(this.getCatFactsHistoryUseCase) : super(CatHistoryPrepared()){
    on<CatHistoryLoad>(onLoadingHistory);
  }


  FutureOr<void> onLoadingHistory(CatHistoryLoad event, Emitter<CatHistoryState> emit) async {
      emit(CatHistoryReadyState(await getCatFactsHistoryUseCase.invoke()));
  }
}