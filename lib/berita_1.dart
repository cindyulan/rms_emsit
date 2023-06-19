import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(snapshot, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final dbRef = FirebaseDatabase(
          databaseURL:
              "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
      .reference();
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
                  "Akibat Genangan Air Hujan, 336 Ruas Jalan di Surabaya Rusak",
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
                              "https://cdn-asset.jawapos.com/wp-content/uploads/2017/02/jawa-timur-darurat-jalan-rusak_m_110997.jpeg"),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sebanyak 366 ruas jalan di Kota Surabaya, Provinsi Jawa Timur (Jatim) mengalami kerusakan atau berlubang akibat genangan air hujan yang terjadi selama musim hujan pada tahun 2022 ini.",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "'Kami minta Pemerintah Kota (Pemkot) Surabaya perbaiki jalan rusak setelah musim hujan berakhir,' tegas Anggota Komisi C Bidang Pembangunan DPRD Kota Surabaya William Wirakusuma dilansir Antara, Selasa (15/3/2022). Menurut William, ruas jalan yang rusak tersebut hampir merata di seluruh wilayah Kota Surabaya.",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Salah satu ruas jalan yang terendam banjir cukup parah yaitu Jalan Tidar menuju Jalan Petemon Surabaya. Selain itu, banjir parah juga terjadi di kawasan Sidotopo. Dia menyebutkan, kerusakan jalan akibat hujan cukup variatif, mulai dari ringan, sedang, hingga berat. 'Setiap ruas jalan, tingkat kerusakan berberbeda beda. Ada yang terlihat banyak lubangnya dalam satu ruas jalan, ada juga hanya beberapa lubang saja', ujarnya."),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
