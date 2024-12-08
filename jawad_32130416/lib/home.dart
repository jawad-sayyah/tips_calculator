import 'package:flutter/material.dart';

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  final TextEditingController _billController = TextEditingController();
  double _tipPercentage = 10;
  int _numberOfPeople = 1;
  bool _includeTax = false;
  double _totalAmount = 0;
  double _perPersonAmount = 0;

  void _calculate() {
    final double bill = double.tryParse(_billController.text) ?? 0.0;
    final double tax = _includeTax ? bill * 0.05 : 0.0; // Assuming 5% tax
    final double tip = bill * (_tipPercentage / 100);
    _totalAmount = bill + tax + tip;
    _perPersonAmount = _totalAmount / _numberOfPeople;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tip Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _billController,
              decoration: InputDecoration(labelText: 'Enter Bill Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            DropdownButton<double>(
              value: _tipPercentage,
              items: [0,10, 15, 20].map((percentage) {
                return DropdownMenuItem<double>(
                  value: percentage.toDouble(),
                  child: Text('$percentage% Tip'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _tipPercentage = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Number of People:'),
            Row(
              children: List<Widget>.generate(4, (index) {
                return Expanded(
                  child: RadioListTile<int>(
                    title: Text('${index + 1}'),
                    value: index + 1,
                    groupValue: _numberOfPeople,
                    onChanged: (value) {
                      setState(() {
                        _numberOfPeople = value!;
                      });
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              title: Text('Include 5% Tax'),
              value: _includeTax,
              onChanged: (value) {
                setState(() {
                  _includeTax = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Total Amount: \$${_totalAmount.toStringAsFixed(2)}'),
            Text('Amount Per Person: \$${_perPersonAmount.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
