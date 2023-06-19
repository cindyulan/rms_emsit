import 'package:flutter/material.dart';

class Berita4 extends StatefulWidget {
  const Berita4({Key? key}) : super(key: key);

  @override
  State<Berita4> createState() => _Berita4State();
}

class _Berita4State extends State<Berita4> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text(
          "Berita",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "DLH Mengukur Kualitas Udara Kota Surabaya Selama Januari-Mei, Hasilnya?",
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
                              "https://cdn0-production-images-kly.akamaized.net/OuHxjWEif-mE_GQ5suJabvyy_pw=/1280x720/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3023723/original/010833600_1579157614-81927437_2604811656416212_4408508769743131340_n.jpg"),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Indeks kualitas udara Kota Surabaya selama Januari hingga Mei 2022 tercatat 87,0874 atau masih dalam klasifikasi baik (70 ≤ x < 90), kata Kepala Dinas Lingkungan Hidup (DLH) Kota Surabaya Agus Hebi Djuniantoro.",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Agus menjelaskan bahwa sesuai peraturan menteri lingkungan hidup dan kehutanan tentang indeks kualitas lingkungan hidup, indeks kualitas udara dihitung berdasarkan konsentrasi polutan udara seperti sulfur dioksida (SO2) dan nitrogen dioksida (NO2).",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "'DLH mengukur konsentrasi polutan udara menggunakan alat ukur yang antara lain ditempatkan di stasiun pantau Kantor Kelurahan Kebonsari dan Kebun Bibit Wonorejo,' kata Agus Hebi dalam keterangan pers di Surabaya, dilansir dari Antara, Sabtu (25/6/2022)."),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
