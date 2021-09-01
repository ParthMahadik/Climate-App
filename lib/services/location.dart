import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() {
  try {
    Future<Position> position =
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  } catch (e) {
    print(e);
  }
}
