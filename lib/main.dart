import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'models/game_engine.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: AppRoutes.loading,
      routes: {
        AppRoutes.loading: (context) => const LoadingPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.register: (context) => const RegisterPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.profile: (context) => const ProfilePage(),
        // DetailPage убран из статических маршрутов, так как требует параметры
      },
      onGenerateRoute: (settings) {
        // Обрабатываем маршрут detail с параметрами
        if (settings.name == AppRoutes.detail) {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args != null && args.containsKey('engine')) {
            return MaterialPageRoute(
              builder: (context) => DetailPage(
                engine: args['engine'] as GameEngine,
                selectedFeature: args['selectedFeature'] as Feature?,
              ),
            );
          }
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}