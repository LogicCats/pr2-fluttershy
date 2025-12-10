// Переименуем модель приложения, чтобы избежать конфликта с Drift
import 'feature.dart';

class GameEngineModel {
  final int? id;
  final String name;
  final String description;
  final List<String> imageUrls;
  final List<FeatureModel> features;

  GameEngineModel({
    this.id,
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.features,
  });

  // Конвертация из сущности базы данных
  factory GameEngineModel.fromEntity({
    required int id,
    required String name,
    required String description,
    required List<String> images,
    required List<FeatureModel> features,
  }) {
    return GameEngineModel(
      id: id,
      name: name,
      description: description,
      imageUrls: images,
      features: features,
    );
  }

  // Конвертация в Map для JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrls': imageUrls,
      'features': features.map((f) => f.toJson()).toList(),
    };
  }

  // Копирование с изменениями
  GameEngineModel copyWith({
    int? id,
    String? name,
    String? description,
    List<String>? imageUrls,
    List<FeatureModel>? features,
  }) {
    return GameEngineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      features: features ?? this.features,
    );
  }
}