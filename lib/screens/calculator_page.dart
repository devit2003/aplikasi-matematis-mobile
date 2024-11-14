import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _currentNumber = "";
  String _operation = "";
  double _num1 = 0;
  bool _newNumber = true;

  void _onButtonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _currentNumber = "";
      _operation = "";
      _num1 = 0;
      _newNumber = true;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      _num1 = double.parse(_output);
      _operation = buttonText;
      _newNumber = true;
    } else if (buttonText == "=") {
      double num2 = double.parse(_output);
      if (_operation == "+") {
        _output = (_num1 + num2).toString();
      } else if (_operation == "-") {
        _output = (_num1 - num2).toString();
      } else if (_operation == "×") {
        _output = (_num1 * num2).toString();
      } else if (_operation == "÷") {
        _output = (_num1 / num2).toString();
      }
      _operation = "";
      _newNumber = true;
    } else {
      if (_newNumber) {
        _output = buttonText;
        _newNumber = false;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 8,
            padding: const EdgeInsets.all(20),
            minimumSize: const Size(60, 60),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C5E50),
      appBar: AppBar(
        title: const Text('Kalkulator'),
        backgroundColor: const Color(0xFF1E4D45),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // Row 1
                Row(
                  children: [
                    _buildButton("7", const Color(0xFF1E4D45)),
                    _buildButton("8", const Color(0xFF1E4D45)),
                    _buildButton("9", const Color(0xFF1E4D45)),
                    _buildButton("÷", const Color(0xFF2A9D8F)),
                  ],
                ),
                // Row 2
                Row(
                  children: [
                    _buildButton("4", const Color(0xFF1E4D45)),
                    _buildButton("5", const Color(0xFF1E4D45)),
                    _buildButton("6", const Color(0xFF1E4D45)),
                    _buildButton("×", const Color(0xFF2A9D8F)),
                  ],
                ),
                // Row 3
                Row(
                  children: [
                    _buildButton("1", const Color(0xFF1E4D45)),
                    _buildButton("2", const Color(0xFF1E4D45)),
                    _buildButton("3", const Color(0xFF1E4D45)),
                    _buildButton("-", const Color(0xFF2A9D8F)),
                  ],
                ),
                // Row 4
                Row(
                  children: [
                    _buildButton("C", const Color(0xFFE76F51)),
                    _buildButton("0", const Color(0xFF1E4D45)),
                    _buildButton("=", const Color.fromARGB(255, 232, 133, 67)),
                    _buildButton("+", const Color(0xFF2A9D8F)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E4D45),
        child: IconButton(
          icon: const Icon(Icons.home, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
