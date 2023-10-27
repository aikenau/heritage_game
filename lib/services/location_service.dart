import 'package:geolocator/geolocator.dart';
import 'package:heritage_game/models/site.dart';

class LocationService {
  double calculateDistanceTwoLocation(Site site, Position currentPosition) {
    return Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        site.location!['latitude']!,
        site.location!['longitude']!);
  }

  Future<Position> getCurrentLocation() async {
    await getLocationPermission();
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<LocationPermission> getLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error(
          'Location services are disabled, please reset your privacy permissions.');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error(
            'Location permissions are denied, please reset your privacy permissions.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are denied, please reset your privacy permissions.');
    }

    return permission;
  }
}
