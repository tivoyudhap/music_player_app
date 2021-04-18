import 'package:equatable/equatable.dart';
import 'package:music_player_app/entity/data_entity.dart';

abstract class BaseBlocEvent extends Equatable { }

abstract class BaseBlocState extends Equatable { }

class LoadingState extends BaseBlocState {
  @override
  List<Object> get props => [];
}

abstract class ReturnDataState<T> extends BaseBlocState {
  UIDataEntity<T> entity = UIDataEntity();

  ReturnDataState(this.entity);

  @override
  List<Object> get props => [entity];
}