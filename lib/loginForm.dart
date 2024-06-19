import 'package:flutter/material.dart';
import 'package:bandlaksehat_apps/register.dart'; // Pastikan file register.dart tersedia dan di-import
import 'package:bandlaksehat_apps/dashboard.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Image(
                  image: AssetImage("assets/images/bandlaklogo.png"),
                  width: 200,
                  height: 200),
              SizedBox(height: 8),
              Text("Selamat datang di",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
              Text("Bandlak Sehat",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
              Text("Halo! silahkan masuk untuk melanjutkan.",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),
              Container(
                width: 370,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 370,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Lupa Password ?",
                      style: TextStyle(color: Colors.lightBlue)),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 370,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(370, 60),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // Navigasi ke Dashboard setelah tombol "Masuk" ditekan
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                  child: Text('Masuk',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterForm()),
                  );
                },
                child: Text(
                  'Daftar?',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
