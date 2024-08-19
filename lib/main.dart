import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentValue = "";
  String _operator = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _currentValue = "";
        _output = "0";
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = "";
      } else if (value == "=") {
        _num2 = double.tryParse(_currentValue) ?? 0.0;
        if (_operator == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operator == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operator == "*") {
          _output = (_num1 * _num2).toString();
        } else if (_operator == "/") {
          _output = (_num1 / _num2).toString();
        }
        _currentValue = _output;
        _num1 = double.tryParse(_output) ?? 0.0;
        _operator = "";
      } else if (["+", "-", "*", "/"].contains(value)) {
        _num1 = double.tryParse(_currentValue) ?? 0.0;
        _operator = value;
        _currentValue = "";
      } else {
        _currentValue += value;
        _output = _currentValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _output,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("C"),
                    _buildButton("0"),
                    _buildButton("="),
                    _buildButton("+"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
