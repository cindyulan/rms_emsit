import 'package:flutter/material.dart';

class Berita3 extends StatefulWidget {
  const Berita3({Key? key}) : super(key: key);

  @override
  State<Berita3> createState() => _Berita3State();
}

class _Berita3State extends State<Berita3> {
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
                  "Surabaya Raih Penghargaan Kota dengan Udara Terbersih se-Asia Tenggara",
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
                              "https://cdn-asset.jawapos.com/wp-content/uploads/2021/09/jalan-tunjungan.jpg"),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Kota Surabaya, Jawa Timur, berhasil meraih penghargaan ASEAN Environtmentally Sustainable City (ESC) kategori Udara Terbersih Kota Besar.",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "'Kota Surabaya dinilai mampu mengatasi emisi, polusi, dan itulah yang kita lakukan di Surabaya, sehingga mendapatkan penghargaan ini,' kata Wali Kota Surabaya Eri Cahyadi melalui siaran pers usai menerima penghargaan dalam acara “The 5 ASEAN ESC Award and the 4 Certificate of Recognition” di Jakarta, Kamis (21/10).",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Seusai menerima penghargaan itu, Wali Kota Eri mengatakan bahwa ada beberapa kategori dalam penghargaan ini, yaitu clean air, clean land, dan clean water. Sedangkan Kota Surabaya mendapatkan penghargaan dengan kategori clean air (udara bersih) di seluruh ASEAN."),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Menurut dia, penghargaan udara terbersih di tingkat ASEAN ini baru pertama diraih Kota Surabaya. Sebab, lanjut dia, selama ini Surabaya belum pernah mendapatkan penghargaan semacam ini di tingkat ASEAN. “Baru tahun 2021 ini kita dapat penghargaan ini,” katanya."),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
