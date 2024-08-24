import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  final String name;
  final String capital;
  final String region;
  final int population;
  final Map<String, String> languages;
  final Map<String, dynamic> flags;

  Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.languages,
    required this.flags,
  });

  // From JSON
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  // To JSON (if needed)
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
