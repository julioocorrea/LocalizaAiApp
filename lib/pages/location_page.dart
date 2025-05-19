import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final LocationService _locationService = LocationService();
  Position? _position;
  String? _error;

  void _getLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      setState(() {
        _position = position;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _position = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text('Minha Localização')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.gps_fixed, size: 80, color: accentColor),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: Icon(Icons.location_searching),
                label: Text('Obter localização'),
                onPressed: _getLocation,
              ),
              const SizedBox(height: 24),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _position != null
                    ? Card(
                        key: ValueKey(_position),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Latitude: ${_position!.latitude.toStringAsFixed(6)}',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Longitude: ${_position!.longitude.toStringAsFixed(6)}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      )
                    : _error != null
                        ? Text(
                            'Erro: $_error',
                            key: ValueKey(_error),
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox.shrink(), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}