import 'package:geolocator/geolocator.dart';

class Location {
  double? latitute;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitute = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
