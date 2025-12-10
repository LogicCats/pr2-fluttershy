import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import '../database/database.dart';
import '../../models/game_engine.dart' as app_model;
import '../../models/feature.dart' as app_model;

@lazySingleton
class GameEngineRepository {
  final AppDatabase _database;

  GameEngineRepository(this._database);

  // Получение всех игровых движков
  Future<List<app_model.GameEngineModel>> getAllGameEngines() async {
    // Получаем все движки из базы данных
    final engines = await _database.select(_database.gameEngines).get();
    final result = <app_model.GameEngineModel>[];

    for (final engine in engines) {
      // Получаем изображения для движка
      final images = await (_database.select(_database.images)
        ..where((tbl) => tbl.engineId.equals(engine.id)))
          .get()
          .then((entities) => entities.map((e) => e.url).toList());

      // Получаем особенности для движка
      final features = await (_database.select(_database.features)
        ..where((tbl) => tbl.engineId.equals(engine.id)))
          .get()
          .then((entities) => entities
          .map((e) => app_model.FeatureModel(
        title: e.title,
        description: e.description,
        leadingIcon: e.leadingIcon,
        trailingIcon: e.trailingIcon,
      ))
          .toList());

      result.add(app_model.GameEngineModel(
        id: engine.id,
        name: engine.name,
        description: engine.description,
        imageUrls: images,
        features: features,
      ));
    }

    return result;
  }

  // Добавление нового движка
  Future<int> addGameEngine(app_model.GameEngineModel engine) async {
    final engineId = await _database.into(_database.gameEngines).insert(
      GameEnginesCompanion.insert(
        name: engine.name,
        description: engine.description,
      ),
    );

    // Сохраняем изображения
    for (final url in engine.imageUrls) {
      await _database.into(_database.images).insert(
        ImagesCompanion.insert(
          url: url,
          engineId: Value(engineId),
        ),
      );
    }

    // Сохраняем особенности
    for (final feature in engine.features) {
      await _database.into(_database.features).insert(
        FeaturesCompanion.insert(
          title: feature.title,
          description: feature.description,
          leadingIcon: Value(feature.leadingIcon),
          trailingIcon: Value(feature.trailingIcon),
          engineId: Value(engineId),
        ),
      );
    }

    return engineId;
  }

  // Обновление движка
  Future<void> updateGameEngine(app_model.GameEngineModel engine) async {
    await (_database.update(_database.gameEngines)
      ..where((tbl) => tbl.id.equals(engine.id!)))
        .write(
      GameEnginesCompanion(
        name: Value(engine.name),
        description: Value(engine.description),
      ),
    );

    // Удаляем старые изображения
    await (_database.delete(_database.images)
      ..where((tbl) => tbl.engineId.equals(engine.id!)))
        .go();

    // Добавляем новые изображения
    for (final url in engine.imageUrls) {
      await _database.into(_database.images).insert(
        ImagesCompanion.insert(
          url: url,
          engineId: Value(engine.id!),
        ),
      );
    }

    // Удаляем старые особенности
    await (_database.delete(_database.features)
      ..where((tbl) => tbl.engineId.equals(engine.id!)))
        .go();

    // Добавляем новые особенности
    for (final feature in engine.features) {
      await _database.into(_database.features).insert(
        FeaturesCompanion.insert(
          title: feature.title,
          description: feature.description,
          leadingIcon: Value(feature.leadingIcon),
          trailingIcon: Value(feature.trailingIcon),
          engineId: Value(engine.id!),
        ),
      );
    }
  }

  // Удаление движка
  Future<void> deleteGameEngine(int engineId) async {
    // Удаляем связанные изображения
    await (_database.delete(_database.images)
      ..where((tbl) => tbl.engineId.equals(engineId)))
        .go();

    // Удаляем связанные особенности
    await (_database.delete(_database.features)
      ..where((tbl) => tbl.engineId.equals(engineId)))
        .go();

    // Удаляем сам движок
    await (_database.delete(_database.gameEngines)
      ..where((tbl) => tbl.id.equals(engineId)))
        .go();
  }

  // Поиск движков по названию
  Future<List<app_model.GameEngineModel>> searchGameEngines(String query) async {
    final allEngines = await getAllGameEngines();
    return allEngines
        .where((engine) =>
        engine.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}