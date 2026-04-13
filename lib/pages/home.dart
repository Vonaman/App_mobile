import 'package:flutter/material.dart';
import 'comparison.dart';
import '../components/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chaise Compare',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Serif',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.compare, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber[50]!, Colors.orange[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Message de bienvenue
            Text(
              'Bienvenue sur',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Chaise Compare',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.amber[800],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Découvrez et comparez les meilleures chaises du marché',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 50),
            // Bouton d'entrée
            CustomButton(
              label: 'Commencer',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ComparisonPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
