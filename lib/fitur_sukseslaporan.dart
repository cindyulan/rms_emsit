// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rms_emsit/fitur_riwayatlaporan.dart';

class SuksesLaporan extends StatelessWidget {
  const SuksesLaporan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            Image.asset(
              "assets/images/sukses_kirim.png",
              height: 200,
              width: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24.0),
            ),
            const Text(
              "Laporan Berhasil",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6),
            ),
            const Text(
              "Terima kasih telah melapor",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                ),
                InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      margin: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 181, 87),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Kembali ke riwayat',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RiwayatLaporan()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
