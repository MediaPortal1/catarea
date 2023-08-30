import 'package:equatable/equatable.dart';
import '../../../../domain/cats/entity/cat_fact.dart';

abstract class CatHistoryEvent extends Equatable{
  @override List<Object> get props => [];
}

class CatHistoryLoad extends CatHistoryEvent{}

class CatHistoryReady extends CatHistoryEvent{
  final List<CatFact> facts;

  CatHistoryReady(this.facts);

  @override List<Object> get props => [facts];
}