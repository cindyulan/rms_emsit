import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class newsbaru extends StatefulWidget {
  const newsbaru({Key? key}) : super(key: key);

  @override
  State<newsbaru> createState() => _newsbaruState();
}

class _newsbaruState extends State<newsbaru> {
  final dbRef = FirebaseDatabase(
          databaseURL:
              "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .reference();
  TextEditingController searchController = TextEditingController();
  String search = "";
  final DateTime tgl = DateTime.now();
  // void searchNews(String query) {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(children: [
            TextFormField(
              controller: searchController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Cari Berita",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 141, 140, 140),
                ),
                isDense: true, // Added this
                contentPadding: EdgeInsets.all(8),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 245, 181, 87),
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    width: 1.5,
                  ),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  search = value;
                });
              },
            ),
            Container(
              constraints: const BoxConstraints.expand(height: 50),
              child: const TabBar(
                  indicatorColor: Color.fromARGB(255, 245, 181, 87),
                  labelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Semua"),
                    Tab(text: "Terbaru"),
                  ]),
            ),
            Expanded(
              child: TabBarView(children: [
                FirebaseAnimatedList(
                  query: dbRef.child('Berita'),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    var data = snapshot.value as Map;
                    // ignore: non_constant_identifier_names
                    final String TempTittle =
                        data['ptittle'] + data['pdescription'];
                    if (searchController.text.isEmpty) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailPage(snapshot)));
                            },
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image: NetworkImage(data['newUrl']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              title: Text(data['ptittle'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(data['formatted'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    } else if (TempTittle.toLowerCase()
                        .contains(searchController.text.toString())) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailPage(snapshot)));
                            },
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image: NetworkImage(data['newUrl']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              title: Text(data['ptittle'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                data['formatted'],
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                FirebaseAnimatedList(
                  query: dbRef
                      .child('Berita')
                      .orderByChild('formatted')
                      .startAt(tgl.toString()),
                  // 'Sabtu,03 Desember 2022 11:58 WIB'
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    var data = snapshot.value as Map;
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DetailPage(snapshot)));
                          },
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(data['newUrl']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            title: Text(data['ptittle'],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            subtitle: Text(data['formatted'],
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DataSnapshot detailDocument;
  DetailPage(this.detailDocument, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = detailDocument.value as Map;
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
            "Berita",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(245, 210, 129, 1),
        ),
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  data['ptittle'],
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: Color.fromRGBO(158, 158, 158, 1),
                      size: 16,
                    ),
                    Text(
                      data['formatted'].toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(158, 158, 158, 1),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.perm_identity_outlined,
                      color: Color.fromRGBO(158, 158, 158, 1),
                      size: 16,
                    ),
                    const Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromRGBO(158, 158, 158, 1)),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            width: 322,
                            height: 205,
                            placeholder: 'assets/images/foto.png',
                            image: data['newUrl']),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    data['pdescription'],
                    maxLines: 20,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
