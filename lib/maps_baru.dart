import 'dart:async';
import 'dart:developer';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Mapsbaru extends StatefulWidget {
  const Mapsbaru({Key? key}) : super(key: key);

  @override
  State<Mapsbaru> createState() => _MapsbaruState();
}

Future<List<Post>> fetchPosts() async {
  http.Response response =
      await http.get(Uri.parse('http://emsit.co.id:8030/apps.php'));
  var responseJson = json.decode(response.body);

  return (responseJson['data'] as List).map((p) => Post.fromJson(p)).toList();
}

class Post {
  final String id, gambar, lat, lng, jalan, kota, rusak;

  Post({
    required this.id,
    required this.gambar,
    required this.lat,
    required this.lng,
    required this.jalan,
    required this.kota,
    required this.rusak,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'].toString(),
      gambar: json['gambar'].toString(),
      lat: json['Latitude'].toString(),
      lng: json['Longitude'].toString(),
      jalan: json['Jalan'].toString(),
      kota: json['Kota'].toString(),
      rusak: json['Kerusakan'].toString(),
    );
  }
}

class MapTypes {
  const MapTypes({required this.title});
  final String title;
}

const List<MapTypes> types = <MapTypes>[
  MapTypes(title: 'Surabaya'),
  MapTypes(title: 'Ponorogo'),
];

class _MapsbaruState extends State<Mapsbaru> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  static var _type = const CameraPosition(
    target: LatLng(-7.536064, 112.238402),
    zoom: 11,
  );
  var ids = [];
  var gambars = [];
  var lats = [];
  var lons = [];
  var kotas = [];
  var jalans = [];
  var rusaks = [];
  var markerfff = [];
  late List<Post> posts;
  late Future<List<Post>> futureAlbum;
  // final Set<Marker> markers = new Set(); //markers for google map
  final Marker markers = Marker(
    markerId: MarkerId(showLocation.toString()),
    position: const LatLng(-7.250445, 112.768845), //position of marker
    infoWindow: const InfoWindow(
      title: "kotas[0]",
      snippet: "rusaks[0]",
    ),
    icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  ); //markers for google map
  final List<Marker> _markers = <Marker>[];
  static const LatLng showLocation = LatLng(-7.250445, 112.768845);

  Future funcThatMakesAsyncCall() async {
    var data = await fetchPosts();
    if (data.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        ids.add(data[i].id);
        gambars.add(data[i].gambar);
        lats.add(data[i].lat);
        lons.add(data[i].lng);
        kotas.add(data[i].kota);
        jalans.add(data[i].jalan);
        rusaks.add(data[i].rusak);
        if (data[i].rusak == 'Lubang') {
          markerfff.add(BitmapDescriptor.defaultMarker);
        } else {
          markerfff.add(BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ));
        }
      }
      log(ids[0]);
      log(gambars[0]);
      log(lats[0]);
      log(lons[0]);
      log(kotas[0]);
      log(jalans[0]);
    }

    setState(() {
      for (var i = 0; i < data.length; i++) {
        _markers.add(Marker(
            markerId: MarkerId(ids[i].toString()),
            icon: markerfff[i],
            position: LatLng(double.parse(lats[i]), double.parse(lons[i])),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  width: 300,
                  height: 95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 230,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                // ignore: prefer_interpolation_to_compose_strings
                                "http://emsit.co.id:8030/gambar/" + gambars[i],
                              ),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Kota: " + kotas[i],
                                maxLines: 2,
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(fontSize: 14)),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Alamat: " + jalans[i],
                                maxLines: 2,
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(fontSize: 14)),
                                // widget.data!.date!,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Kerusakan: " + rusaks[i],
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LatLng(double.parse(lats[i]), double.parse(lons[i])),
              );
            }));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    funcThatMakesAsyncCall();
  }

  double zoomVal = 5.0;

  void _select(MapTypes types) async {
    setState(() {
      if (types.title == "Surabaya") {
        _type = const CameraPosition(
          target: LatLng(-7.250445, 112.768845),
          zoom: 11,
        );
        _customInfoWindowController.googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(const CameraPosition(
                target: LatLng(-7.250445, 112.768845), zoom: 10)));
        log("bisa");
      } else {
        _type = const CameraPosition(
            target: LatLng(-7.866688, 111.466614), zoom: 11);
        _customInfoWindowController.googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(const CameraPosition(
                target: LatLng(-7.866688, 111.466614), zoom: 10)));
      }
    });
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Google Maps",
          style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        // centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 210, 126, 1),
        actions: <Widget>[
          PopupMenuButton<MapTypes>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return types.map((MapTypes types) {
                return PopupMenuItem<MapTypes>(
                  value: types,
                  child: Text(types.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          // _zoomminusfunction(),
          // _zoomplusfunction(),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 340,
            width: 250,
            offset: 35,
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.hybrid,
        markers: Set<Marker>.of(_markers),
        initialCameraPosition: _type,
        onMapCreated: (GoogleMapController controller) {
          _customInfoWindowController.googleMapController = controller;
        },
        onTap: (position) {
          _customInfoWindowController.hideInfoWindow!();
        },
        onCameraMove: (position) {
          _customInfoWindowController.onCameraMove!();
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    _customInfoWindowController.googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}
