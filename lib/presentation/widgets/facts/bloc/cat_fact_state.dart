import 'package:equatable/equatable.dart';
import '../../../../domain/cats/entity/cat_fact.dart';


enum CatState {
  prepared,
  loading,
  ready,
  failed;
}

extension CatStateX on CatState{
  bool get isPrepared => this == CatState.prepared;
  bool get isLoading => this == CatState.loading;
  bool get isReady => this == CatState.ready;
  bool get isFailed => this == CatState.failed;
}

abstract class CatFactsState extends Equatable {
  final CatState catState;

  const CatFactsState({this.catState = CatState.prepared});

  @override
  List<Object?> get props => [catState];
}

class CatPreparedState extends CatFactsState{

  const CatPreparedState() : super(catState: CatState.prepared);
}

class LoadingState extends CatFactsState{
  const LoadingState() : super(catState: CatState.loading);
}

class CatFactReadyState extends CatFactsState {

  final CatFact fact;

  bool isLiked = false;

  CatFactReadyState(this.fact) : super(catState: CatState.ready);

  void onLiked(bool currentState){
    isLiked = !currentState;
  }

  @override
  List<Object?> get props => [fact, isLiked];
}

class CatFactFailedState extends CatFactsState{
final String errorMessage;

const CatFactFailedState(this.errorMessage) : super(catState: CatState.failed);
}
