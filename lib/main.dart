import 'package:flutter/material.dart';
import 'package:converter_app/unit_converter_page.dart';
import 'package:converter_app/currency_converter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/unit_converter': (context) => UnitConverterPage(),
        '/currency_converter': (context) => CurrencyConverterPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/unit_converter');
              },
              child: Text('Unit Converter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/currency_converter');
              },
              child: Text('Currency Converter'),
            ),
          ],
        ),
      ),
    );
  }
}
