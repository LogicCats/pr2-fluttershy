part of 'game_engine_bloc.dart';

@immutable
sealed class GameEngineState {}

class GameEngineInitial extends GameEngineState {}

class GameEngineLoading extends GameEngineState {}

class GameEngineLoaded extends GameEngineState {
  final List<app_model.GameEngineModel> engines;

  GameEngineLoaded({required this.engines});
}

class GameEngineError extends GameEngineState {
  final String message;

  GameEngineError(this.message);
}