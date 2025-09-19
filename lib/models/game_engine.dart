class GameEngine {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> features;

  GameEngine({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.features,
  });
}

// Данные о движках
final List<GameEngine> gameEngines = [
  GameEngine(
    name: 'Unity',
    description: 'Кроссплатформенный игровой движок для разработки 2D и 3D игр и приложений. Поддерживает множество платформ включая PC, мобильные устройства и игровые консоли.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Unity_Technologies_logo.svg/2560px-Unity_Technologies_logo.svg.png',
    features: [
      'Визуальная среда разработки',
      'Поддержка C# в качестве основного языка',
      'Большое сообщество и активная экосистема',
      'Бесплатный для индивидуальных разработчиков',
    ],
  ),
  GameEngine(
    name: 'Unreal Engine',
    description: 'Мощный игровой движок с передовой графикой, используемый для создания AAA-игр и визуализаций. Разработан Epic Games.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Unreal_Engine_Logo_%28new_typeface%29.svg/800px-Unreal_Engine_Logo_%28new_typeface%29.svg.png',
    features: [
      'Высококачественная графика с Ray Tracing',
      'Система Blueprints для визуального программирования',
      'Поддержка C++',
      'Бесплатен с роялти после первого \$1 млн дохода',
    ],
  ),
  GameEngine(
    name: 'Godot',
    description: 'Открытый и бесплатный игровой движок с поддержкой 2D и 3D графики. Имеет собственный язык программирования GDScript.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png',
    features: [
      'Полностью открытый исходный код',
      'Собственный язык GDScript (похож на Python)',
      'Поддержка множества платформ',
      'Не требует роялти или подписки',
    ],
  ),
  GameEngine(
    name: 'CryEngine',
    description: 'Игровой движок с продвинутой графикой, известный по играм серии Crysis. Разработан немецкой компанией Crytek.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8d/CryEngine_Nex-Gen%284th_Generation%29.png',
    features: [
      'Передовая технология глобального освещения',
      'Мощные инструменты для создания ландшафтов',
      'Поддержка виртуальной реальности',
      'Платная модель на основе подписки',
    ],
  ),
  GameEngine(
    name: 'GameMaker Studio',
    description: 'Игровой движок, ориентированный на 2D-разработку, с упором на простоту использования и быстрое создание прототипов.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/GameMaker_Logo.svg/1920px-GameMaker_Logo.svg.png',
    features: [
      'Визуальное программирование Drag & Drop',
      'Собственный язык GML (GameMaker Language)',
      'Быстрая разработка 2D игр',
      'Экспорт на множество платформ',
    ],
  ),
  GameEngine(
    name: 'Construct',
    description: 'Игровой движок, основанный на событиях, не требующий знания программирования. Идеален для начинающих разработчиков.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Construct_3_Logo.svg/800px-Construct_3_Logo.svg.png',
    features: [
      'Программирование на основе событий',
      'Не требует знаний программирования',
      'Быстрое создание 2D игр',
      'Экспорт в HTML5 и другие платформы',
    ],
  ),
  GameEngine(
    name: 'Source',
    description: 'Игровой движок, разработанный Valve Corporation, известный по играм Half-Life 2, Counter-Strike: Source и другим.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Source_engine_logo_and_wordmark.svg/1920px-Source_engine_logo_and_wordmark.svg.png',
    features: [
      'Продвинутая физика на основе Havok',
      'Технология facial animation для реалистичной мимики',
      'Интеграция с Steamworks',
      'Модифицируемость и поддержка модов',
    ],
  ),
];