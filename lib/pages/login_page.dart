import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../routes.dart';
import '../widgets/text_field.dart';
import '../bloc/theme/theme_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Введите корректный email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }
    if (value.length < 6) {
      return 'Пароль должен содержать не менее 6 символов';
    }
    final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[+\-_]).+$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Пароль должен содержать буквы, цифры и символы (+, _, -)';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        // Кнопка переключения темы в AppBar
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return IconButton(
                icon: Icon(
                  themeState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Theme.of(context).appBarTheme.foregroundColor,
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
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Вход',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode,
                  validator: _emailValidator,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Пароль',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  focusNode: _passwordFocusNode,
                  validator: _passwordValidator,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Войти',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  child: const Text(
                    'Нет аккаунта? Зарегистрируйтесь',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 40),

                // Альтернативный переключатель темы
                Card(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Настройки темы',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                        const SizedBox(height: 10),
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, themeState) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      context.read<ThemeCubit>().setTheme(false);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: !themeState.isDarkMode
                                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                                          : Colors.transparent,
                                      side: BorderSide(
                                        color: !themeState.isDarkMode
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.light_mode),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Светлая',
                                          style: TextStyle(
                                            color: !themeState.isDarkMode
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context).textTheme.bodyLarge?.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      context.read<ThemeCubit>().setTheme(true);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: themeState.isDarkMode
                                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                                          : Colors.transparent,
                                      side: BorderSide(
                                        color: themeState.isDarkMode
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.dark_mode),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Темная',
                                          style: TextStyle(
                                            color: themeState.isDarkMode
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context).textTheme.bodyLarge?.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Плавающая кнопка для переключения темы
      floatingActionButton: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return FloatingActionButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            tooltip: 'Переключить тему',
            child: Icon(
              themeState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
          );
        },
      ),
    );
  }
}