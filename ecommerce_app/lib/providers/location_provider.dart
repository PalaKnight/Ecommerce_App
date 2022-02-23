import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? currentLocation;

  Future<void> determineCurrentLocation() async {
    bool serviceEnabled = false;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services is disabled');

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever)
      return Future.error('Location services is denied forever');

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always ||
          permission != LocationPermission.whileInUse)
        Future.error('Location services is denied');
    }

    currentLocation = await Geolocator.getCurrentPosition();

    notifyListeners();
  }
}
