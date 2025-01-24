import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key});

  @override
  SearchDialogState createState() => SearchDialogState();
}

class SearchDialogState extends State<SearchDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedYear;
  String? _selectedCategory;
  String? _movieName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pesquisar Filmes'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome do Filme',
                  prefixIcon:
                      const Icon(FontAwesomeIcons.film, color: Colors.orange),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _movieName = value;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Ano',
                  prefixIcon: const Icon(FontAwesomeIcons.solidCalendarDays,
                      color: Colors.orange),
                  border: const OutlineInputBorder(),
                ),
                items: <String>[
                  '2025',
                  '2024',
                  '2023',
                  '2022',
                  '2021',
                  '2020',
                  '2019',
                  '2018',
                  '2017'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Categoria',
                  prefixIcon:
                      const Icon(FontAwesomeIcons.list, color: Colors.orange),
                  border: const OutlineInputBorder(),
                ),
                items: <String>[
                  'Action',
                  'Adventure',
                  'Animation',
                  'Comedy',
                  'Crime',
                  'Documentary',
                  'Drama',
                  'Family',
                  'Fantasy',
                  'History',
                  'Horror',
                  'Music',
                  'Mystery',
                  'Romance',
                  'Science Fiction',
                  'Thriller',
                  'War',
                  'Western'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Cor de destaque
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop({
                'name': _movieName,
                'year': _selectedYear,
                'category': _selectedCategory,
              });
            }
          },
          child: const Text('Pesquisar'),
        ),
      ],
    );
  }
}
