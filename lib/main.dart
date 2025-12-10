import 'package:flutter/material.dart';
import 'di/di.dart';
import 'data/database/database.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация DI
  configureDependencies();

  // Инициализация базы данных
  final database = getIt<AppDatabase>();

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.loading,
      routes: {
        AppRoutes.loading: (context) => const LoadingPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.register: (context) => const RegisterPage(),
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.profile: (context) => const ProfilePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.detail) {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args != null && args.containsKey('engine')) {
            return MaterialPageRoute(
              builder: (context) => DetailPage(
                engine: args['engine'],
                selectedFeature: args['selectedFeature'],
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