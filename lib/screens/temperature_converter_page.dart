import 'package:flutter/material.dart';

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final TextEditingController _tempController = TextEditingController();
  double? _convertedTemperature;
  String _selectedConversion = 'Celcius ke Fahrenheit';
  
  // Daftar opsi konversi suhu
  final List<String> _conversionOptions = [
    'Celcius ke Fahrenheit',
    'Celcius ke Kelvin',
    'Fahrenheit ke Celcius',
    'Fahrenheit ke Kelvin',
    'Kelvin ke Celcius',
    'Kelvin ke Fahrenheit'
  ];

  void _convertTemperature() {
    double? temp = double.tryParse(_tempController.text);
    if (temp != null) {
      setState(() {
        switch (_selectedConversion) {
          case 'Celcius ke Fahrenheit':
            _convertedTemperature = (temp * 9 / 5) + 32;
            break;
          case 'Celcius ke Kelvin':
            _convertedTemperature = temp + 273.15;
            break;
          case 'Fahrenheit ke Celcius':
            _convertedTemperature = (temp - 32) * 5 / 9;
            break;
          case 'Fahrenheit ke Kelvin':
            _convertedTemperature = (temp - 32) * 5 / 9 + 273.15;
            break;
          case 'Kelvin ke Celcius':
            _convertedTemperature = temp - 273.15;
            break;
          case 'Kelvin ke Fahrenheit':
            _convertedTemperature = (temp - 273.15) * 9 / 5 + 32;
            break;
        }
      });
    } else {
      setState(() {
        _convertedTemperature = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C5E50), // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'KONVERSI SUHU',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 30),
              
              // Container with gradient background
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E4D45), Color(0xFF2C5E50)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _tempController,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Suhu',
                        labelStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    
                    // Dropdown menu for selecting conversion type
                    DropdownButtonFormField<String>(
                      value: _selectedConversion,
                      dropdownColor: const Color(0xFF1E4D45),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF1E4D45),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      items: _conversionOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedConversion = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Convert button with gradient
                    ElevatedButton(
                      onPressed: _convertTemperature,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 5,
                        backgroundColor: Colors.transparent, // Make transparent for gradient
                        shadowColor: Colors.black.withOpacity(0.25),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF283E51), Color(0xFF4B79A1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Konversi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Result display
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E4D45),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hasil: ${_convertedTemperature != null ? _convertedTemperature!.toStringAsFixed(2) : ''}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E4D45),
        child: IconButton(
          icon: const Icon(Icons.home, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context); // Navigate back to home page
          },
        ),
      ),
    );
  }
}
