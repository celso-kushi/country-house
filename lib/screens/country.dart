import 'package:countryhouse/screens/country-map.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;

  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(country['name']),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Capital'),
              back: CountryDetailCard(detail: country['capital']),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Population'),
              back: CountryDetailCard(detail: country['population'].toString()),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Flag'),
              back: Card(
                elevation: 10,
                color: Colors.white,
                child: Center(
                  child: SvgPicture.network(
                    country['flag'],
                    width: 200,
                  ),
                ),
              ),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Currency'),
              back: CountryDetailCard(detail: country['currencies'][0]['name']),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CountryMap.routeName, arguments: {
                  'name': country['name'],
                  'latlng': country['latlng']
                });
              },
              child: CountryCard(title: 'Show on map'),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String detail;

  const CountryDetailCard({
    Key key,
    this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.amberAccent,
      child: Center(
        child: Text(
          detail,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;

  const CountryCard({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
