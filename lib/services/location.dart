import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position == null) {
        position = await Geolocator.getLastKnownPosition();
      }
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print('Exception caught in Location class ===> $e');
    }
  }
}
