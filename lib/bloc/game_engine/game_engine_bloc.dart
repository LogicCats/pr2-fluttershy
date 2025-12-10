import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/game_engine_repository.dart';
import '../../models/game_engine.dart' as app_model;

part 'game_engine_event.dart';
part 'game_engine_state.dart';

@injectable
class GameEngineBloc extends Bloc<GameEngineEvent, GameEngineState> {
  final GameEngineRepository _repository;

  GameEngineBloc(this._repository) : super(GameEngineInitial()) {
    on<LoadGameEnginesEvent>(_onLoadGameEngines);
    on<SearchGameEnginesEvent>(_onSearchGameEngines);
    on<AddGameEngineEvent>(_onAddGameEngine);
    on<UpdateGameEngineEvent>(_onUpdateGameEngine);
    on<DeleteGameEngineEvent>(_onDeleteGameEngine);
  }

  Future<void> _onLoadGameEngines(
      LoadGameEnginesEvent event,
      Emitter<GameEngineState> emit,
      ) async {
    emit(GameEngineLoading());
    try {
      final engines = await _repository.getAllGameEngines();
      emit(GameEngineLoaded(engines: engines));
    } catch (e) {
      emit(GameEngineError('Ошибка загрузки данных: $e'));
    }
  }

  Future<void> _onSearchGameEngines(
      SearchGameEnginesEvent event,
      Emitter<GameEngineState> emit,
      ) async {
    if (event.query.isEmpty) {
      add(LoadGameEnginesEvent());
      return;
    }

    emit(GameEngineLoading());
    try {
      final engines = await _repository.searchGameEngines(event.query);
      emit(GameEngineLoaded(engines: engines));
    } catch (e) {
      emit(GameEngineError('Ошибка поиска: $e'));
    }
  }

  Future<void> _onAddGameEngine(
      AddGameEngineEvent event,
      Emitter<GameEngineState> emit,
      ) async {
    final currentState = state;
    if (currentState is GameEngineLoaded) {
      emit(GameEngineLoading());
      try {
        await _repository.addGameEngine(event.engine);
        add(LoadGameEnginesEvent());
      } catch (e) {
        emit(GameEngineError('Ошибка добавления: $e'));
      }
    }
  }

  Future<void> _onUpdateGameEngine(
      UpdateGameEngineEvent event,
      Emitter<GameEngineState> emit,
      ) async {
    final currentState = state;
    if (currentState is GameEngineLoaded) {
      emit(GameEngineLoading());
      try {
        await _repository.updateGameEngine(event.engine);
        add(LoadGameEnginesEvent());
      } catch (e) {
        emit(GameEngineError('Ошибка обновления: $e'));
      }
    }
  }

  Future<void> _onDeleteGameEngine(
      DeleteGameEngineEvent event,
      Emitter<GameEngineState> emit,
      ) async {
    final currentState = state;
    if (currentState is GameEngineLoaded) {
      emit(GameEngineLoading());
      try {
        await _repository.deleteGameEngine(event.engineId);
        add(LoadGameEnginesEvent());
      } catch (e) {
        emit(GameEngineError('Ошибка удаления: $e'));
      }
    }
  }
}