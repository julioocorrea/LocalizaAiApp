import 'package:flutter/material.dart';
import 'location_page.dart';
import 'poi_list_page.dart'; 
import '../services/poi_service.dart'; 

class HomePage extends StatelessWidget {
  final Color accentColor = const Color(0xFF4A90E2);
  final POIService poiService = POIService(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LocalizaAI')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.location_on, size: 100, color: accentColor),
            const SizedBox(height: 30),
            Text(
              'Bem-vindo ao LocalizaAI!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: Icon(Icons.my_location),
              label: Text('Obter minha localização'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.place),
              label: Text('Pontos de Interesse'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => POIListPage(poiService: poiService),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
