import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  String? _selectedGender;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  final List<String> _genderList = ['Laki-laki', 'Perempuan'];

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;
      final nik = _nikController.text;
      final gender = _selectedGender;

      final response = await http.post(
        Uri.parse('http://your_api_url/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'nik': nik,
          'gender': gender,
        }),
      );

      if (response.statusCode == 201) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        // Handle error response
        final responseBody = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'] ?? 'Registration failed')),
        );
      }
    }
  }


  void _navigateToLogin() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Image(
                  image: AssetImage("assets/images/bandlaklogo1.png"),
                  width: 270,
                  height: 270,
                ),
                Text(
                  "Selamat datang di",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Bandlak Sehat",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Silahkan daftar untuk membuat akun.",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Container(
                  width: 370,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 370,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 370,
                  child: TextFormField(
                    controller: _nikController,
                    decoration: InputDecoration(
                      labelText: "NIK",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: Icon(Icons.format_list_numbered),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your NIK';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 370,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 370,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isConfirmPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 370,
                  child: DropdownButtonFormField<String>(
                    value: _selectedGender,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Kelamin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: Icon(Icons.person_outline),
                    ),
                    items: _genderList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Pilih jenis kelamin';
                      }
                      return null;
                    },
                  ),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _register,
                    child: Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: _navigateToLogin,
                  child: Text(
                    'Masuk?',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
