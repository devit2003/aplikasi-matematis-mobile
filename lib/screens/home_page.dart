import 'package:flutter/material.dart';
import 'dart:io';
import 'calculator_page.dart';
import 'bmi_calculator_page.dart';
import 'schedule_page.dart';
import 'temperature_converter_page.dart';
import 'welcome_page.dart';

class HomePage extends StatelessWidget {
  final File image;
  final String name;

  const HomePage({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C5E50), // Background color
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF1E4D45),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF1E4D45),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(image),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Kalkulator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalculatorPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor_weight),
              title: const Text('Kalkulator BMI'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMICalculatorPage(
                    image: image,
                    name: name,
                  )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Schedule'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchedulePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.thermostat),
              title: const Text('Konversi Suhu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TemperatureConverterPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(image),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB0B0B0), // Container background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    children: [
                      _buildFeatureButton(
                        context,
                        'KALKULATOR',
                        Icons.calculate,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalculatorPage(),
                          ),
                        ),
                      ),
                      _buildFeatureButton(
                        context,
                        'KALKULATOR\nBMI',
                        Icons.monitor_weight,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMICalculatorPage(
                              image: image, // Pass user image
                              name: name, // Pass user name
                            ),
                          ),
                        ),
                      ),
                      _buildFeatureButton(
                        context,
                        'SCHEDULE',
                        Icons.schedule,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SchedulePage(),
                          ),
                        ),
                      ),
                      _buildFeatureButton(
                        context,
                        'KONVERSI\nSUHU',
                        Icons.thermostat,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TemperatureConverterPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
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
            // Handle home button press, if needed
          },
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E4D45), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        padding: const EdgeInsets.all(20),
        elevation: 8, // Adds shadow for interactivity
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
