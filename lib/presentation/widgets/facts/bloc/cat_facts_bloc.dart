import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/cats/entity/cat_fact.dart';
import '../../../../domain/cats/usecase/cat_fact_liked_usecase.dart';
import '../../../../domain/cats/usecase/cats_facts_usecase.dart';
import 'cat_fact_event.dart';
import 'cat_fact_state.dart';

class CatFactsBloc extends Bloc<CatFactsEvent, CatFactsState> {
  final CatFactsUseCase generateCatFactUseCase;
  final CatFactLikedUseCase likedCatFactUseCase;

  late Iterator<CatFact> catsIterator;

  CatFactsBloc(this.generateCatFactUseCase, this.likedCatFactUseCase)
      : super(const CatPreparedState()) {
    on<LoadCatFactEvent>(handleLoadCatEvent);
    on<NewCatFactEvent>(handleNewCatFactEvent);
    on<CatFactReadyEvent>(handleCatReadyEvent);
    on<CatFactLikedEvent>(handleCatLikedEvent);
  }

  FutureOr<void> handleLoadCatEvent(
      LoadCatFactEvent event, Emitter<CatFactsState> emit) async {
    emit(const LoadingState());
    await generateCatFactUseCase
        .invoke()
        .then((value) => {add(CatFactReadyEvent(value))});
  }

  FutureOr<void> handleCatReadyEvent(CatFactReadyEvent event, Emitter<CatFactsState> emit) {
    catsIterator = event.facts.iterator..moveNext();
    emit(CatFactReadyState(catsIterator.current));
  }

  FutureOr<void> handleNewCatFactEvent(
      NewCatFactEvent event, Emitter<CatFactsState> emit) {
    if (state is CatFactReadyState) {
      if (!catsIterator.moveNext()) {
        add(LoadCatFactEvent());
      } else {
        emit(CatFactReadyState(catsIterator.current));
      }
    }
  }

  FutureOr<void> handleCatLikedEvent(
      CatFactLikedEvent event, Emitter<CatFactsState> emit) async {
    if (await likedCatFactUseCase.invoke((state as CatFactReadyState).fact)) {
      emit(CatFactReadyState(catsIterator.current)
        ..onLiked((state as CatFactReadyState).isLiked));
    }
  }
}
