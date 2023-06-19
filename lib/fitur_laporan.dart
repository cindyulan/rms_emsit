import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rms_emsit/fitur_jenislaporan.dart';
import 'package:rms_emsit/home_home.dart';

class DaftarLaporan extends StatefulWidget {
  const DaftarLaporan({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DaftarLaporanState createState() => _DaftarLaporanState();
}

class _DaftarLaporanState extends State<DaftarLaporan> {
  // function to implement the google signin

// creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => JenisLaporan()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

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
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home
                  ()),
                  (route) => false);
            }),
        title: Text(
          "Login",
          style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        // centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 210, 126, 1),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Image.asset("assets/images/topleft.png",
                      height: 95, width: 100, alignment: Alignment.topLeft),
                  _titleDescription(),
                  Image.asset("assets/images/laporan.png",
                      height: 200, width: 206, alignment: Alignment.center),
                  _buildButton(context),
                  Image.asset(
                    "assets/images/buttomright.png",
                    height: 95,
                    width: 100,
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleDescription() {
    return Container(
      margin: const EdgeInsets.all(15),
      alignment: Alignment.center,
      width: 50,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Masuk\nSekarang',
            style: TextStyle(
              color: Color.fromARGB(255, 245, 181, 87),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              signup(context);
            },
            icon: const ImageIcon(
              AssetImage("assets/images/google.png"),
              size: 24,
            ),
            label: const Text('Sign In with Google',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 245, 181, 87),
              fixedSize: const Size(343, 40),
            ),
          ),
        ],
      ),
    );
  }
}
