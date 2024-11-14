import 'package:flutter/material.dart';
import 'dart:io';

class BMICalculatorPage extends StatefulWidget {
  final File image;
  final String name;

  const BMICalculatorPage({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _result = '';

  void _calculateBMI() {
    final double? height = double.tryParse(_heightController.text);
    final double? weight = double.tryParse(_weightController.text);

    if (height != null && weight != null && height > 0) {
      final double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        if (bmi < 18.5) {
          _result = 'Underweight (BMI: ${bmi.toStringAsFixed(1)})';
        } else if (bmi < 24.9) {
          _result = 'Normal (BMI: ${bmi.toStringAsFixed(1)})';
        } else if (bmi < 29.9) {
          _result = 'Overweight (BMI: ${bmi.toStringAsFixed(1)})';
        } else {
          _result = 'Obese (BMI: ${bmi.toStringAsFixed(1)})';
        }
      });
    } else {
      setState(() {
        _result = 'Invalid input. Please enter correct values.';
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
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(widget.image), // Use user image
              ),
              const SizedBox(height: 10),
              Text(
                widget.name, // Display user name
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFB0B0B0), // Container background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _heightController,
                      decoration: InputDecoration(
                        labelText: 'Tinggi (cm)',
                        labelStyle: const TextStyle(color: Colors.black87),
                        filled: true,
                        fillColor: const Color(0xFF1E4D45),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _weightController,
                      decoration: InputDecoration(
                        labelText: 'Berat (kg)',
                        labelStyle: const TextStyle(color: Colors.black87),
                        filled: true,
                        fillColor: const Color(0xFF1E4D45),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _calculateBMI,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E4D45),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'HITUNG BMI',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _result,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
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
