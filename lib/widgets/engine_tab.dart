import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
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
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Козеев В.А. ИКБО-32-22',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ),
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
        child: CachedNetworkImage(
          imageUrl: widget.engine.imageUrls[_currentImageIndex],
          height: 200,
          fit: BoxFit.contain,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error, size: 50, color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatures() {
    return Column(
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
                Text('${index + 1}. '),
                Expanded(child: Text(feature)),
              ],
            ),
          );
        }),
      ],
    );
  }
}