import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_api_irusri/screens/country_list_screen.dart';
import 'services/country_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CountryService()..fetchCountries()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'European Countries',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true),
      home: CountryListScreen(),
    );
  }
}

// class CountryListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('European Countries'),
//         actions: [
//           DropdownButton<SortCriteria>(
//             onChanged: (SortCriteria? newValue) {
//               Provider.of<CountryService>(context, listen: false)
//                   .sortCountries(newValue!);
//             },
//             items: SortCriteria.values.map((SortCriteria criteria) {
//               return DropdownMenuItem<SortCriteria>(
//                 value: criteria,
//                 child: Text(criteria.toString().split('.').last),
//               );
//             }).toList(),
//           )
//         ],
//       ),
//       body: Consumer<CountryService>(
//         builder: (context, service, child) {
//           if (service.isLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (service.errorMessage.isNotEmpty) {
//             return Center(child: Text(service.errorMessage));
//           } else {
//             return ListView.builder(
//               itemCount: service.countries.length,
//               itemBuilder: (context, index) {
//                 final country = service.countries[index];
//                 return ListTile(
//                   leading: Image.network(country.flags['png']),
//                   title: Text(country.name),
//                   subtitle: Text(country.capital),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             CountryDetailScreen(country: country),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class CountryDetailScreen extends StatelessWidget {
//   final Country country;
//
//   CountryDetailScreen({required this.country});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(country.name)),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(country.flags['png']),
//             SizedBox(height: 16),
//             Text('Capital: ${country.capital}'),
//             Text('Population: ${country.population}'),
//             Text('Languages: ${country.languages.values.join(", ")}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
