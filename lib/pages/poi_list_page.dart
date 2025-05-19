import 'package:flutter/material.dart';
import '../services/poi_service.dart';
import '../models/poi.dart';
import 'poi_add_page.dart';
import 'poi_detail_page.dart';

class POIListPage extends StatefulWidget {
  final POIService poiService;

  POIListPage({required this.poiService});

  @override
  State<POIListPage> createState() => _POIListPageState();
}

class _POIListPageState extends State<POIListPage> {
  void _navigateToAddPOI() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => POIAddPage(poiService: widget.poiService),
      ),
    );
    setState(() {});
  }

  void _navigateToDetail(PointOfInterest poi) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => POIDetailPage(poi: poi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final points = widget.poiService.getAll();

    return Scaffold(
      appBar: AppBar(title: Text('Pontos de Interesse')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: points.isEmpty
            ? Center(
                child: Text(
                  'Nenhum ponto cadastrado ainda.',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              )
            : ListView.separated(
                itemCount: points.length,
                separatorBuilder: (_, __) => SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final poi = points[index];
                  return GestureDetector(
                    onTap: () => _navigateToDetail(poi),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.place, color: Theme.of(context).primaryColor, size: 40),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(poi.name,
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text(poi.description,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey[700])),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () {
                                setState(() {
                                  widget.poiService.removePoint(poi.id);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddPOI,
        label: Text(
          'Adicionar',
          style: TextStyle(color: Colors.white), 
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white, 
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
