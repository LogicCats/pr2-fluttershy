// Переименуем модель приложения
class FeatureModel {
  final String title;
  final String description;
  final String leadingIcon;
  final String trailingIcon;

  FeatureModel({
    required this.title,
    required this.description,
    this.leadingIcon = '🎮',
    this.trailingIcon = '➡️',
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'leadingIcon': leadingIcon,
      'trailingIcon': trailingIcon,
    };
  }

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      title: json['title'],
      description: json['description'],
      leadingIcon: json['leadingIcon'] ?? '🎮',
      trailingIcon: json['trailingIcon'] ?? '➡️',
    );
  }

  FeatureModel copyWith({
    String? title,
    String? description,
    String? leadingIcon,
    String? trailingIcon,
  }) {
    return FeatureModel(
      title: title ?? this.title,
      description: description ?? this.description,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
    );
  }
}