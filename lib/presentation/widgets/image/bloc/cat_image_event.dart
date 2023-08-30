import 'package:equatable/equatable.dart';

import '../../../../domain/cats/entity/cat_image.dart';

abstract class CatImageEvent extends Equatable{
  @override List<Object?> get props => [];
}

class CatImageLoadingEvent extends CatImageEvent{}

class CatImageReadyEvent extends CatImageEvent{
  final CatImage image;

  CatImageReadyEvent(this.image);
}