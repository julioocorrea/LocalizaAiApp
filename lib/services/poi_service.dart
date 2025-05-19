import '../models/poi.dart';
import 'package:uuid/uuid.dart';

class POIService {
  final List<PointOfInterest> _points = [];

  List<PointOfInterest> getAll() => _points;

  void addPoint(String name, String description, double lat, double long) {
    final id = Uuid().v4();
    _points.add(PointOfInterest(
      id: id,
      name: name,
      description: description,
      latitude: lat,
      longitude: long,
    ));
  }

  void removePoint(String id) {
    _points.removeWhere((p) => p.id == id);
  }

  PointOfInterest? getById(String id) {
    return _points.firstWhere((p) => p.id == id, orElse: () => throw Exception('Ponto não encontrado'));
  }
}
