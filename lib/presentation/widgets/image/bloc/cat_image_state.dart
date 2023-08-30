import 'package:equatable/equatable.dart';

import '../../../../domain/cats/entity/cat_image.dart';
import '../../facts/bloc/cat_fact_state.dart';


abstract class CatImageState extends Equatable{
  final CatState state;

  const CatImageState(this.state);

  List<Object?> get props => [state];
}

class CatImageStatePrepared extends CatImageState{
  const CatImageStatePrepared() : super(CatState.prepared);
}

class CatImageStateLoading extends CatImageState{
  const CatImageStateLoading() : super(CatState.loading);

}
class CatImageStateReady extends CatImageState{
  final CatImage image;
  const CatImageStateReady(this.image) : super(CatState.ready);

}