import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/country_service.dart';
import '../model/country.dart';
import 'country_detail_screen.dart';

class CountryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('European Countries'),
        actions: [
          DropdownButton<SortCriteria>(
            onChanged: (SortCriteria? newValue) {
              Provider.of<CountryService>(context, listen: false)
                  .sortCountries(newValue!);
            },
            items: SortCriteria.values.map((SortCriteria criteria) {
              return DropdownMenuItem<SortCriteria>(
                value: criteria,
                child: Text(criteria.toString().split('.').last),
              );
            }).toList(),
          )
        ],
      ),
      body: Consumer<CountryService>(
        builder: (context, service, child) {
          if (service.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (service.errorMessage.isNotEmpty) {
            return Center(child: Text(service.errorMessage));
          } else {
            return ListView.builder(
              itemCount: service.countries.length,
              itemBuilder: (context, index) {
                final country = service.countries[index];
                return ListTile(
                  leading: Image.network(country.flags['png']),
                  title: Text(country.name),
                  subtitle: Text(country.capital),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryDetailScreen(country: country),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
