import 'package:flutter/material.dart';
import 'home_home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            "assets/images/onbor.png",
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Image.asset(
            "assets/images/onbo-1.png",
            width: 287,
            height: 241.53,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Column(
            children: <Widget>[
              InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 250.0,
                    height: 45.0,
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 181, 87),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) {
                        return const Home();
                      }),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
