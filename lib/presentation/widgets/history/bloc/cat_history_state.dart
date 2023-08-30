
import 'package:equatable/equatable.dart';

import '../../../../domain/cats/entity/cat_fact.dart';
import '../../facts/bloc/cat_fact_state.dart';

abstract class CatHistoryState extends Equatable{
  final CatState catHistoryState;

  const CatHistoryState(this.catHistoryState);

  @override
  List<Object> get props => [catHistoryState];
}

class CatHistoryPrepared extends CatHistoryState{
  const CatHistoryPrepared() : super(CatState.prepared);
}

class CatHistoryLoading extends CatHistoryState{
  const CatHistoryLoading() : super(CatState.loading);
}

class CatHistoryReadyState extends CatHistoryState{
  final List<CatFact> history;

  const CatHistoryReadyState(this.history) : super(CatState.ready);
}