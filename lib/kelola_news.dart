import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rms_emsit/kelola_tambahberita.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final dbRef = FirebaseDatabase(
          databaseURL:
              "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .reference();
  final editjudulController = TextEditingController();
  final editisiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita'),
        // centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Color.fromRGBO(245, 210, 126, 1),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TambahBerita(
                        title: '',
                      )));
        },
        backgroundColor: const Color.fromARGB(255, 245, 181, 87),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef.child('Berita'),
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  var data = snapshot.value as Map;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(data['newUrl'].toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                        title: Text(data['ptittle'].toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        subtitle: Text(data['formatted'].toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal)),
                        trailing: PopupMenuButton(
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pop(context);
                                        showMyDialog(
                                            data['ptittle'].toString(),
                                            data['pdescription'].toString(),
                                            data['reportId'].toString());
                                      },
                                      leading: const Icon(Icons.edit),
                                      title: const Text("Edit"),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pop(context);
                                        _onAlertButtonsPressed(
                                            context, snapshot);
                                      },
                                      leading: const Icon(Icons.delete_outline),
                                      title: const Text("Hapus"),
                                    ),
                                  ),
                                ]),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onAlertButtonsPressed(contex, DataSnapshot snapshot) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "KONFIRMASI",
      desc: "Yakin Untuk Menghapus",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(255, 183, 77, 1),
          child: const Text(
            "Batal",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () {
            dbRef
                .child('Berita')
                .child(snapshot.key!)
                .remove()
                .then((value) => Navigator.pop(context));
          },
          color: const Color.fromRGBO(255, 183, 77, 1),
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        )
      ],
    ).show();
  }

  Future<void> showMyDialog(
      String ptittle, String pdescription, String reportId) async {
    editjudulController.text = ptittle;
    editisiController.text = pdescription;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: Column(
              children: [
                TextFormField(
                  controller: editjudulController,
                  decoration: const InputDecoration(
                    labelText: 'Judul',
                    hintText: 'Edit Judul',
                  ),
                ),
                TextFormField(
                  controller: editisiController,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi',
                    hintText: 'Edit Deskripsi',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal',
                      style: TextStyle(color: Colors.orange[300]))),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    dbRef.child('Berita').child(reportId).update({
                      'ptittle': editjudulController.text.toString(),
                      'pdescription': editisiController.text.toString()
                    }).then((value) {
                      toastMessage('Post Update');
                    }).onError((error, stackTrace) {
                      toastMessage(error.toString());
                    });
                  },
                  child: Text('Update',
                      style: TextStyle(color: Colors.orange[300]))),
            ],
          );
        });
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
