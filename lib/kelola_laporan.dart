import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LaporanModel {
  late String newUrl;
  late String selectedValue;
  late String long;
  late String lat;
  // late String keteranganController;
  late String formatted;
  late String status;
  late String valid;
  late String reportId;
  late String uid;

  LaporanModel({
    required this.newUrl,
    required this.selectedValue,
    required this.long,
    required this.lat,
    // required this.keteranganController,
    required this.formatted,
    required this.status,
    required this.reportId,
    required this.valid,
    required this.uid,
  });

  static LaporanModel fromMap(Map<String, dynamic> map) {
    return LaporanModel(
      reportId: map['reportId'],
      uid: map['user'],
      newUrl: map['newUrl'],
      selectedValue: map['damage'],
      long: map['longitude'],
      lat: map['latitude'],
      // keteranganController: map['keterangan'],
      formatted: map['date'],
      status: map['status'],
      valid: map['valid'],
    );
  }
}

class KelolaLaporan extends StatefulWidget {
  const KelolaLaporan({Key? key}) : super(key: key);

  @override
  State<KelolaLaporan> createState() => _KelolaLaporanState();
}

class _KelolaLaporanState extends State<KelolaLaporan> {
  User? user;
  DatabaseReference? postRef;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user == null || user != null) {
      log("USER VALID");
      postRef = FirebaseDatabase(
              databaseURL:
                  "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
          .reference()
          .child('Laporan');
    } else {
      log("USET TIDAK VALID");
    }
    super.initState();
  }

  final List<RadioUpdate> upDatelist = [
    RadioUpdate(index: 1, text: "Belum diproses"),
    RadioUpdate(index: 2, text: "Diproses"),
    RadioUpdate(index: 3, text: "Selesai"),
  ];
  final List<RadioValidation> valiDationlist = [
    RadioValidation(index: 1, text: "Valid"),
    RadioValidation(index: 2, text: "Belum Valid"),
  ];
  int _currentIndex = 0;
  String? selecetedUpdate;
  int _validationIndex = 0;
  String? selectedValidation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text(
            "Laporan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // centerTitle: true,
          backgroundColor: const Color.fromRGBO(245, 210, 126, 1),
        ),
        body: StreamBuilder(
            stream: postRef != null ? postRef!.onValue : null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                log("TIDAK ADA DATA");
              }
              if (snapshot.hasError) {
                log("ERROR");
              }
              if (snapshot.hasData && !snapshot.hasError) {
                var event = snapshot.data;
                //as Event
                var snapshot2 = event.snapshot.value;

                // log(snapshot2.keys.toString());
                if (snapshot2 == null) {
                  return const Center(
                    child: Text('No Tasks Added Yet'),
                  );
                }

                var lapor = <LaporanModel>[];

                for (var uu in snapshot2.keys) {
                  for (var yy in snapshot2[uu].values) {
                    log(yy["date"].toString());
                    Map<String, dynamic> mas = {
                      "newUrl": yy['newUrl'],
                      "selectedValue": yy['damage'],
                      "currentLocation": yy['location'],
                      "formatted": yy['date'],
                      "status": yy['status'],
                      "valid": yy['valid'],
                    };
                    log(mas.toString());
                    LaporanModel laporanModel =
                        LaporanModel.fromMap(Map<String, dynamic>.from(yy));
                    // log(mas.toString());
                    lapor.add(laporanModel);
                    // laporan.add();
                  }
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: lapor.length,
                      itemBuilder: (BuildContext context, int index) {
                        LaporanModel task = lapor[index];

                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 210, 126, 1),
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
                                      width: 75,
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
                                      width: 75,
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
                              const SizedBox(height: 3),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
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
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 75,
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
                                      task.status.toString(),
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
                                      width: 75,
                                      child: Text(
                                        "Valid",
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
                                      task.valid.toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    RaisedButton(
                                        color: const Color.fromRGBO(
                                            45, 179, 172, 1),
                                        child: const Text(
                                          "Update Info",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          _selectRingtone(task.status, task.uid,
                                              task.reportId);
                                        }),
                                    const Spacer(),
                                    RaisedButton(
                                        color: const Color.fromRGBO(
                                            45, 179, 172, 1),
                                        child: const Text(
                                          "Validasi",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          _selectValidation(task.valid,
                                              task.uid, task.reportId);
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<Future> _selectRingtone(
      String status, String uid, String reportId) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState2) {
              return AlertDialog(
                title: const Text('Update Info'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                    child: const Text('Batal',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 183, 77, 1))),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      postRef!.child(uid).child(reportId).update(
                          {'status': selecetedUpdate.toString()}).then((value) {
                        toastMessage('Info Update');
                      }).onError((error, stackTrace) {
                        toastMessage(error.toString());
                      });
                    },
                    child: const Text('Update',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 183, 77, 1))),
                  ),
                ],
                content: SizedBox(
                  width: double.minPositive,
                  height: 300,
                  child: Column(
                    children: upDatelist
                        .map((UpDate) => RadioListTile(
                              title: Text(UpDate.text),
                              activeColor: Colors.orange[300],
                              value: UpDate.index,
                              groupValue: _currentIndex,
                              onChanged: (val) {
                                setState2(() {
                                  _currentIndex = val as int;
                                  selecetedUpdate = UpDate.text;
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          );
        });
  }

  Future<Future> _selectValidation(
      String valid, String uid, String reportId) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState2) {
              return AlertDialog(
                title: const Text('Update Validation'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Batal',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 183, 77, 1))),
                  ),
                  FlatButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      postRef!.child(uid).child(reportId).update({
                        'valid': selectedValidation.toString()
                      }).then((value) {
                        toastMessage('Info Update');
                      }).onError((error, stackTrace) {
                        toastMessage(error.toString());
                      });
                    },
                    child: const Text('Update',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 183, 77, 1))),
                  ),
                ],
                content: SizedBox(
                  width: double.minPositive,
                  height: 300,
                  child: Column(
                    children: valiDationlist
                        .map((valiDation) => RadioListTile(
                              title: Text(valiDation.text),
                              activeColor: Colors.orange[300],
                              value: valiDation.index,
                              groupValue: _validationIndex,
                              onChanged: (val) {
                                setState2(() {
                                  _validationIndex = val as int;
                                  selectedValidation = valiDation.text;
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          );
        });
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.red,
      fontSize: 16.0,
    );
  }
}

class RadioValidation {
  final int index;
  final String text;
  RadioValidation({required this.index, required this.text});
}

class RadioUpdate {
  final int index;
  final String text;
  RadioUpdate({required this.index, required this.text});
}
