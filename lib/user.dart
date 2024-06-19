import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Notification button action
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            SizedBox(height: 20),
            UserInfo(),
            SizedBox(height: 20),
            Expanded(
              child: WeatherInfo(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.blue),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file,color: Colors.blue),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.blue),
            label: '',
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Icon(Icons.account_circle, size: 50, color: Colors.white),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Pengguna',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'No. KTP Pengguna',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                'Halo (Pengguna)!\nSelamat Datang di Bandlak Sehat!',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'CUACA HARI INI',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Suhu :',
            style: TextStyle(fontSize: 20,color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Kelembapan :',
            style: TextStyle(fontSize: 20,color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'UV :',
            style: TextStyle(fontSize: 20,color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Jarak Pandang :',
            style: TextStyle(fontSize: 20,color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
