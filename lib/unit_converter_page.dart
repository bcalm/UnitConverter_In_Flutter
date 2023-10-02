import 'package:flutter/material.dart';

class UnitConverterPage extends StatefulWidget {
  @override
  UnitConverterPageState createState() => UnitConverterPageState();
}

class UnitConverterPageState extends State<UnitConverterPage> {
  TextEditingController kmController = TextEditingController();
  TextEditingController milesController = TextEditingController();

  void convertKMToMiles(double kmValue) {
    double milesValue = kmValue * 0.621371;
    milesController.text = milesValue.toStringAsFixed(2);
  }

  void convertMilesToKM(double milesValue) {
    double kmValue = milesValue / 0.621371;
    kmController.text = kmValue.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: kmController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kilometers'),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  double kmValue = double.tryParse(value) ?? 0;
                  convertKMToMiles(kmValue);
                } else {
                  milesController.text = '';
                }
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: milesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Miles'),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  double milesValue = double.tryParse(value) ?? 0;
                  convertMilesToKM(milesValue);
                } else {
                  kmController.text = '';
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    kmController.dispose();
    milesController.dispose();
    super.dispose();
  }
}
