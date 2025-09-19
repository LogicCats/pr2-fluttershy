import 'package:flutter/material.dart';
import '../models/game_engine.dart';

class EngineTab extends StatefulWidget {
  final GameEngine engine;

  const EngineTab({super.key, required this.engine});

  @override
  State<EngineTab> createState() => _EngineTabState();
}

class _EngineTabState extends State<EngineTab> {
  int _currentImageIndex = 0;

  void _cycleImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % widget.engine.imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.engine.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            widget.engine.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          // Новый макет: изображение слева, особенности справа
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                // На широких экранах: изображение слева, список справа
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildImage(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: _buildFeatures(),
                    ),
                  ],
                );
              } else {
                // На узких экранах: изображение сверху, список снизу
                return Column(
                  children: [
                    _buildImage(),
                    const SizedBox(height: 20),
                    _buildFeatures(),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 20),
          // Блок с иконкой и информацией об авторе
          _buildAuthorInfo(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onTap: _cycleImage,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Image.network(
          widget.engine.imageUrls[_currentImageIndex],
          height: 200,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.error, size: 50, color: Colors.red),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatures() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Основные особенности:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...widget.engine.features.asMap().entries.map((entry) {
            final index = entry.key;
            final feature = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(feature)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          // Иконка геймпада
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Video-Game-Controller-Icon-IDV-green-industry.svg/800px-Video-Game-Controller-Icon-IDV-green-industry.svg.png',
            width: 40,
            height: 40,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.sports_esports, size: 40, color: Colors.blue);
            },
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Козеев В.А. ИКБО-32-22',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}