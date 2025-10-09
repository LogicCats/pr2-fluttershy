import 'package:flutter/material.dart';
import '../models/game_engine.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
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

          // ГОРИЗОНТАЛЬНЫЙ LISTVIEW С ИЗОБРАЖЕНИЯМИ СО СКРУГЛЕННЫМИ УГЛАМИ
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              height: 200, // Высота для горизонтального списка
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

          // Вертикальный ListView с карточками особенностей
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.engine.features.length,
            itemBuilder: (context, index) {
              final feature = widget.engine.features[index];
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
                  onTap: () => _showFeatureSnackBar(feature.title),
                ),
              );
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
  }
}