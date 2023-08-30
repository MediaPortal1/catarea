import 'package:equatable/equatable.dart';

import '../../../../domain/cats/entity/cat_fact.dart';

abstract class CatFactsEvent extends Equatable{
  @override List<Object?> get props => [];
}

class LoadCatFactEvent extends CatFactsEvent{}

class NewCatFactEvent extends CatFactsEvent{}

class CatFactReadyEvent extends CatFactsEvent{
  final List<CatFact> facts;
  CatFactReadyEvent(this.facts);
  @override List<Object?> get props => [facts];
}

class CatFactLikedEvent extends CatFactsEvent{}
