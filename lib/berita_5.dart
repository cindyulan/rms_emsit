import 'package:flutter/material.dart';

class Berita5 extends StatefulWidget {
  const Berita5({Key? key}) : super(key: key);

  @override
  State<Berita5> createState() => _Berita5State();
}

class _Berita5State extends State<Berita5> {
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
                  "Ketua DPRD Surabaya minta pencemaran udara di kawasan SIER diusut",
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
                              "https://img.antaranews.com/cache/800x533/2021/03/01/rapat-dengar-pendapat-limbah-debu_2.jpeg.webp"),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Ketua DPRD Kota Surabaya Adi Sutarwijono meminta Dinas Lingkungan Hidup dan Satpol PP Surabaya mengusut tuntas pencemaran udara berupa debu yang diduga akibat produksi pabrik di kawasan PT. Surabaya Industrial Estate Rungkut (SIER).",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "'Pencemaran itu tidak boleh terjadi lagi. Pabrik harus mengevaluasi standar produksi yang dijalankan. Fakta kasat mata, warga Rungkut Kidul diguyur abu dari limbah pabrik,' kata Adi Sutarwijono. Menurut dia, pabrik dipersilahkan memakai batu bara untuk bahan bakar. Tapi warga mempunyai hak untuk menghirup udara bersih, memakai air bersih, dan berada di lingkungan bersih. 'Jangan korbankan warga,' ujarnya.",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Untuk itu, lanjut dia, pihaknya sudah mendisposisikan surat ke Komisi A Bidang Hukum dan Pemerintahan DPRD Surabaya untuk menangani pengaduan warga yang mengeluhkan adanya limbah debu itu. "),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
