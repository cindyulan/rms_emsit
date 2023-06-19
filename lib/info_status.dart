// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rms_emsit/kelola_admin.dart';

class InfoStatus extends StatefulWidget {
  const InfoStatus({Key? key}) : super(key: key);

  // ignore: use_key_in_widget_constructors
  @override
  State<InfoStatus> createState() => _InfoStatusState();
}

class _InfoStatusState extends State<InfoStatus> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KelolaAdmin()));
            },
          ),
          title: const Text(
            "Info Status",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: const Text("Belum diproses"),
              leading: Radio(
                value: 1,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value as int;
                  });
                },
                activeColor: const Color.fromARGB(255, 245, 181, 87),
              ),
            ),
            ListTile(
              title: const Text("Diproses"),
              leading: Radio(
                value: 2,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value as int;
                  });
                },
                activeColor: const Color.fromARGB(255, 245, 181, 87),
              ),
            ),
            ListTile(
              title: const Text("Selesai"),
              leading: Radio(
                value: 3,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value as int;
                  });
                },
                activeColor: const Color.fromARGB(255, 245, 181, 87),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 245, 181, 87),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
