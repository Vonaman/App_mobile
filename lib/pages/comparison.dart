import 'package:flutter/material.dart';
import '../components/custom_button.dart';

class ComparisonPage extends StatelessWidget {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Données des deux chaises
    final chaise1 = {
      'name': 'Chaise Ergonomique Premium',
      'price': 299,
      'features': [
        'Soutien lombaire ajustable',
        'Accoudoirs ergonomiques',
        'Siège en mesh respirant',
        'Roulettes silencieuses',
        'Hauteur ajustable (15cm)',
        'Garantie 5 ans',
      ],
    };

    final chaise2 = {
      'name': 'Chaise Gaming XXL',
      'price': 399,
      'features': [
        'Design racing agressif',
        'Coussin cervical inclus',
        'Accoudoirs 3D réglables',
        'Inclinaison 180°',
        'Repose-pieds rétractable',
        'Support 200 kg',
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comparaison de Chaises',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber[50]!, Colors.orange[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chaise 1
              Expanded(child: _buildChairCard(chaise1)),
              const SizedBox(width: 16),
              // Chaise 2
              Expanded(child: _buildChairCard(chaise2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChairCard(Map<String, dynamic> chair) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Icône de chaise
            const Text('🪑', style: TextStyle(fontSize: 50)),
            const SizedBox(height: 12),
            // Nom de la chaise
            Text(
              chair['name'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            const SizedBox(height: 16),
            // Prix
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${chair['price']}€',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Titre des features
            Text(
              'Caractéristiques',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown[700],
              ),
            ),
            const SizedBox(height: 12),
            // Liste des features
            ...List.generate(
              chair['features'].length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green[600],
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        chair['features'][index],
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Bouton d'action
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Voir détails',
                onPressed: () {},
                borderRadius: 8,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
