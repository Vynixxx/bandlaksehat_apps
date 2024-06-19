import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Column(
              children: [
                SizedBox(height: 4),
                Image.asset('images/bandlaklogo1.png',
                    height: 300,
                    fit: BoxFit.contain,
                    ), // Path to your logo
                SizedBox(width: 1000),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Selamat Datang\nAdmin Ganteng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        DashboardButton(
                          icon: Icons.person_add,
                          label: 'PENGGUNA',
                          onPressed: () {},
                        ),
                        DashboardButton(
                          icon: Icons.medical_services,
                          label: 'DOKTER',
                          onPressed: () {},
                        ),
                        DashboardButton(
                          icon: Icons.receipt,
                          label: 'RUJUKAN',
                          onPressed: () {},
                        ),
                        DashboardButton(
                          icon: Icons.bar_chart,
                          label: 'STATISTIK',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  DashboardButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white, // Ubah 'primary' menjadi 'backgroundColor'
        foregroundColor:
            Colors.blue, // Ubah 'onPrimary' menjadi 'foregroundColor'
        elevation: 5,
        shadowColor: Colors.grey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 50, color: Colors.blue),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
