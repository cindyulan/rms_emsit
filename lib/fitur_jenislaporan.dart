import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rms_emsit/fitur_riwayatlaporan.dart';

class JenisLaporan extends StatefulWidget {
  const JenisLaporan({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _JenisLaporanState createState() => _JenisLaporanState();
}

class _JenisLaporanState extends State<JenisLaporan> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Selamat\nDatang',
                    style: TextStyle(
                      color: Colors.orange[300],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  FirebaseAuth.instance.currentUser!.displayName!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 170, 169, 169),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  FirebaseAuth.instance.currentUser!.email!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 170, 169, 169),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(children: [
                      Card(
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            side: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(244, 244, 244, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          leading: Image.asset(
                            "assets/images/location.png",
                            height: 45,
                            width: 45,
                          ),
                          title: const Text("Kerusakan Jalan"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(218, 218, 218, 1),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RiwayatLaporan()));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            side: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(244, 244, 244, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          leading: Image.asset(
                            "assets/images/cloudy.png",
                            height: 45,
                            width: 45,
                          ),
                          title: const Text("Kualitas Udara"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(218, 218, 218, 1),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      "assets/images/cuate.png",
                      height: 196,
                      width: 325,
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
