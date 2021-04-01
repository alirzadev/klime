import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

class Location {
  static double longitude;
  static double latitude;

  Future<void> getLocation() async {
    // print('-------------------------------${GetStorage().read('lat')}');
    try {
      if (GetStorage().read('lat') != null &&
          GetStorage().read('lat') != null) {
        // print('====================USING IF====================');
        latitude = GetStorage().read('lat');
        longitude = GetStorage().read('lon');
      } else {
        // print('====================USING ELSE====================');

        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        if (position == null) {
          position = await Geolocator.getLastKnownPosition();
        }
        longitude = position.longitude;
        latitude = position.latitude;
        GetStorage().write('lon', longitude);
        GetStorage().write('lat', latitude);
      }
    } catch (e) {
      print('Exception caught in Location class ===> $e');
    }
  }
}
