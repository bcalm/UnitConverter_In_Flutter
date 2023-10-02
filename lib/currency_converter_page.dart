import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {

  @override
  CurrencyConverterPageState createState() => CurrencyConverterPageState();
}

class CurrencyConverterPageState extends State<CurrencyConverterPage> {
  TextEditingController usdController = TextEditingController();
  TextEditingController inrController = TextEditingController();

  void convertUSDToINR(double usdValue) {
    double inrValue = usdValue * 80;
    inrController.text = inrValue.toStringAsFixed(2);
  }

  void convertINRToUSD(double inrValue) {
    double usdValue = inrValue / 80;
    usdController.text = usdValue.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'USD'),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  double usdValue = double.tryParse(value) ?? 0;
                  convertUSDToINR(usdValue);
                } else {
                  inrController.text = '';
                }
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: inrController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'INR'),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  double inrValue = double.tryParse(value) ?? 0;
                  convertINRToUSD(inrValue);
                } else {
                  usdController.text = '';
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
    usdController.dispose();
    inrController.dispose();
    super.dispose();
  }
}