import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20), // Spasi atas
                Center(
                  child: SizedBox(
                    width: 150, // Sesuaikan lebar gambar sesuai kebutuhan
                    height: 150, // Sesuaikan tinggi gambar sesuai kebutuhan
                    child: Image.asset(
                      'assets/images/bandlaklogo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Spasi antara gambar dan teks
                Container(
                  height: 200, // Sesuaikan tinggi container sesuai kebutuhan
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/R1.png'), // Ganti dengan path gambar yang sesuai
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(fontSize: 24, color: Colors.lightBlue),
                      ),
                      Text(
                        'Admin Ganteng!',
                        style: TextStyle(fontSize: 24, color: Colors.lightBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
