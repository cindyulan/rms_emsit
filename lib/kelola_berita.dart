import 'package:flutter/material.dart';
import 'package:rms_emsit/kelola_admin.dart';

class KelolaBerita extends StatefulWidget {
  const KelolaBerita({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KelolaBeritaState createState() => _KelolaBeritaState();
}

class _KelolaBeritaState extends State<KelolaBerita> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KelolaAdmin()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() {
            
          },
          backgroundColor: Colors.orange[300],
          child: const Icon(Icons.add,),
          ),
      ),
    );
  }
}
