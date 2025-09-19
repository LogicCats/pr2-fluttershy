import 'package:flutter/material.dart';
import 'models/game_engine.dart';
import 'widgets/engine_tab.dart';

void main() {
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
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const GameEnginesScreen(),
      debugShowCheckedModeBanner: false,
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