import 'package:flutter/material.dart';
import '../services/poi_service.dart';

class POIAddPage extends StatefulWidget {
  final POIService poiService;

  POIAddPage({required this.poiService});

  @override
  State<POIAddPage> createState() => _POIAddPageState();
}

class _POIAddPageState extends State<POIAddPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _desc = '';
  String _lat = '';
  String _long = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.poiService.addPoint(
        _name,
        _desc,
        double.parse(_lat),
        double.parse(_long),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Ponto')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (val) => _name = val,
                validator: (val) => val!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                onChanged: (val) => _desc = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Latitude'),
                keyboardType: TextInputType.number,
                onChanged: (val) => _lat = val,
                validator: (val) => val!.isEmpty ? 'Informe a latitude' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Longitude'),
                keyboardType: TextInputType.number,
                onChanged: (val) => _long = val,
                validator: (val) => val!.isEmpty ? 'Informe a longitude' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
