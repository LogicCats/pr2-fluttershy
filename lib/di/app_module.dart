import 'package:injectable/injectable.dart';
import '../data/database/database.dart';
import '../data/repositories/game_engine_repository.dart';
import '../bloc/game_engine/game_engine_bloc.dart';

@module
abstract class AppModule {
  @singleton
  AppDatabase get appDatabase => AppDatabase();

  @singleton
  GameEngineRepository gameEngineRepository(AppDatabase database) =>
      GameEngineRepository(database);

  @singleton
  GameEngineBloc gameEngineBloc(GameEngineRepository repository) =>
      GameEngineBloc(repository);
}