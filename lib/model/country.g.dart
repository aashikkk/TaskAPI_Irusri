// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      capital: json['capital'] as String,
      region: json['region'] as String,
      population: (json['population'] as num).toInt(),
      languages: Map<String, String>.from(json['languages'] as Map),
      flags: json['flags'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'capital': instance.capital,
      'region': instance.region,
      'population': instance.population,
      'languages': instance.languages,
      'flags': instance.flags,
    };
