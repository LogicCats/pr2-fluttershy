import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/di.dart';
import '../bloc/game_engine/game_engine_bloc.dart';
import '../bloc/theme/theme_cubit.dart'; // Добавляем импорт
import '../widgets/engine_tab.dart';
import '../routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0;
  late GameEngineBloc _gameEngineBloc;

  @override
  void initState() {
    super.initState();
    _gameEngineBloc = getIt<GameEngineBloc>();
    _gameEngineBloc.add(LoadGameEnginesEvent());
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, AppRoutes.profile);
    }
  }

  void _updateTabController(int length) {
    if (_tabController == null) {
      _tabController = TabController(length: length, vsync: this);
    } else if (_tabController!.length != length) {
      _tabController!.dispose();
      _tabController = TabController(length: length, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameEngineBloc>.value(value: _gameEngineBloc),
      ],
      child: BlocBuilder<GameEngineBloc, GameEngineState>(
        builder: (context, state) {
          if (state is GameEngineLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is GameEngineError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Ошибка'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _gameEngineBloc.add(LoadGameEnginesEvent()),
                      child: const Text('Повторить'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is GameEngineLoaded) {
            final gameEngines = state.engines;
            _updateTabController(gameEngines.length);

            return Scaffold(
              appBar: AppBar(
                title: const Text('ИГРОВЫЕ ДВИЖКИ'),
                centerTitle: true,
                actions: [
                  // Кнопка переключения темы
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      return IconButton(
                        icon: Icon(
                          themeState.isDarkMode
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        tooltip: themeState.isDarkMode
                            ? 'Переключить на светлую тему'
                            : 'Переключить на темную тему',
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.profile);
                    },
                    tooltip: 'Профиль',
                  ),
                ],
                bottom: _tabController != null
                    ? TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: gameEngines.map((engine) => Tab(text: engine.name)).toList(),
                )
                    : null,
              ),
              body: _tabController != null
                  ? TabBarView(
                controller: _tabController,
                children: gameEngines.map((engine) => EngineTab(engine: engine)).toList(),
              )
                  : const Center(child: CircularProgressIndicator()),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Главная',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Профиль',
                  ),
                ],
              ),
            );
          }

          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}