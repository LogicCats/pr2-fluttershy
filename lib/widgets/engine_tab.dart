import 'package:flutter/material.dart';
import '../models/game_engine.dart';
import '../routes.dart';

class EngineTab extends StatefulWidget {
  final GameEngine engine;

  const EngineTab({super.key, required this.engine});

  @override
  State<EngineTab> createState() => _EngineTabState();
}

class _EngineTabState extends State<EngineTab> {
  void _showFeatureSnackBar(String featureTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Выбрано: $featureTitle'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navigateToDetail(Feature feature) {
    Navigator.pushNamed(
      context,
      AppRoutes.detail,
      arguments: {
        'engine': widget.engine,
        'selectedFeature': feature,
      },
    );
  }

  Widget _buildFeatureCard(Feature feature) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 2,
      child: ListTile(
        leading: Text(
          feature.leadingIcon,
          style: const TextStyle(fontSize: 20),
        ),
        title: Text(
          feature.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(feature.description),
        trailing: Text(
          feature.trailingIcon,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => _navigateToDetail(feature),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWideScreen = constraints.maxWidth > 600;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: isWideScreen ? 20.0 : 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок приложения
              const Center(
                child: Text(
                  'ИГРОВЫЕ ДВИЖКИ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Название ПО
              Text(
                widget.engine.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Описание ПО
              Text(
                widget.engine.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // ГОРИЗОНТАЛЬНЫЙ LISTVIEW С ИЗОБРАЖЕНИЯМИ
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.engine.imageUrls.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 300,
                        margin: const EdgeInsets.only(right: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            widget.engine.imageUrls[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error, size: 40, color: Colors.red),
                                      SizedBox(height: 8),
                                      Text(
                                        'Ошибка загрузки',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Заголовок для списка особенностей
              const Text(
                'Основные особенности:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // АДАПТИВНЫЙ СПИСОК ОСОБЕННОСТЕЙ
              if (isWideScreen)
              // GridView для широких экранов
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3,
                  ),
                  itemCount: widget.engine.features.length,
                  itemBuilder: (context, index) {
                    return _buildFeatureCard(widget.engine.features[index]);
                  },
                )
              else
              // ListView для мобильных устройств
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.engine.features.length,
                  itemBuilder: (context, index) {
                    return _buildFeatureCard(widget.engine.features[index]);
                  },
                ),
              const SizedBox(height: 20),

              // Информация об авторе
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Video-Game-Controller-Icon-IDV-green-industry.svg/800px-Video-Game-Controller-Icon-IDV-green-industry.svg.png',
                        width: 30,
                        height: 30,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.sports_esports, size: 30, color: Colors.blue);
                        },
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Козеев В.А. ИКБО-32-22',
                          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}