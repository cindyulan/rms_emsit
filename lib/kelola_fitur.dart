import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rms_emsit/kelola_admin.dart';
import 'package:rms_emsit/round_button.dart';

class Kelola extends StatefulWidget {
  const Kelola({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KelolaState createState() => _KelolaState();
}

class _KelolaState extends State<Kelola> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  bool snowSpinner = false;
  final _formKey = GlobalKey<FormState>();
  String email = "", password = "";
  String successMessage = '';
  String errorMessage = '';

  void login() {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      toastMessage(value.user!.email.toString());
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => KelolaAdmin()));
    }).onError((error, stackTrace) {
      toastMessage(error.toString());
    });
  }

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: snowSpinner,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text('Masuk\nSekarang',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 245, 181, 87))),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'cindy@gmail.com',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 141, 140, 140),
                              ),
                              fillColor: Color.fromRGBO(246, 246, 246, 1),
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 232, 229, 229),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 232, 229, 229),
                                  width: 1.5,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 245, 181, 87),
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                            autofocus: false,
                            onChanged: (String value) {
                              email = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          TextFormField(
                            obscureText: _isHidePassword,
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: '******',
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 141, 140, 140),
                              ),
                              fillColor: const Color.fromRGBO(246, 246, 246, 1),
                              filled: true,
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 232, 229, 229),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 232, 229, 229),
                                  width: 1.5,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 245, 181, 87),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglePasswordVisibility();
                                },
                                child: Icon(
                                  _isHidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _isHidePassword
                                      ? Colors.grey
                                      : Colors.orange,
                                ),
                              ),
                              isDense: true,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String value) {
                              password = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          RoundButton(
                            title: 'Masuk',
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 150),
            Image.asset("assets/images/buttom.png", height: 82, width: 400),
          ]),
        ),
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
