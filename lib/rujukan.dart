import 'package:flutter/material.dart';

class rujukanForm extends StatefulWidget {
  @override
  _rujukanFormState createState() => _rujukanFormState();
}

class _rujukanFormState extends State<rujukanForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ktpController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _keluhanController = TextEditingController();

  String? _selectedKecamatan;
  String? _selectedKelurahan;

  final List<String> _kecamatanList = ['Kecamatan Bandar Laksamana'];
  final List<String> _kelurahanList = ['Kelurahan Parit 1 Api-Api', 'Temiang', 'Api-Api', 'Tenggayun', 'Sepahat', ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan Rujukan Kesehatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset('assets/images/bandlaklogo1.png', height: 100),
              SizedBox(height: 20),
              Text(
                'PENGAJUAN RUJUKAN KESEHATAN',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Silahkan lengkapi lembar berikut untuk melanjutkan rujukan.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _ktpController,
                decoration: InputDecoration(
                  labelText: 'NIK*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'NIK tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedKecamatan,
                decoration: InputDecoration(
                  labelText: 'Kecamatan*',
                  border: OutlineInputBorder(),
                ),
                items: _kecamatanList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedKecamatan = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Kecamatan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedKelurahan,
                decoration: InputDecoration(
                  labelText: 'Kelurahan*',
                  border: OutlineInputBorder(),
                ),
                items: _kelurahanList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedKelurahan = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Kelurahan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _keluhanController,
                decoration: InputDecoration(
                  labelText: 'Keluhan*',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Keluhan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('KIRIM'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
