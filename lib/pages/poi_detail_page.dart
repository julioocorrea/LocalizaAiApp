import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/poi.dart';
import '../services/location_service.dart';

class POIDetailPage extends StatefulWidget {
  final PointOfInterest poi;

  POIDetailPage({required this.poi});

  @override
  State<POIDetailPage> createState() => _POIDetailPageState();
}

class _POIDetailPageState extends State<POIDetailPage> {
  final _locationService = LocationService();
  double? _distance;
  bool _isLoading = false;

  void _calculateDistance() async {
    setState(() {
      _isLoading = true;
    });

    final position = await _locationService.getCurrentLocation();
    final distance = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      widget.poi.latitude,
      widget.poi.longitude,
    );

    setState(() {
      _distance = distance;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text(widget.poi.name)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('📍 ${widget.poi.name}',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: color)),
                    SizedBox(height: 10),
                    Text(widget.poi.description,
                        style: TextStyle(fontSize: 16, color: Colors.black87)),
                    Divider(height: 30),
                    Text('Latitude: ${widget.poi.latitude.toStringAsFixed(6)}',
                        style: TextStyle(fontSize: 16)),
                    Text('Longitude: ${widget.poi.longitude.toStringAsFixed(6)}',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.directions),
                label: Text('Calcular distância até aqui'),
                onPressed: _calculateDistance,
              ),
            ),
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            if (_distance != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    '📏 Distância: ${_distance!.toStringAsFixed(2)} metros',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
