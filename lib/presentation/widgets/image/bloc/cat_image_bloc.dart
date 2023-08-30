import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/cats/usecase/cat_image_usecase.dart';
import 'cat_image_event.dart';
import 'cat_image_state.dart';

class CatImageBloc extends Bloc<CatImageEvent, CatImageState> {
  final CatImageUseCase getRandomCatImageUseCase;

  CatImageBloc(this.getRandomCatImageUseCase) : super(CatImageStatePrepared()) {
    on<CatImageLoadingEvent>(prepareImageLoading);
    on<CatImageReadyEvent>(prepareImageDisplay);
  }

  FutureOr<void> prepareImageLoading(
      CatImageLoadingEvent event, Emitter<CatImageState> emit) async {
    emit(CatImageStateLoading());
    var result = await getRandomCatImageUseCase.invoke();
    add(CatImageReadyEvent(result));
  }

  FutureOr<void> prepareImageDisplay(
      CatImageReadyEvent event, Emitter<CatImageState> emit) {
    emit(CatImageStateReady(event.image));
  }
}
