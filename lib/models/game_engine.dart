class GameEngine {
  final String name;
  final String description;
  final List<String> imageUrls; // Изменили на список изображений
  final List<String> features;

  GameEngine({
    required this.name,
    required this.description,
    required this.imageUrls, // Обновили параметр
    required this.features,
  });
}

// Данные о движках
final List<GameEngine> gameEngines = [
  GameEngine(
    name: 'Unity',
    description: 'Кроссплатформенный игровой движок для разработки 2D и 3D игр и приложений. Поддерживает множество платформ включая PC, мобильные устройства и игровые консоли.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Unity_Technologies_logo.svg/2560px-Unity_Technologies_logo.svg.png',
      'https://media.sketchfab.com/models/2afd04b26ca64c6b8392f75e217ffdb9/thumbnails/b8b7fd406e624b27bcf5d22af1857ac0/6fc6917029464e18aef80d4f82f479a4.jpeg'
    ],
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
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Unreal_Engine_Logo_%28new_typeface%29.svg/800px-Unreal_Engine_Logo_%28new_typeface%29.svg.png',
      'https://bairesdev.mo.cloudinary.net/blog/2022/08/ue-logo-1400x788-1400x788-8f185e1e3635-1.jpg?tx=w_1920,q_auto'
    ],
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
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF0JRsHg5TbN3vU_PldPoFfyVWgwtKCG6KEw&s'
    ],
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
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/8/8d/CryEngine_Nex-Gen%284th_Generation%29.png',
      'https://upload.wikimedia.org/wikipedia/ru/9/93/CryEngine3_logo.jpg'
    ],
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
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/GameMaker_Logo.svg/1920px-GameMaker_Logo.svg.png',
      'https://upload.wikimedia.org/wikipedia/commons/2/2e/GameMaker-Studio-Logo1.jpg'
    ],
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
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Construct_3_Logo.svg/800px-Construct_3_Logo.svg.png',
      'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Construct_2_logo.png/250px-Construct_2_logo.png'
    ],
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
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Source_engine_logo_and_wordmark.svg/1920px-Source_engine_logo_and_wordmark.svg.png',
      'https://www.sourcemodding.com/img/history/source2/source_engine2_logo.webp'
    ],
    features: [
      'Продвинутая физика на основе Havok',
      'Технология facial animation для реалистичной мимики',
      'Интеграция с Steamworks',
      'Модифицируемость и поддержка модов',
    ],
  ),
];