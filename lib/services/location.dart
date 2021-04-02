import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

class MyLocation {
  static double longitude;
  static double latitude;

  Future<bool> checkPermission() async {
    if (await Geolocator.checkPermission() == LocationPermission.denied ||
        await Geolocator.checkPermission() == LocationPermission.deniedForever)
      return false;
    return true;
  }

  Future<bool> checkService() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> getLocation() async {
    // bool locService = await Geolocator.isLocationServiceEnabled();
    LocationPermission locPermission = await Geolocator.checkPermission();
    // print('====================================$locPermission');
    // print('-------------------------------${GetStorage().read('lat')}');
    // while (locPermission == LocationPermission.denied) {
    //   await Geolocator.requestPermission();
    //   locPermission = await Geolocator.checkPermission();
    // }
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
