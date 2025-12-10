part of 'game_engine_bloc.dart';

@immutable
sealed class GameEngineEvent {}

class LoadGameEnginesEvent extends GameEngineEvent {}

class SearchGameEnginesEvent extends GameEngineEvent {
  final String query;

  SearchGameEnginesEvent(this.query);
}

class AddGameEngineEvent extends GameEngineEvent {
  final app_model.GameEngineModel engine;

  AddGameEngineEvent(this.engine);
}

class UpdateGameEngineEvent extends GameEngineEvent {
  final app_model.GameEngineModel engine;

  UpdateGameEngineEvent(this.engine);
}

class DeleteGameEngineEvent extends GameEngineEvent {
  final int engineId;

  DeleteGameEngineEvent(this.engineId);
}