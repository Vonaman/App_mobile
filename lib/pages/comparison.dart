import 'package:flutter/material.dart';
import '../components/custom_button.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  late String selectedChair1;
  late String selectedChair2;

  final List<Map<String, dynamic>> chaises = [
    {
      'id': '1',
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
    },
    {
      'id': '2',
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
    },
    {
      'id': '3',
      'name': 'Chaise Bureau Classique',
      'price': 179,
      'features': [
        'Design intemporel',
        'Dossier rembourré',
        'Accoudoirs fixes',
        'Roulettes robustes',
        'Hauteur ajustable',
        'Garantie 2 ans',
      ],
    },
    {
      'id': '4',
      'name': 'Chaise Design Moderne',
      'price': 249,
      'features': [
        'Esthétique contemporaine',
        'Assise ergonomique',
        'Pied en acier inoxydable',
        'Confortable longue durée',
        'Facile à nettoyer',
        'Garantie 3 ans',
      ],
    },
    {
      'id': '5',
      'name': 'Chaise Executive Luxe',
      'price': 499,
      'features': [
        'Cuir véritable premium',
        'Soutien complet du dos',
        'Accoudoirs rembourrés',
        'Technologie anti-fatigue',
        'Inclinaison progressive',
        'Garantie 7 ans',
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedChair1 = '1';
    selectedChair2 = '2';
  }

  Map<String, dynamic> getChairById(String id) {
    return chaises.firstWhere((chair) => chair['id'] == id);
  }

  @override
  Widget build(BuildContext context) {
    final chair1 = getChairById(selectedChair1);
    final chair2 = getChairById(selectedChair2);

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
          child: Column(
            children: [
              // Chaise 1 avec sélecteur
              _buildChairSection(chair1, selectedChair1, (value) {
                setState(() => selectedChair1 = value!);
              }),
              const SizedBox(height: 24),
              // Chaise 2 avec sélecteur
              _buildChairSection(chair2, selectedChair2, (value) {
                setState(() => selectedChair2 = value!);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChairSection(
    Map<String, dynamic> chair,
    String selectedId,
    Function(String?) onChanged,
  ) {
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
            // Sélecteur de chaise
            DropdownButton<String>(
              isExpanded: true,
              value: selectedId,
              underline: Container(height: 2, color: Colors.amber[800]),
              onChanged: onChanged,
              items: chaises.map<DropdownMenuItem<String>>((chaise) {
                return DropdownMenuItem<String>(
                  value: chaise['id'] as String,
                  child: Text(
                    chaise['name'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
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
