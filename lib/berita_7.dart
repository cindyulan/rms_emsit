import 'package:flutter/material.dart';

class Berita7 extends StatefulWidget {
  const Berita7({Key? key}) : super(key: key);

  @override
  State<Berita7> createState() => _Berita7State();
}

class _Berita7State extends State<Berita7> {
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
                  "Warga Keluhkan Banyak Lubang di Jalan Banyuurip Surabaya",
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
                              "https://akcdn.detik.net.id/community/media/visual/2022/02/05/jalan-berlubang-di-surabaya_43.jpeg?w=700&q=90"),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Izmi, salah satu pengendara roda dua melaporkan banyak lubang di Jalan Banyuurip. Tepatnya setelah Pasar Asem menuju Pasar Kembang.",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "'Banyak lubang, saya lihat sekitar 15-an. Ini sudah lama, mungkin karena ada pekerjaan proyek di sekitar Pasar Asem yang menyebabkan jalanan lubang,' Kata Izmi kepada detikjatim, Sabtu (5/2/2022).",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Izmi menyebut, diameter lubang di kawasan Banyuurip bervariasi. Ia khawatir lubang-lubang itu menjadi penyebab kecelakaan. Ia berharap segera ada perbaikan."),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
