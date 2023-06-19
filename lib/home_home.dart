import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:rms_emsit/news_baru.dart';
import 'beranda_fitur.dart';
import 'kelola_fitur.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //untuk membuat tabcontroller pertama menggunakan defaulttabcontroller
        child: DefaultTabController(
          //menentukan total tab
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: Color.fromARGB(255, 245, 181, 87),
                unselectedBackgroundColor: Colors.white,
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
                borderWidth: 1,
                borderColor: const Color.fromARGB(255, 245, 181, 87),
                unselectedBorderColor: Colors.white,
                radius: 15,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.home),
                    text: "Beranda",
                  ),
                  Tab(
                    text: "Berita",
                    icon: Icon(Icons.newspaper),
                  ),
                  Tab(
                    text: "Kelola",
                    icon: Icon(Icons.people),
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Beranda(),
                    newsbaru(),
                    Kelola(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
