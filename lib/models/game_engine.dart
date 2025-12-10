// Переименуем модель приложения, чтобы избежать конфликта с Drift
import 'feature.dart';

class GameEngineModel {
  final int? id;
  final String name;
  final String description;
  final List<String> imageUrls;
  final List<FeatureModel> features;

  GameEngineModel({
    this.id,
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.features,
  });

  // Конвертация из сущности базы данных
  factory GameEngineModel.fromEntity({
    required int id,
    required String name,
    required String description,
    required List<String> images,
    required List<FeatureModel> features,
  }) {
    return GameEngineModel(
      id: id,
      name: name,
      description: description,
      imageUrls: images,
      features: features,
    );
  }

  // Конвертация в Map для JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrls': imageUrls,
      'features': features.map((f) => f.toJson()).toList(),
    };
  }

  // Копирование с изменениями
  GameEngineModel copyWith({
    int? id,
    String? name,
    String? description,
    List<String>? imageUrls,
    List<FeatureModel>? features,
  }) {
    return GameEngineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      features: features ?? this.features,
    );
  }
}


// final List<GameEngine> gameEngines = [
//   GameEngine(
//     name: 'Unity',
//     description: 'Кроссплатформенный игровой движок для разработки 2D и 3D игр и приложений. Поддерживает множество платформ включая PC, мобильные устройства и игровые консоли.',
//     imageUrls: [
//       'https://upload.wikimedia.org/wikipedia/ru/a/a3/Unity_Logo.png',
//       'https://eu-images.contentstack.com/v3/assets/blt740a130ae3c5d529/bltdb2549f4bf38877c/6557812874ff0e040a67f90a/Unity_Game_Pass.png',
//       'https://cdn.prod.website-files.com/63fda77e5fd49598bbf00892/6436b3d216cc13283a8994dd_berita-211-berkenalan-dengan-fitur-fitur-unity-3d-20200716-153311.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png'
//     ],
//     features: [
//       Feature(
//         title: 'Визуальная среда разработки',
//         description: 'Интуитивный редактор с drag-and-drop функциональностью',
//       ),
//       Feature(
//         title: 'Поддержка C#',
//         description: 'Использование C# в качестве основного языка программирования',
//       ),
//       Feature(
//         title: 'Большое сообщество',
//         description: 'Активная экосистема разработчиков и ресурсов',
//       ),
//       Feature(
//         title: 'Бесплатный для инди-разработчиков',
//         description: 'Бесплатная версия для индивидуальных разработчиков',
//       ),
//     ],
//   ),
//   GameEngine(
//     name: 'Unreal Engine',
//     description: 'Мощный игровой движок с передовой графикой, используемый для создания AAA-игр и визуализаций. Разработан Epic Games.',
//     imageUrls: [
//       'https://bairesdev.mo.cloudinary.net/blog/2022/08/ue-logo-1400x788-1400x788-8f185e1e3635-1.jpg?tx=w_1920,q_auto',
//       'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Unreal_Engine_Logo.svg/1200px-Unreal_Engine_Logo.svg.png',
//       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Unreal_Engine_horizontal_logo.svg/1920px-Unreal_Engine_horizontal_logo.svg.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png'
//     ],
//     features: [
//       Feature(
//         title: 'Высококачественная графика',
//         description: 'Поддержка Ray Tracing и продвинутых графических технологий',
//       ),
//       Feature(
//         title: 'Система Blueprints',
//         description: 'Визуальное программирование без написания кода',
//       ),
//       Feature(
//         title: 'Поддержка C++',
//         description: 'Мощные возможности программирования на C++',
//       ),
//       Feature(
//         title: 'Бесплатен с роялти',
//         description: 'Бесплатен с роялти после первого \$1 млн дохода',
//       ),
//     ],
//   ),
//   GameEngine(
//     name: 'Godot',
//     description: 'Открытый и бесплатный игровой движок с поддержкой 2D и 3D графики. Имеет собственный язык программирования GDScript.',
//     imageUrls: [
//       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJJHJY4f2pwLONjPrnJ9nAYbMs-7_aaDpliw&s',
//       'https://cdn2.unrealengine.com/godot-fb-tw-share-image-1920x1080-0abe26cbac38.jpg',
//       'https://static0.makeuseofimages.com/wordpress/wp-content/uploads/2021/07/godot_fb_cover_img.jpg?w=1600&h=900&fit=crop',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png'
//     ],
//     features: [
//       Feature(
//         title: 'Открытый исходный код',
//         description: 'Полностью открытый и бесплатный движок',
//       ),
//       Feature(
//         title: 'Язык GDScript',
//         description: 'Собственный язык, похожий на Python',
//       ),
//       Feature(
//         title: 'Поддержка множества платформ',
//         description: 'Экспорт на различные платформы',
//       ),
//       Feature(
//         title: 'Без роялти',
//         description: 'Не требует роялти или подписки',
//       ),
//     ],
//   ),
//   GameEngine(
//     name: 'CryEngine',
//     description: 'Игровой движок с продвинутой графикой, известный по играм серии Crysis. Разработан немецкой компанией Crytek.',
//     imageUrls: [
//       'https://upload.wikimedia.org/wikipedia/commons/8/8d/CryEngine_Nex-Gen%284th_Generation%29.png',
//       'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/220980/capsule_616x353.jpg?t=1478096497',
//       'https://upload.wikimedia.org/wikipedia/ru/9/93/CryEngine3_logo.jpg',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png'
//     ],
//     features: [
//       Feature(
//         title: 'Фотореалистичная графика',
//         description: 'Поддержка передовых технологий рендеринга и реалистичного освещения',
//       ),
//       Feature(
//         title: 'Поддержка масштабируемости',
//         description: 'Возможность создания игр от мобильных до AAA-класса',
//       ),
//       Feature(
//         title: 'Мощный редактор уровней',
//         description: 'Инструменты для создания детализированных игровых миров',
//       ),
//       Feature(
//         title: 'Интеграция физики и аудио',
//         description: 'Реалистичные эффекты физики и объемное звуковое сопровождение',
//       ),
//     ],
//   ),
//   GameEngine(
//     name: 'GameMaker Studio',
//     description: 'Игровой движок, ориентированный на 2D-разработку, с упором на простоту использования и быстрое создание прототипов.',
//     imageUrls: [
//       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo283Gao-M6_bafMbeyt2MQVJNgnSUq9vI5Q&s',
//       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsSFYOCmAwUZcM0qBqG179Mle9X52a8nkhRg&s',
//       'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1670460/header.jpg',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png'
//     ],
//     features: [
//       Feature(
//         title: 'Простой интерфейс',
//         description: 'Интуитивно понятный редактор для быстрого старта разработки',
//       ),
//       Feature(
//         title: 'Язык GML',
//         description: 'Простой скриптовый язык для создания логики игр',
//       ),
//       Feature(
//         title: 'Поддержка 2D-графики',
//         description: 'Оптимизирован для разработки 2D-игр и анимаций',
//       ),
//       Feature(
//         title: 'Экспорт на множество платформ',
//         description: 'Возможность публикации игр на Windows, macOS, мобильных ОС и веб',
//       ),
//     ],
//   ),
//   GameEngine(
//     name: 'Construct',
//     description: 'Игровой движок, основанный на событиях, не требующий знания программирования. Идеален для начинающих разработчиков.',
//     imageUrls: [
//       'https://static.wixstatic.com/media/fb6e57_05cb5f53e9c649959895487a5490bdf1~mv2.png/v1/fill/w_320,h_320,al_c,lg_1,q_85,enc_auto/fb6e57_05cb5f53e9c649959895487a5490bdf1~mv2.png',
//       'https://store-images.s-microsoft.com/image/apps.52943.14569108969114715.cad57170-da51-419a-b303-cf8423d450e0.74be02b5-d797-4949-b57e-5b25ca32fed2',
//       'https://i.ebayimg.com/images/g/o54AAOSwB8NdxXqr/s-l400.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png'
//     ],
//     features: [
//       Feature(
//         title: 'Разработка без кода',
//         description: 'Мощная система событий для создания логики без программирования',
//       ),
//       Feature(
//         title: 'Поддержка HTML5',
//         description: 'Экспорт игр в формат HTML5 для запуска в браузерах',
//       ),
//       Feature(
//         title: 'Быстрое прототипирование',
//         description: 'Интуитивный интерфейс и инструменты для быстрой сборки игр',
//       ),
//       Feature(
//         title: 'Многоплатформенность',
//         description: 'Поддержка публикации на различные устройства и платформы',
//       ),
//     ],
//   ),
//   GameEngine(
//     name: 'Source',
//     description: 'Игровой движок, разработанный Valve Corporation, известный по играм Half-Life 2, Counter-Strike: Source и другим.',
//     imageUrls: [
//       'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Source_engine_logo_and_wordmark.svg/330px-Source_engine_logo_and_wordmark.svg.png',
//       'https://habrastorage.org/webt/35/p6/il/35p6ilwrz5fccxsgnk7vtjewpww.png',
//       'https://images.steamusercontent.com/ugc/2036228562264431236/55345CC0365CF36A171A88B329729EE99EEEB36E/',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png',
//       'https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png'
//     ],
//     features: [
//       Feature(
//         title: 'Поддержка моддинга',
//         description: 'Позволяет сообществу создавать пользовательский контент и модификации',
//       ),
//       Feature(
//         title: 'Инновационная физика',
//         description: 'Использование Havok Physics для реалистичного взаимодействия объектов',
//       ),
//       Feature(
//         title: 'Передовая графика на момент релиза',
//         description: 'Поддержка освещения, теней и эффектов постобработки',
//       ),
//       Feature(
//         title: 'Расширяемость',
//         description: 'Возможность кастомизации движка под нужды игры и пользователей',
//       ),
//     ],
//   ),
// ];