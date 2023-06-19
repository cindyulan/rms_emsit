// ignore_for_file: deprecated_member_use, duplicate_ignore
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rms_emsit/fitur_sukseslaporan.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FormLaporan extends StatefulWidget {
  const FormLaporan({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormLaporanState createState() => _FormLaporanState();
}

// ignore: duplicate_ignore
class _FormLaporanState extends State<FormLaporan> {
  int _rgProgramming = 0;
  String? selectedValue;

  TextEditingController keteranganController = TextEditingController();

  final List<RadioGroup> _programmingList = [
    RadioGroup(index: 1, text: "Lubang"),
    RadioGroup(index: 2, text: "Retak"),
    RadioGroup(index: 3, text: "Amblas"),
    RadioGroup(index: 4, text: "Bergelombang"),
    RadioGroup(index: 5, text: "Retak Pinggir"),
  ];

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  File? imgFile;
  final imgPicker = ImagePicker();

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  // LocationData? currentLocation;
  // final Location _locationService = Location();

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100,
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      openCamera();
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.camera,
                      ),
                      title: Text('Camera'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openGallery();
                    },
                    child: const ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // ignore: duplicate_ignore, duplicate_ignore
  void openCamera() async {
    // ignore: deprecated_member_use
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Widget displayImage() {
    if (imgFile == null) {
      return Image.asset("assets/images/foto.png");
    } else {
      return Image.file(imgFile!, width: 100, height: 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text(
          "Lapor",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 210, 126, 1),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        // margin: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  const Text(
                    "Foto Jalan Rusak",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  InkWell(
                    onTap: () {
                      showOptionsDialog(context);
                    },
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width * 1,
                        child: imgFile != null
                            ? ClipRect(
                                child: Image.file(
                                  imgFile!.absolute,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 100,
                                height: 100,
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Color.fromARGB(255, 245, 181, 87),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Text(
                    "Lokasi",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Center(
                    child: Text("$lat, $long"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Text(
                    "Keterangan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  TextFormField(
                    controller: keteranganController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'keterangan',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 141, 140, 140),
                      ),
                      fillColor: Color.fromRGBO(246, 246, 246, 1),
                      filled: true,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 232, 229, 229),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 232, 229, 229),
                          width: 1.5,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    autofocus: false,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Text(
                    "Kerusakan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _programmingList
                        .map((programming) => RadioListTile(
                              title: Text(programming.text),
                              activeColor:
                                  const Color.fromARGB(255, 245, 181, 87),
                              value: programming.index,
                              groupValue: _rgProgramming,
                              onChanged: (value) {
                                setState(() {
                                  _rgProgramming = value as int;
                                  selectedValue = programming.text;
                                });
                                if (_rgProgramming < 0) {
                                  toastMessage('Please select your gender');
                                }
                              },
                            ))
                        .toList(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showAlertDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 245, 181, 87),
                      fixedSize: const Size(306, 40),
                    ),
                    child: const Text(
                      "Kirim",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<LocationData?> _getLocation() async {
  //   LocationData? currentLocation;
  //   try {
  //     currentLocation = await _locationService.getLocation();
  //   } catch (e) {
  //     currentLocation = null;
  //   }
  //   return currentLocation;
  // }

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

  Future showAlertDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState2) {
              return AlertDialog(
                title: const Text('Konfirmasi'),
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
                      try {
                        final DateTime now = DateTime.now();
                        final DateFormat formatter =
                            DateFormat('yyyy-MM-dd hh:mm:ss');
                        final String formatted = formatter.format(now);

                        firebase_storage.Reference ref = firebase_storage
                            .FirebaseStorage.instance
                            .ref('/laporan$formatted');
                        UploadTask uploadTask = ref.putFile(imgFile!.absolute);
                        await Future.value(uploadTask);
                        var newUrl = await ref.getDownloadURL();
                        String status = "Belum diproses";
                        String valid = "Belum Valid";
                        final User? user = _auth.currentUser;
                        String uid = user!.uid;
                        String? email = user.email;
                        final postRef = FirebaseDatabase(
                                databaseURL:
                                    "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
                            .reference()
                            .child('Laporan')
                            .child(uid);
                        String? reportId = postRef.push().key;
                        await postRef.child(reportId!).set({
                          'reportId': reportId.toString(),
                          'date': formatted.toString(),
                          'email': email.toString(),
                          'newUrl': newUrl.toString(),
                          'latitude': lat.toString(),
                          'longitude': long.toString(),
                          'keterangan': keteranganController.text.toString(),
                          'damage': selectedValue.toString(),
                          'status': status.toString(),
                          'valid': valid.toString(),
                          'user': uid.toString(),
                        }).then((value) {
                          toastMessage('Laporan sukses dibuat');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SuksesLaporan()));
                        }).onError((error, stackTrcae) {
                          toastMessage(error.toString());
                        });
                      } catch (e) {
                        toastMessage(e.toString());
                      }
                    },
                    child: const Text('OK',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 183, 77, 1))),
                  ),
                ],
                content: const Text("Yakin membuat Laporan?"),
              );
            },
          );
        });
  }
}

class RadioGroup {
  final int index;
  final String text;
  RadioGroup({required this.index, required this.text});
}
