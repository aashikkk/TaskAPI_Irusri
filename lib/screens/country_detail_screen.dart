import 'package:flutter/material.dart';
import '../model/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(country.flags['png']),
            const SizedBox(height: 16),
            Text('Capital: ${country.capital}'),
            Text('Population: ${country.population}'),
            Text('Languages: ${country.languages.values.join(", ")}'),
          ],
        ),
      ),
    );
  }
}
