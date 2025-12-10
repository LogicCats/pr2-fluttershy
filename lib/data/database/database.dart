import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';

part 'database.g.dart';

// Таблица для хранения изображений
@DataClassName('Image')
class Images extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get url => text()();
  TextColumn get localPath => text().nullable()();
  IntColumn get engineId => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Таблица для хранения особенностей
@DataClassName('Feature')
class Features extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get leadingIcon => text().withDefault(const Constant('🎮'))();
  TextColumn get trailingIcon => text().withDefault(const Constant('➡️'))();
  IntColumn get engineId => integer().nullable()();
}

// Таблица для игровых движков
@DataClassName('GameEngine')
class GameEngines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [GameEngines, Images, Features],
)
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _seedInitialData();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Логика обновления базы данных при изменении схемы
    },
  );

  Future<void> _seedInitialData() async {
    // Проверяем, есть ли уже данные
    final count = await select(gameEngines).get();
    if (count.isNotEmpty) return;

    // Добавляем все движки из вашего списка

    // 1. Unity
    final unityId = await into(gameEngines).insert(
      GameEnginesCompanion.insert(
        name: 'Unity',
        description: 'Кроссплатформенный игровой движок для разработки 2D и 3D игр и приложений. Поддерживает множество платформ включая PC, мобильные устройства и игровые консоли.',
      ),
    );

    // Изображения для Unity
    await Future.wait([
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/ru/a/a3/Unity_Logo.png', engineId: Value(unityId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://eu-images.contentstack.com/v3/assets/blt740a130ae3c5d529/bltdb2549f4bf38877c/6557812874ff0e040a67f90a/Unity_Game_Pass.png', engineId: Value(unityId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://cdn.prod.website-files.com/63fda77e5fd49598bbf00892/6436b3d216cc13283a8994dd_berita-211-berkenalan-dengan-fitur-fitur-unity-3d-20200716-153311.png', engineId: Value(unityId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png', engineId: Value(unityId))),
    ]);

    // Особенности для Unity
    await Future.wait([
      into(features).insert(FeaturesCompanion.insert(title: 'Визуальная среда разработки', description: 'Интуитивный редактор с drag-and-drop функциональностью', engineId: Value(unityId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Поддержка C#', description: 'Использование C# в качестве основного языка программирования', engineId: Value(unityId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Большое сообщество', description: 'Активная экосистема разработчиков и ресурсов', engineId: Value(unityId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Бесплатный для инди-разработчиков', description: 'Бесплатная версия для индивидуальных разработчиков', engineId: Value(unityId))),
    ]);

    // 2. Unreal Engine
    final unrealId = await into(gameEngines).insert(
      GameEnginesCompanion.insert(
        name: 'Unreal Engine',
        description: 'Мощный игровой движок с передовой графикой, используемый для создания AAA-игр и визуализаций. Разработан Epic Games.',
      ),
    );

    // Изображения для Unreal Engine
    await Future.wait([
      into(images).insert(ImagesCompanion.insert(url: 'https://bairesdev.mo.cloudinary.net/blog/2022/08/ue-logo-1400x788-1400x788-8f185e1e3635-1.jpg?tx=w_1920,q_auto', engineId: Value(unrealId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Unreal_Engine_Logo.svg/1200px-Unreal_Engine_Logo.svg.png', engineId: Value(unrealId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Unreal_Engine_horizontal_logo.svg/1920px-Unreal_Engine_horizontal_logo.svg.png', engineId: Value(unrealId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png', engineId: Value(unrealId))),
    ]);

    // Особенности для Unreal Engine
    await Future.wait([
      into(features).insert(FeaturesCompanion.insert(title: 'Высококачественная графика', description: 'Поддержка Ray Tracing и продвинутых графических технологий', engineId: Value(unrealId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Система Blueprints', description: 'Визуальное программирование без написания кода', engineId: Value(unrealId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Поддержка C++', description: 'Мощные возможности программирования на C++', engineId: Value(unrealId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Бесплатен с роялти', description: 'Бесплатен с роялти после первого \$1 млн дохода', engineId: Value(unrealId))),
    ]);

    // 3. Godot
    final godotId = await into(gameEngines).insert(
      GameEnginesCompanion.insert(
        name: 'Godot',
        description: 'Открытый и бесплатный игровой движок с поддержкой 2D и 3D графики. Имеет собственный язык программирования GDScript.',
      ),
    );

    // Изображения для Godot
    await Future.wait([
      into(images).insert(ImagesCompanion.insert(url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJJHJY4f2pwLONjPrnJ9nAYbMs-7_aaDpliw&s', engineId: Value(godotId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://cdn2.unrealengine.com/godot-fb-tw-share-image-1920x1080-0abe26cbac38.jpg', engineId: Value(godotId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://static0.makeuseofimages.com/wordpress/wp-content/uploads/2021/07/godot_fb_cover_img.jpg?w=1600&h=900&fit=crop', engineId: Value(godotId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png', engineId: Value(godotId))),
    ]);

    // Особенности для Godot
    await Future.wait([
      into(features).insert(FeaturesCompanion.insert(title: 'Открытый исходный код', description: 'Полностью открытый и бесплатный движок', engineId: Value(godotId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Язык GDScript', description: 'Собственный язык, похожий на Python', engineId: Value(godotId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Поддержка множества платформ', description: 'Экспорт на различные платформы', engineId: Value(godotId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Без роялти', description: 'Не требует роялти или подписки', engineId: Value(godotId))),
    ]);

    // 4. CryEngine
    final cryEngineId = await into(gameEngines).insert(
      GameEnginesCompanion.insert(
        name: 'CryEngine',
        description: 'Игровой движок с продвинутой графикой, известный по играм серии Crysis. Разработан немецкой компанией Crytek.',
      ),
    );

    // Изображения для CryEngine
    await Future.wait([
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/8d/CryEngine_Nex-Gen%284th_Generation%29.png', engineId: Value(cryEngineId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/220980/capsule_616x353.jpg?t=1478096497', engineId: Value(cryEngineId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/ru/9/93/CryEngine3_logo.jpg', engineId: Value(cryEngineId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png', engineId: Value(cryEngineId))),
    ]);

    // Особенности для CryEngine
    await Future.wait([
      into(features).insert(FeaturesCompanion.insert(title: 'Фотореалистичная графика', description: 'Поддержка передовых технологий рендеринга и реалистичного освещения', engineId: Value(cryEngineId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Поддержка масштабируемости', description: 'Возможность создания игр от мобильных до AAA-класса', engineId: Value(cryEngineId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Мощный редактор уровней', description: 'Инструменты для создания детализированных игровых миров', engineId: Value(cryEngineId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Интеграция физики и аудио', description: 'Реалистичные эффекты физики и объемное звуковое сопровождение', engineId: Value(cryEngineId))),
    ]);

    // 5. GameMaker Studio
    final gameMakerId = await into(gameEngines).insert(
      GameEnginesCompanion.insert(
        name: 'GameMaker Studio',
        description: 'Игровой движок, ориентированный на 2D-разработку, с упором на простоту использования и быстрое создание прототипов.',
      ),
    );

    // Изображения для GameMaker Studio
    await Future.wait([
      into(images).insert(ImagesCompanion.insert(url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo283Gao-M6_bafMbeyt2MQVJNgnSUq9vI5Q&s', engineId: Value(gameMakerId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsSFYOCmAwUZcM0qBqG179Mle9X52a8nkhRg&s', engineId: Value(gameMakerId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1670460/header.jpg', engineId: Value(gameMakerId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png', engineId: Value(gameMakerId))),
    ]);

    // Особенности для GameMaker Studio
    await Future.wait([
      into(features).insert(FeaturesCompanion.insert(title: 'Простой интерфейс', description: 'Интуитивно понятный редактор для быстрого старта разработки', engineId: Value(gameMakerId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Язык GML', description: 'Простой скриптовый язык для создания логики игр', engineId: Value(gameMakerId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Поддержка 2D-графики', description: 'Оптимизирован для разработки 2D-игр и анимаций', engineId: Value(gameMakerId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Экспорт на множество платформ', description: 'Возможность публикации игр на Windows, macOS, мобильных ОС и веб', engineId: Value(gameMakerId))),
    ]);

    // 6. Construct
    final constructId = await into(gameEngines).insert(
      GameEnginesCompanion.insert(
        name: 'Construct',
        description: 'Игровой движок, основанный на событиях, не требующий знания программирования. Идеален для начинающих разработчиков.',
      ),
    );

    // Изображения для Construct
    await Future.wait([
      into(images).insert(ImagesCompanion.insert(url: 'https://static.wixstatic.com/media/fb6e57_05cb5f53e9c649959895487a5490bdf1~mv2.png/v1/fill/w_320,h_320,al_c,lg_1,q_85,enc_auto/fb6e57_05cb5f53e9c649959895487a5490bdf1~mv2.png', engineId: Value(constructId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://store-images.s-microsoft.com/image/apps.52943.14569108969114715.cad57170-da51-419a-b303-cf8423d450e0.74be02b5-d797-4949-b57e-5b25ca32fed2', engineId: Value(constructId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://i.ebayimg.com/images/g/o54AAOSwB8NdxXqr/s-l400.png', engineId: Value(constructId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png', engineId: Value(constructId))),
    ]);

    // Особенности для Construct
    await Future.wait([
      into(features).insert(FeaturesCompanion.insert(title: 'Разработка без кода', description: 'Мощная система событий для создания логики без программирования', engineId: Value(constructId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Поддержка HTML5', description: 'Экспорт игр в формат HTML5 для запуска в браузерах', engineId: Value(constructId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Быстрое прототипирование', description: 'Интуитивный интерфейс и инструменты для быстрой сборки игр', engineId: Value(constructId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Многоплатформенность', description: 'Поддержка публикации на различные устройства и платформы', engineId: Value(constructId))),
    ]);

    // 7. Source
    final sourceId = await into(gameEngines).insert(
      GameEnginesCompanion.insert(
        name: 'Source',
        description: 'Игровой движок, разработанный Valve Corporation, известный по играм Half-Life 2, Counter-Strike: Source и другим.',
      ),
    );

    // Изображения для Source
    await Future.wait([
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Source_engine_logo_and_wordmark.svg/330px-Source_engine_logo_and_wordmark.svg.png', engineId: Value(sourceId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://habrastorage.org/webt/35/p6/il/35p6ilwrz5fccxsgnk7vtjewpww.png', engineId: Value(sourceId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://images.steamusercontent.com/ugc/2036228562264431236/55345CC0365CF36A171A88B329729EE99EEEB36E/', engineId: Value(sourceId))),
      into(images).insert(ImagesCompanion.insert(url: 'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png', engineId: Value(sourceId))),
    ]);

    // Особенности для Source
    await Future.wait([
      into(features).insert(FeaturesCompanion.insert(title: 'Поддержка моддинга', description: 'Позволяет сообществу создавать пользовательский контент и модификации', engineId: Value(sourceId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Инновационная физика', description: 'Использование Havok Physics для реалистичного взаимодействия объектов', engineId: Value(sourceId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Передовая графика на момент релиза', description: 'Поддержка освещения, теней и эффектов постобработки', engineId: Value(sourceId))),
      into(features).insert(FeaturesCompanion.insert(title: 'Расширяемость', description: 'Возможность кастомизации движка под нужды игры и пользователей', engineId: Value(sourceId))),
    ]);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'game_engines.db'));
    return NativeDatabase.createInBackground(file);
  });
}