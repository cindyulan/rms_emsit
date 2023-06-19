import 'package:flutter/material.dart';
import 'package:rms_emsit/auth_service.dart';
import 'package:rms_emsit/help_beranda.dart';
import 'package:rms_emsit/maps_baru.dart';
import 'package:rms_emsit/maps_quality.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                color: const Color.fromRGBO(245, 210, 129, 1),
                alignment: Alignment.topLeft,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                            5.0 + MediaQuery.of(context).viewPadding.top),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Halo, Selamat Datang!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset('assets/images/hello.png'),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 260),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(42),
                      topRight: Radius.circular(42),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color(0xfff1f1f1),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  side: const BorderSide(
                                      width: 2,
                                      color: Color.fromARGB(255, 245, 181, 87)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                leading: Image.asset(
                                  "assets/images/location.png",
                                  height: 45,
                                  width: 45,
                                ),
                                title: const Text(
                                  "Kerusakan Jalan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orange[400],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Mapsbaru()));
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Card(
                              color: Colors.white,
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  side: const BorderSide(
                                      width: 2,
                                      color: Color.fromARGB(255, 245, 181, 87)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                leading: Image.asset(
                                  "assets/images/cloudy.png",
                                  height: 45,
                                  width: 45,
                                ),
                                title: const Text(
                                  "Kualitas Udara",
                                  style: TextStyle(fontSize: 18),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orange[400],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MapsQuality()));
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            Card(
                              color: Colors.white,
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  side: const BorderSide(
                                      width: 2,
                                      color: Color.fromARGB(255, 245, 181, 87)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                leading: Image.asset(
                                  "assets/images/analytics.png",
                                  height: 45,
                                  width: 45,
                                ),
                                title: const Text(
                                  "Laporan",
                                  style: TextStyle(fontSize: 18),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orange[400],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AuthService().handleAuthState()));
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Help()));
                                },
                                backgroundColor:
                                    const Color.fromARGB(255, 245, 181, 87),
                                child: const Icon(Icons.back_hand_outlined),
                              ),
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
        ],
      ),
    ]);
  }
}
