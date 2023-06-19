class RiwayatModel {
  late String newUrl;
  late String selectedValue;
  late String long;
  late String lat;
  late String keteranganController;
  late String formatted;
  late String status;
  late String valid;

  RiwayatModel({
    required this.newUrl,
    required this.selectedValue,
    required this.long,
    required this.lat,
    required this.keteranganController,
    required this.formatted,
    required this.status,
    required this.valid,
  });

  static RiwayatModel fromMap(Map<String, dynamic> map) {
    return RiwayatModel(
      newUrl: map['newUrl'],
      selectedValue: map['damage'],
      long: map['longitude'],
      lat: map['latitude'],
      keteranganController: map['keterangan'],
      formatted: map['date'],
      status: map['status'],
      valid: map['valid'],
    );
  }
}
