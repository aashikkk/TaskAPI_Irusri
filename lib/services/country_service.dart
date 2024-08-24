import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../network/rest_client.dart'; // Import the RestClient class
import '../model/country.dart'; // Import the Country model

class CountryService with ChangeNotifier {
  List<Country> _countries = [];
  bool _isLoading = true;
  String _errorMessage = '';

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch countries from the API
  Future<void> fetchCountries() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final dio = Dio();
      final client = RestClient(dio);
      _countries = await client.getEuropeanCountries();
    } on DioException catch (dioException) {
      // Specific error handling for Dio errors
      if (dioException.type == DioExceptionType.connectionTimeout) {
        _errorMessage = "Connection Timeout. Please try again later.";
        print("Error: $_errorMessage"); // Print to Logcat
      } else if (dioException.type == DioExceptionType.badResponse) {
        _errorMessage =
            "Received invalid status code: ${dioException.response?.statusCode}";
        print("Error: $_errorMessage"); // Print to Logcat
      } else {
        _errorMessage = "Failed to fetch countries: ${dioException.message}";
        print("Error: $_errorMessage"); // Print to Logcat
      }
    } catch (e) {
      _errorMessage = "Failed to fetch countries.";
      print("Error: $_errorMessage"); // Print to Logcat
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Sort countries by the selected criteria
  void sortCountries(SortCriteria criteria) {
    switch (criteria) {
      case SortCriteria.Name:
        _countries.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortCriteria.Capital:
        _countries.sort((a, b) => a.capital.compareTo(b.capital));
        break;
      case SortCriteria.Population:
        _countries.sort((a, b) => a.population.compareTo(b.population));
        break;
    }
    notifyListeners();
  }
}

enum SortCriteria { Name, Capital, Population }
