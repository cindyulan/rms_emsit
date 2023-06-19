import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rms_emsit/fitur_laporan.dart';
import 'package:rms_emsit/riwayat_model.dart';
import 'fitur_formlaporan.dart';

class RiwayatLaporan extends StatefulWidget {
  const RiwayatLaporan({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RiwayatLaporanState createState() => _RiwayatLaporanState();
}

class _RiwayatLaporanState extends State<RiwayatLaporan> {
  User? user;
  DatabaseReference? postRef;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future logout() async {
    await auth.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => DaftarLaporan()),
            (route) => false));
  }

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      postRef = FirebaseDatabase(
              databaseURL:
                  "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
          .reference()
          .child('Laporan')
          .child(user!.uid);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     icon: const Icon(Icons.arrow_back_ios_new_rounded,
          //         color: Colors.white),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     }),
          title: const Text(
            "Riwayat Laporan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                  logout();
                  // auth.signOut().then((value) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => const Home()));
                  // });
                  toastMessage('user sucessfully logout');
                })
          ],
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(245, 210, 126, 1),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const FormLaporan();
            }));
          },
          backgroundColor: const Color.fromARGB(255, 245, 181, 87),
          child: const Icon(
            Icons.add,
          ),
        ),
        body: StreamBuilder(
          stream: postRef != null ? postRef!.onValue : null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              var event = snapshot.data;
              //as Event
              var snapshot2 = event.snapshot.value;

              if (snapshot2 == null) {
                return const Center(
                  child: Text('No Tasks Added Yet'),
                );
              }
              Map<String, dynamic> map = Map<String, dynamic>.from(snapshot2);

              var laporan = <RiwayatModel>[];

              for (var taskMap in map.values) {
                RiwayatModel riwayatModel = RiwayatModel.fromMap(
                    Map<String, dynamic>.from(
                        Map<String, dynamic>.from(taskMap)));

                laporan.add(riwayatModel);
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: laporan.length,
                    itemBuilder: (context, index) {
                      RiwayatModel task = laporan[index];

                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 210, 126, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                width: 322,
                                height: 205,
                                placeholder: 'assets/images/foto.png',
                                image: task.newUrl),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 78,
                                    child: Text(
                                      "Tanggal",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                    child: Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    task.formatted.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 78,
                                    child: Text(
                                      "Kerusakan",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                    child: Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    task.selectedValue.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 78,
                                    child: Text(
                                      "Lokasi",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                    child: Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    height: 20,
                                    child: Text(
                                      task.lat.toString() +
                                          task.long.toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(children: [
                                const SizedBox(
                                  width: 78,
                                  child: Text(
                                    "Keterangan",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  task.keteranganController.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 78,
                                    child: Text(
                                      "Status",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                    child: Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    task.status,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
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
