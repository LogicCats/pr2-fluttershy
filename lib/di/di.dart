import 'package:get_it/get_it.dart';
import '../data/database/database.dart';
import '../data/repositories/game_engine_repository.dart';
import '../bloc/game_engine/game_engine_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Регистрируем базу данных как синглтон
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Регистрируем репозиторий как синглтон
  getIt.registerLazySingleton<GameEngineRepository>(
        () => GameEngineRepository(getIt<AppDatabase>()),
  );

  // Регистрируем BLoC как factory (будет создаваться новый для каждой страницы)
  getIt.registerFactory<GameEngineBloc>(
        () => GameEngineBloc(getIt<GameEngineRepository>()),
  );
}