import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menunggu 5 detik sebelum pindah ke halaman utama
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home'); // Ganti dengan rute halaman utama Anda
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 58, 45),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/D1.png',  // Gambar logo
                width: 100,
                height: 100,
                fit: BoxFit.cover, // Mengatur agar gambar memenuhi lingkaran
              ),
            ),
            const SizedBox(height: 20), // Jarak antara logo dan teks
            const Text(
              '152022194',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10), // Jarak antara NIM dan nama
            const Text(
              'Devit Saputra',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
