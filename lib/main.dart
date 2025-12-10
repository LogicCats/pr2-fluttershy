import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/di.dart';
import 'data/database/database.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';
import 'routes.dart';
import 'bloc/theme/theme_cubit.dart';

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

  // Кастомная светлая тема
  ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Кастомизация AppBar для светлой темы
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Кастомизация плавающей кнопки действия
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      // Кастомизация кнопок
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Кастомизация текстовых полей
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  // Кастомная темная тема
  ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue[800],
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Кастомизация AppBar для темной темы
      appBarTheme: AppBarTheme(
        color: Colors.grey[900],
        foregroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Кастомизация плавающей кнопки действия
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      // Кастомизация кнопок
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[800],
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Фон
      scaffoldBackgroundColor: Colors.grey[900],

      // Диалоги
      dialogBackgroundColor: Colors.grey[800],

      // Кастомизация текстовых полей
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[800],
      ),

      // Кастомизация разделителей
      dividerTheme: DividerThemeData(
        color: Colors.grey[700],
      ),

      // Кастомизация иконок
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => getIt<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Игровые движки',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
        },
      ),
    );
  }
}