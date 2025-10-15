import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb, Uint8List;

import '../routes.dart';

class ProfilePage extends StatefulWidget {
  final String initialName;
  final String initialEmail;

  const ProfilePage({
    Key? key,
    this.initialName = 'Иван Иванов',
    this.initialEmail = 'ivan@example.com',
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  Uint8List? _webImageBytes; // Для хранения изображения в веб-режиме
  bool _isEditing = false;

  // Контроллеры для полей ввода
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  // Ключи для SharedPreferences
  static const String _nameKey = 'name';
  static const String _emailKey = 'email';
  static const String _phoneKey = 'phone';
  static const String _addressKey = 'address';
  static const String _birthDateKey = 'birthDate';
  static const String _imageKey = 'image';

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() async {
    await _loadProfileData();
    await _loadProfileImage();
  }

  // Загрузка данных профиля из SharedPreferences
  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString(_nameKey) ?? widget.initialName;
      _emailController.text = prefs.getString(_emailKey) ?? widget.initialEmail;
      _phoneController.text = prefs.getString(_phoneKey) ?? '+7 (999) 123-45-67';
      _addressController.text = prefs.getString(_addressKey) ?? 'г. Москва, ул. Примерная, д. 1';
      _birthDateController.text = prefs.getString(_birthDateKey) ?? '15.05.1990';
    });
  }

  // Сохранение данных профиля в SharedPreferences
  Future<void> _saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, _nameController.text);
    await prefs.setString(_emailKey, _emailController.text);
    await prefs.setString(_phoneKey, _phoneController.text);
    await prefs.setString(_addressKey, _addressController.text);
    await prefs.setString(_birthDateKey, _birthDateController.text);
  }

  // Загрузка изображения
  Future<void> _loadProfileImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (kIsWeb) {
        // Для веб-платформы: загружаем base64 строку
        final imageBase64 = prefs.getString(_imageKey);
        if (imageBase64 != null && imageBase64.isNotEmpty) {
          setState(() {
            _webImageBytes = base64.decode(imageBase64);
          });
        }
      } else {
        // Для мобильных платформ: загружаем из файловой системы
        final imagePath = prefs.getString(_imageKey);
        if (imagePath != null && await File(imagePath).exists()) {
          setState(() {
            _imageFile = File(imagePath);
          });
        }
      }
    } catch (e) {
      print('Ошибка загрузки изображения: $e');
    }
  }

  // Сохранение изображения
  Future<void> _saveProfileImage(String imageData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, imageData);
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        if (kIsWeb) {
          // Для веб-платформы: сохраняем как base64
          final bytes = await pickedFile.readAsBytes();
          final base64String = base64.encode(bytes);
          await _saveProfileImage(base64String);

          setState(() {
            _webImageBytes = bytes;
          });
        } else {
          // Для мобильных платформ: сохраняем в файловую систему
          final appDir = await getApplicationDocumentsDirectory();
          final fileName = 'profile_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
          final savedImage = await File(pickedFile.path).copy('${appDir.path}/$fileName');

          await _saveProfileImage(savedImage.path);

          setState(() {
            _imageFile = savedImage;
          });
        }

        _showSnackBar('Фотография сохранена');
      }
    } catch (e) {
      _showSnackBar('Ошибка при выборе изображения: $e');
    }
  }

  // Получение изображения для отображения
  ImageProvider? get _profileImage {
    if (kIsWeb) {
      return _webImageBytes != null
          ? MemoryImage(_webImageBytes!)
          : null;
    } else {
      return _imageFile != null
          ? FileImage(_imageFile!)
          : null;
    }
  }

  void _toggleEditing() {
    if (_isEditing) {
      // Сохраняем изменения
      _saveChanges();
    }
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    _saveProfileData();
    _showSnackBar('Изменения сохранены');
  }

  void _cancelEditing() {
    setState(() {
      _isEditing = false;
      // Загружаем сохраненные данные
      _loadProfileData();
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _selectDate() async {
    // Парсим текущую дату или используем дефолтную
    DateTime initialDate = DateTime(1990, 5, 15);
    try {
      final parts = _birthDateController.text.split('.');
      if (parts.length == 3) {
        initialDate = DateTime(
          int.parse(parts[2]),
          int.parse(parts[1]),
          int.parse(parts[0]),
        );
      }
    } catch (e) {
      print('Ошибка парсинга даты: $e');
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formattedDate = "${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}";
      _birthDateController.text = formattedDate;
    }
  }

  Widget _buildEditableField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required bool isEditing,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 16),
          Expanded(
            child: isEditing
                ? TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                labelStyle: const TextStyle(color: Colors.grey),
              ),
              onTap: onTap,
              readOnly: onTap != null,
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  controller.text.isEmpty ? 'Не указано' : controller.text,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _cancelEditing,
              tooltip: 'Отменить',
            ),
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: _toggleEditing,
            tooltip: _isEditing ? 'Сохранить' : 'Редактировать',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // В кнопке выхода
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            // Аватарка с возможностью изменения
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImage,
                    backgroundColor: Colors.blue[100],
                    child: _profileImage == null
                        ? const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.blue,
                    )
                        : null,
                  ),
                  if (_isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                          onPressed: _pickImage,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Поле ФИО
            _buildEditableField(
              label: 'ФИО',
              icon: Icons.person,
              controller: _nameController,
              isEditing: _isEditing,
            ),

            // Поле Email
            _buildEditableField(
              label: 'Email',
              icon: Icons.email,
              controller: _emailController,
              isEditing: _isEditing,
              keyboardType: TextInputType.emailAddress,
            ),

            // Поле Телефон
            _buildEditableField(
              label: 'Телефон',
              icon: Icons.phone,
              controller: _phoneController,
              isEditing: _isEditing,
              keyboardType: TextInputType.phone,
            ),

            // Поле Адрес
            _buildEditableField(
              label: 'Адрес',
              icon: Icons.location_on,
              controller: _addressController,
              isEditing: _isEditing,
            ),

            // Поле Дата рождения
            _buildEditableField(
              label: 'Дата рождения',
              icon: Icons.cake,
              controller: _birthDateController,
              isEditing: _isEditing,
              onTap: _isEditing ? _selectDate : null,
            ),

            const SizedBox(height: 30),

            if (_isEditing)
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _toggleEditing,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Сохранить изменения',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: _cancelEditing,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Отменить',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }
}