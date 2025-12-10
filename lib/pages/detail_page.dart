import 'package:flutter/material.dart';
import '../models/game_engine.dart' as app_model;
import '../models/feature.dart' as app_model;

class DetailPage extends StatelessWidget {
  final app_model.GameEngineModel engine;
  final app_model.FeatureModel? selectedFeature;

  const DetailPage({
    super.key,
    required this.engine,
    this.selectedFeature,
  });

  @override
  Widget build(BuildContext context) {
    // Если передана конкретная особенность, показываем ее, иначе первую
    final feature = selectedFeature ?? engine.features.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детализация'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ПУНКТ N (название особенности)
            Center(
              child: Text(
                'ПУНКТ ${engine.features.indexOf(feature) + 1}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Картинка (используем первую картинку движка)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  engine.imageUrls.isNotEmpty ? engine.imageUrls[0] : 'https://via.placeholder.com/300',
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
            ),
            const SizedBox(height: 20),

            // Название особенности
            Text(
              feature.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Описание пункта N
            Text(
              feature.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Информация об авторе
            Card(
              color: Colors.blue[50],
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Expanded(
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
      ),
    );
  }
}