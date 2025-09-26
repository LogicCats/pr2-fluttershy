class GameEngine {
  final String name;
  final String description;
  final List<String> imageUrls;
  final List<Feature> features; // Изменили на список объектов Feature

  GameEngine({
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.features,
  });
}

class Feature {
  final String title;
  final String description;
  final String leadingIcon;
  final String trailingIcon;

  Feature({
    required this.title,
    required this.description,
    this.leadingIcon = '🎮',
    this.trailingIcon = '➡️',
  });
}

// Данные о движках
final List<GameEngine> gameEngines = [
  GameEngine(
    name: 'Unity',
    description: 'Кроссплатформенный игровой движок для разработки 2D и 3D игр и приложений. Поддерживает множество платформ включая PC, мобильные устройства и игровые консоли.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Unity_Technologies_logo.svg/2560px-Unity_Technologies_logo.svg.png',
      'https://logos-world.net/wp-content/uploads/2023/01/Unity-Emblem.png',
      'https://haieng.com/wp-content/uploads/2017/10/test-image-500x500.jpg'
    ],
    features: [
      Feature(
        title: 'Визуальная среда разработки',
        description: 'Интуитивный редактор с drag-and-drop функциональностью',
      ),
      Feature(
        title: 'Поддержка C#',
        description: 'Использование C# в качестве основного языка программирования',
      ),
      Feature(
        title: 'Большое сообщество',
        description: 'Активная экосистема разработчиков и ресурсов',
      ),
      Feature(
        title: 'Бесплатный для инди-разработчиков',
        description: 'Бесплатная версия для индивидуальных разработчиков',
      ),
    ],
  ),
  GameEngine(
    name: 'Unreal Engine',
    description: 'Мощный игровой движок с передовой графикой, используемый для создания AAA-игр и визуализаций. Разработан Epic Games.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Unreal_Engine_Logo_%28new_typeface%29.svg/800px-Unreal_Engine_Logo_%28new_typeface%29.svg.png',
      'https://bairesdev.mo.cloudinary.net/blog/2022/08/ue-logo-1400x788-1400x788-8f185e1e3635-1.jpg?tx=w_1920,q_auto',
      'https://haieng.com/wp-content/uploads/2017/10/test-image-500x500.jpg'
    ],
    features: [
      Feature(
        title: 'Высококачественная графика',
        description: 'Поддержка Ray Tracing и продвинутых графических технологий',
      ),
      Feature(
        title: 'Система Blueprints',
        description: 'Визуальное программирование без написания кода',
      ),
      Feature(
        title: 'Поддержка C++',
        description: 'Мощные возможности программирования на C++',
      ),
      Feature(
        title: 'Бесплатен с роялти',
        description: 'Бесплатен с роялти после первого \$1 млн дохода',
      ),
    ],
  ),
  GameEngine(
    name: 'Godot',
    description: 'Открытый и бесплатный игровой движок с поддержкой 2D и 3D графики. Имеет собственный язык программирования GDScript.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF0JRsHg5TbN3vU_PldPoFfyVWgwtKCG6KEw&s',
      'https://haieng.com/wp-content/uploads/2017/10/test-image-500x500.jpg'
    ],
    features: [
      Feature(
        title: 'Открытый исходный код',
        description: 'Полностью открытый и бесплатный движок',
      ),
      Feature(
        title: 'Язык GDScript',
        description: 'Собственный язык, похожий на Python',
      ),
      Feature(
        title: 'Поддержка множества платформ',
        description: 'Экспорт на различные платформы',
      ),
      Feature(
        title: 'Без роялти',
        description: 'Не требует роялти или подписки',
      ),
    ],
  ),
  GameEngine(
    name: 'CryEngine',
    description: 'Игровой движок с продвинутой графикой, известный по играм серии Crysis. Разработан немецкой компанией Crytek.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/8/8d/CryEngine_Nex-Gen%284th_Generation%29.png',
      'https://upload.wikimedia.org/wikipedia/ru/9/93/CryEngine3_logo.jpg',
      'https://haieng.com/wp-content/uploads/2017/10/test-image-500x500.jpg'
    ],
    features: [
      Feature(
        title: 'Фотореалистичная графика',
        description: 'Поддержка передовых технологий рендеринга и реалистичного освещения',
      ),
      Feature(
        title: 'Поддержка масштабируемости',
        description: 'Возможность создания игр от мобильных до AAA-класса',
      ),
      Feature(
        title: 'Мощный редактор уровней',
        description: 'Инструменты для создания детализированных игровых миров',
      ),
      Feature(
        title: 'Интеграция физики и аудио',
        description: 'Реалистичные эффекты физики и объемное звуковое сопровождение',
      ),
    ],
  ),
  GameEngine(
    name: 'GameMaker Studio',
    description: 'Игровой движок, ориентированный на 2D-разработку, с упором на простоту использования и быстрое создание прототипов.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/GameMaker_Logo.svg/1920px-GameMaker_Logo.svg.png',
      'https://upload.wikimedia.org/wikipedia/commons/2/2e/GameMaker-Studio-Logo1.jpg',
      'https://haieng.com/wp-content/uploads/2017/10/test-image-500x500.jpg'
    ],
    features: [
      Feature(
        title: 'Простой интерфейс',
        description: 'Интуитивно понятный редактор для быстрого старта разработки',
      ),
      Feature(
        title: 'Язык GML',
        description: 'Простой скриптовый язык для создания логики игр',
      ),
      Feature(
        title: 'Поддержка 2D-графики',
        description: 'Оптимизирован для разработки 2D-игр и анимаций',
      ),
      Feature(
        title: 'Экспорт на множество платформ',
        description: 'Возможность публикации игр на Windows, macOS, мобильных ОС и веб',
      ),
    ],
  ),
  GameEngine(
    name: 'Construct',
    description: 'Игровой движок, основанный на событиях, не требующий знания программирования. Идеален для начинающих разработчиков.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Construct_3_Logo.svg/800px-Construct_3_Logo.svg.png',
      'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Construct_2_logo.png/250px-Construct_2_logo.png',
      'https://haieng.com/wp-content/uploads/2017/10/test-image-500x500.jpg'
    ],
    features: [
      Feature(
        title: 'Разработка без кода',
        description: 'Мощная система событий для создания логики без программирования',
      ),
      Feature(
        title: 'Поддержка HTML5',
        description: 'Экспорт игр в формат HTML5 для запуска в браузерах',
      ),
      Feature(
        title: 'Быстрое прототипирование',
        description: 'Интуитивный интерфейс и инструменты для быстрой сборки игр',
      ),
      Feature(
        title: 'Многоплатформенность',
        description: 'Поддержка публикации на различные устройства и платформы',
      ),
    ],
  ),
  GameEngine(
    name: 'Source',
    description: 'Игровой движок, разработанный Valve Corporation, известный по играм Half-Life 2, Counter-Strike: Source и другим.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Source_engine_logo_and_wordmark.svg/1920px-Source_engine_logo_and_wordmark.svg.png',
      'https://www.sourcemodding.com/img/history/source2/source_engine2_logo.webp',
      'https://haieng.com/wp-content/uploads/2017/10/test-image-500x500.jpg'
    ],
    features: [
      Feature(
        title: 'Поддержка моддинга',
        description: 'Позволяет сообществу создавать пользовательский контент и модификации',
      ),
      Feature(
        title: 'Инновационная физика',
        description: 'Использование Havok Physics для реалистичного взаимодействия объектов',
      ),
      Feature(
        title: 'Передовая графика на момент релиза',
        description: 'Поддержка освещения, теней и эффектов постобработки',
      ),
      Feature(
        title: 'Расширяемость',
        description: 'Возможность кастомизации движка под нужды игры и пользователей',
      ),
    ],
  ),
];