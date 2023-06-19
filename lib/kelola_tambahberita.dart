// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:rms_emsit/round_button.dart';

class TambahBerita extends StatefulWidget {
  const TambahBerita({Key? key, required this.title}) : super(key: key);
  final String? title;
  @override
  // ignore: library_private_types_in_public_api
  _TambahBeritaState createState() => _TambahBeritaState();
}

class _TambahBeritaState extends State<TambahBerita> {
  bool showSpinner = false;
  final postRef = FirebaseDatabase(
          databaseURL:
              "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .reference()
      .child('Berita');

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  TextEditingController judulController = TextEditingController();
  TextEditingController beritaController = TextEditingController();

  File? imgFile;
  final imgPicker = ImagePicker();

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

  void openCamera() async {
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

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
          title: const Text(
            "Unggah Berita",
            style: TextStyle(color: Colors.white),
          ),
          // centerTitle: true,
          backgroundColor: Color.fromRGBO(245, 210, 126, 1),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
            child: Column(
              children: <Widget>[
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
                                color: Colors.orange,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: judulController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Judul',
                          hintText: 'Masukkan judul',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: beritaController,
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLength: 2000,
                        decoration: const InputDecoration(
                          labelText: 'Deskripsi',
                          hintText: 'Masukkan Deskripsi',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(height: 25),
                      RoundButton(
                          title: 'Upload',
                          onPress: () async {
                            setState(() {
                              showSpinner = true;
                            });

                            try {
                              String formatHari(String tanggal) {
                                DateTime dateTime =
                                    DateFormat("yyyy-MM-dd").parse(tanggal);

                                var day = DateFormat('EEEE').format(dateTime);
                                var hari = "";
                                switch (day) {
                                  case 'Sunday':
                                    {
                                      hari = "Minggu";
                                    }
                                    break;
                                  case 'Monday':
                                    {
                                      hari = "Senin";
                                    }
                                    break;
                                  case 'Tuesday':
                                    {
                                      hari = "Selasa";
                                    }
                                    break;
                                  case 'Wednesday':
                                    {
                                      hari = "Rabu";
                                    }
                                    break;
                                  case 'Thursday':
                                    {
                                      hari = "Kamis";
                                    }
                                    break;
                                  case 'Friday':
                                    {
                                      hari = "Jumat";
                                    }
                                    break;
                                  case 'Saturday':
                                    {
                                      hari = "Sabtu";
                                    }
                                    break;
                                }
                                return hari;
                              }

                              String formatJam(String tanggal) {
                                if (tanggal != "") {
                                  DateTime dt = DateTime.parse(tanggal);
                                  String jam = DateFormat('HH:mm').format(dt);

                                  return '$jam WIB';
                                } else {
                                  return "- : -";
                                }
                              }

                              String formatTglIndo(String tanggal) {
                                DateTime dateTime =
                                    DateFormat("yyyy-MM-dd").parse(tanggal);

                                var m = DateFormat('MM').format(dateTime);
                                var d = DateFormat('dd')
                                    .format(dateTime)
                                    .toString();
                                var Y = DateFormat('yyyy')
                                    .format(dateTime)
                                    .toString();
                                var month = "";
                                switch (m) {
                                  case '01':
                                    {
                                      month = "Januari";
                                    }
                                    break;
                                  case '02':
                                    {
                                      month = "Februari";
                                    }
                                    break;
                                  case '03':
                                    {
                                      month = "Maret";
                                    }
                                    break;
                                  case '04':
                                    {
                                      month = "April";
                                    }
                                    break;
                                  case '05':
                                    {
                                      month = "Mei";
                                    }
                                    break;
                                  case '06':
                                    {
                                      month = "Juni";
                                    }
                                    break;
                                  case '07':
                                    {
                                      month = "Juli";
                                    }
                                    break;
                                  case '08':
                                    {
                                      month = "Agustus";
                                    }
                                    break;
                                  case '09':
                                    {
                                      month = "September";
                                    }
                                    break;
                                  case '10':
                                    {
                                      month = "Oktober";
                                    }
                                    break;
                                  case '11':
                                    {
                                      month = "November";
                                    }
                                    break;
                                  case '12':
                                    {
                                      month = "Desember";
                                    }
                                    break;
                                }
                                return "$d $month $Y";
                              }

                              final DateTime tgl = DateTime.now();

                              // String jamIndo = formatJam(tgl);
                              // String hariIndo = formatHari(tgl);
                              // String tanggalIndo = formatTglIndo(tgl);
                              // final DateTime now = DateTime.now();
                              // final DateFormat formatter =
                              //     DateFormat('EEEE, d MMM , yyyy hh:mm:ss');
                              final String formatted =
                                  "${formatHari(tgl.toString())}, ${formatTglIndo(tgl.toString())} ${formatJam(tgl.toString())}";

                              firebase_storage.Reference ref = firebase_storage
                                  .FirebaseStorage.instance
                                  .ref('/Berita$formatted');
                              UploadTask uploadTask =
                                  ref.putFile(imgFile!.absolute);
                              await Future.value(uploadTask);
                              var newUrl = await ref.getDownloadURL();
                              String? reportId = postRef.push().key;
                              postRef.child(reportId!).set({
                                'reportId': reportId,
                                'formatted': formatted.toString(),
                                'newUrl': newUrl.toString(),
                                'ptittle': judulController.text.toString(),
                                'pdescription':
                                    beritaController.text.toString(),
                              }).then((value) {
                                toastMessage('Berhasil Diunggah');
                                Navigator.of(context).pop();
                                setState(() {
                                  showSpinner = false;
                                });
                              }).onError((error, stackTrace) {
                                toastMessage(error.toString());
                                setState(() {
                                  showSpinner = false;
                                });
                              });
                            } catch (e) {
                              setState(() {
                                showSpinner = false;
                              });
                              toastMessage(e.toString());
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
      backgroundColor: Colors.grey,
      textColor: Colors.orange[300],
      fontSize: 16.0,
    );
  }
}
