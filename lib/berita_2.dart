import 'package:flutter/material.dart';

class Berita2 extends StatefulWidget {
  const Berita2({Key? key}) : super(key: key);

  @override
  State<Berita2> createState() => _Berita2State();
}

class _Berita2State extends State<Berita2> {
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
          "Berita",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange[300],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Pemprov Jatim Minta Warga Optimalkan Pengaduan Jalan Rusak Melalui Jalak Loewe",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "07 Juli 2022",
                    style: TextStyle(
                      color: Color(0xff959595),
                      fontSize: 12,
                    ),
                  ),
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
                          image:
                              "https://www.suarasurabaya.net/wp-content/uploads/2021/03/210301115510_foto-840x493.jpg"),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Dinas Pekerjaan Umum (DPU) Bina Marga Provinsi Jawa Timur mengajak pemerintah kabupaten/kota di Jatim untuk mengoptimalkan warganya agar memanfaatkan layanan pengaduan jalan dan jembatan rusak secara online, melalui aplikasi Jalak Loewe yang telah dilaunching sejak tahun 2021.",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Aplikasi berbasis Quick Response Road Management System (QRRMS) ini bisa diunduh di Google Playstore dengan nama Jalak Loewe. Moch Amirulloh Sekretaris DPU Bina Marga Jatim, menjelaskan QRRMS adalah sebuah sistem yang dirancang untuk memudahkan masyarakat dalam melaporkan kerusakan jalan secara online dan realtime.",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "'QRRMS sangat membantu masyarakat dalam melaporkan kerusakan jalan atau jembatan di wilayah Jawa Timur,' ujar Amirullah, mengutip laman Kominfo Pemprov Jatim, Selasa (5/7/2022).Kata Amirulloh, aplikasi tersebut bertujuan untuk menjaring aspirasi atau keluhan masyarakat terkait kerusakan jalan yang ada di wilayah Jatim sesuai dengan kewenangan setiap instansi. Antara lain seperti ruas jalan Nasional, Provinsi, maupun kabupaten dan kota."),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
