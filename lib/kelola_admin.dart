import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rms_emsit/home_home.dart';
import 'package:rms_emsit/kelola_news.dart';
import 'kelola_laporan.dart';

// ignore: must_be_immutable
class KelolaAdmin extends StatelessWidget {
  KelolaAdmin({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'Selamat\nDatang',
                      style: TextStyle(
                        color: Color.fromARGB(255, 245, 181, 87),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset("assets/images/Kelola.png",
                        height: 200, width: 206, alignment: Alignment.center),
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
                              side: const BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(244, 244, 244, 1)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            leading: Image.asset(
                              "assets/images/news.png",
                              height: 45,
                              width: 45,
                            ),
                            title: const Text("Berita"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(218, 218, 218, 1),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const News()));
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
                              "assets/images/analytics.png",
                              height: 45,
                              width: 45,
                            ),
                            title: const Text("Laporan"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(218, 218, 218, 1),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const KelolaLaporan()));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FlatButton(
                            onPressed: () {
                              auth.signOut();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));

                              toastMessage('admin sucessfully logout');
                            },
                            child: const Text(
                              "Logout",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 245, 181, 87)),
                            ))
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
