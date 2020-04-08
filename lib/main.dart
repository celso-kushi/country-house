import 'package:countryhouse/screens/allcountries.dart';
import 'package:countryhouse/screens/country-map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: AllCountries(),
      routes: {
        CountryMap.routeName: (ctx) => CountryMap()
      },
    ),
  );
}



