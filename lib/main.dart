import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/profile_page.dart';
import 'models/game_engine.dart';
import 'widgets/engine_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализируем SharedPreferences
  await SharedPreferences.getInstance();

  runApp(const GameEnginesApp());
}

class GameEnginesApp extends StatelessWidget {
  const GameEnginesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Игровые движки',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
        '/game_engines': (context) => const GameEnginesScreen(),
      },
    );
  }
}

class GameEnginesScreen extends StatefulWidget {
  const GameEnginesScreen({super.key});

  @override
  State<GameEnginesScreen> createState() => _GameEnginesScreenState();
}

class _GameEnginesScreenState extends State<GameEnginesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: gameEngines.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ИГРОВЫЕ ДВИЖКИ'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: gameEngines.map((engine) => Tab(text: engine.name)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: gameEngines.map((engine) => EngineTab(engine: engine)).toList(),
      ),
    );
  }
}