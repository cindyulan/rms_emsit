import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
          "Bantuan",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(245, 210, 126, 1),
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Appissue()));
          },
          child: const ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text(
              'Masalah Aplikasi',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.chevron_right_rounded),
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Ttgfitur()));
          },
          child: const ListTile(
            leading: Icon(Icons.apps_rounded),
            title: Text(
              'Tentang Fitur',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Ttgemsit()));
          },
          child: const ListTile(
            leading: ImageIcon(
              AssetImage("assets/images/EMSiT_size.png"),
              color: Colors.green,
            ),
            title: Text(
              'Tentang EMSiT',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ),
      ]),
    );
  }
}

class Appissue extends StatelessWidget {
  Appissue({Key? key}) : super(key: key);
  TextEditingController bantuanController = TextEditingController();
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
          "Masalah Aplikasi",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(245, 210, 126, 1),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Masalah Interface",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "Jika Anda memiliki masalah dengan interface aplikasi EMSiT seperti:",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text(
                          "Laporan dibuat tetapi tidak ditampilkan di riwayat",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text(
                          "Tidak bisa menggunakan fitur maps kerusakan jalan",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text("Tidak bisa menggunakan fitur kualitas udara",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text("Tidak bisa menggunakan fitur kualitas udara",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text("Laporan sudah dibuat tetapi ditampilkan",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text(
                          "Tidak dapat memuat lokasi saat melakukan laporan",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text("Laporan sudah dibuat tetapi ditampilkan",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text("Gambar tidak dapat dimuat dilaporan",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: 'Pastikan ',
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'koneksi internet dan GPS aktif stabil. Setelah itu, Anda dapat menutup paksa aplikasi EMSiT Anda dan menghapus cache. Pastikan juga versi aplikasi EMSiT yang Anda miliki adalah versi terbaru.',
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(top: 10)),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text:
                        'Harap laporkan kepada kami mengenai masalah antarmuka apa pun yang Anda alami dengan mengeklik tombol di bawah ',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "'Butuh bantuan lebih lanjut?'.",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Masalah GPS",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "Jika Anda mengalami masalah seperti Lokasi GPS tidak akurat atau tidak terdeteksi saat menggunakan aplikasi EMSiT, Anda dapat mengatasinya dengan langkah-langkah berikut:",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text(
                          "Matikan GPS dan nyalakan lagi, atau Anda dapat memulai ulang perangkat Anda",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text(
                          "Pastikan internet Anda aktif dan konektivitas Anda stabil",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text(
                          "Pastikan sinyal konektivitas perangkat Anda tinggi",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(
                      child: Text("Pastikan koneksi Anda pada 3G, H, atau 4G",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "Tetapkan Lokasi Anda di menu pengaturan telepon Anda dengan mengikuti langkah-langkah ini",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "Gunakan koneksi wifi terdekat, hal ini mungkin terjadi karena koneksi provider yang lambat di area Anda",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text:
                        'Jika masalah masih berlanjut setelah Anda melakukan hal-hal di atas, laporkan kepada kami dengan mengeklik tombol di bawah ',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "'Butuh bantuan lebih lanjut?'.",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      TextSpan(
                        text: ' sehingga kami dapat membantu Anda.',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Butuh bantuan lebih lanjut?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  controller: bantuanController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Deskripsi',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 141, 140, 140),
                    ),
                    fillColor: Color.fromRGBO(246, 246, 246, 1),
                    filled: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 232, 229, 229),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 232, 229, 229),
                        width: 1.5,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  autofocus: false,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime now = DateTime.now();
                    final DateFormat formatter =
                        DateFormat('yyyy-MM-dd hh:mm:ss');
                    final String formatted = formatter.format(now);

                    final postRef = FirebaseDatabase(
                            databaseURL:
                                "https://rms-emsit-default-rtdb.asia-southeast1.firebasedatabase.app/")
                        .reference()
                        .child('Bantuan');
                    String? reportId = postRef.push().key;
                    await postRef.child(reportId!).set({
                      'reportId': reportId.toString(),
                      'date': formatted.toString(),
                      'keterangan': bantuanController.text.toString(),
                    }).then((value) {
                      toastMessage('Sukses');
                      Navigator.pop(context);
                    }).onError((error, stackTrcae) {
                      toastMessage(error.toString());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 245, 181, 87),
                    fixedSize: const Size(306, 40),
                  ),
                  child: const Text(
                    "Kirim",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class Ttgfitur extends StatelessWidget {
  const Ttgfitur({Key? key}) : super(key: key);

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
          "Tentang Fitur",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(245, 210, 126, 1),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "Tentang Fitur",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                "Emsit terdapat 5 fitur yaitu:",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                textAlign: TextAlign.justify,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    "1. ",
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Expanded(
                    child: Text("Maps Kerusakan Jalan",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Pada maps kerusakan jalan anda dapat mencari jalan rusak yang ada di kota surabaya dan ponorogo. Pada maps ini terdapat 2 marker dengan warna yang berbeda. warna merah menunjukkan pada titik tersebut terdapat lubang. Sedangkan untuk marker yang berwarna hijau menunjukkan pada titik tersebut terdapat retak. Pada maps kerusakan jalan ini Anda akan mendapatkan informasi mengenai alamat dan kerusakan jalan.",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                textAlign: TextAlign.justify,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    "2. ",
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Expanded(
                    child: Text("Maps Kualitas Udara",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Pada maps kualitas udara Anda dapat memantau kualitas udara suatu daerah. Informasi yang disampaikan yaitu kondisi wilayah (baik, sedang, tidak sehat, sangat tidak sehat dan bahaya), nilai dari gas dan partikel PM10, PM2.5, NO2, SO2, CO, dan O3 serta kelembapan.",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                textAlign: TextAlign.justify,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    "3. ",
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Expanded(
                    child: Text("Laporan",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Pada fitur laporan, Anda dapat melaporkan terkait jalan rusak dengan melakukan sign-in melalui akun google. Setelah melakukan Sign-In Anda akan di arahkan untuk ke halaman riwayat laporan Anda. Pada halaman riwayat terdapat 2 tombol yaitu Logout atau tombol '+' untuk membuat laporan. Saat Anda menekan tombol '+' akan akan diarahkan untuk mengisi form. Form tersebut berisi foto kerusakan jalan, alamat kerusakan jalan, keterangan dan jenis laporan. Ketika sudah dikirim maka laporan tersebut akan muncul pada halaman riwayat Anda. Anda dapat mengetahui status dari laporan Anda apakah belum, diproses atau selesai ditindaklanjuti. ",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                textAlign: TextAlign.justify,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    "4. ",
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Expanded(
                    child: Text("Berita",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Pada fitur berita, Anda dapat menemukan artikel terkait topik kerusakan jalan dan kualitas udara.",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                textAlign: TextAlign.justify,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    "5. ",
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Expanded(
                    child: Text("Kelola",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Pada fitur Kelola hanya dikhususkan untuk admin saja sehingga user tidak dapat menjalankan fitur ini.",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                textAlign: TextAlign.justify,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class Ttgemsit extends StatelessWidget {
  const Ttgemsit({Key? key}) : super(key: key);

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
          "Tentang EMSiT",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(245, 210, 126, 1),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset("assets/images/EMSiT_size.png"),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "EMSiT adalah perusahaan rintisan yang didedikasikan untuk mengembangkan produk cerdas seperti deteksi lubang jalan raya dan pemantauan kualitas udara secara mobile. Kami memusatkan pada pemrosesan gambar Kecerdasan Buatan (AI) real-time dan pemantauan kualitas udara berbasis mobile menggunakan perangkat instan plug-and-play, data observasi akurat yang ramah pengguna, dan jangkauan komunikasi yang luas dan terjangkau.",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
