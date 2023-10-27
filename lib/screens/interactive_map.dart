import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:heritage_game/data/initial_data.dart';
import 'package:heritage_game/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({super.key});

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  final LocationService locationservice = LocationService();
  final Set<Marker> _markers = {};
  GoogleMapController? _controller;
  Position? currentPosition;

  void _addSiteMarkers() {
    for (var site in sites) {
      _markers.add(
        Marker(
          markerId: MarkerId(site.name),
          position:
              LatLng(site.location!['latitude']!, site.location!['longitude']!),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
  }

  void _centreLocation(LatLng location) {
    _controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 17,
        ),
      ),
    );
  }

  void _getUserLocation() async {
    Position position = await locationservice.getCurrentLocation();
    setState(() {
      currentPosition = position;
      _markers.add(
        Marker(
          markerId: const MarkerId('userLocation'),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(210.0),
        ),
      );
    });

    _centreLocation(
      LatLng(position.latitude, position.longitude),
    );
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _addSiteMarkers();
  }

  @override
  Widget build(BuildContext context) {
    if (currentPosition == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Find your location'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Location services may disabled, \nplease reset your privacy permissions.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Go back!')),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Find your location')),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target:
                  LatLng(currentPosition!.latitude, currentPosition!.longitude),
              zoom: 17,
            ),
            onMapCreated: (controller) => _controller = controller,
            markers: _markers,
          ),
          Positioned(
              top: 60,
              right: 10,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller!.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                    child: const Icon(Icons.zoom_in),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _controller!.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                    child: Icon(Icons.zoom_out),
                  ),
                ],
              )),
          Positioned(
            bottom: 50,
            left: 10,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: currentPosition == null
                      ? null
                      : () => _centreLocation(
                            LatLng(currentPosition!.latitude,
                                currentPosition!.longitude),
                          ),
                  child: const Text('You'),
                ),
                ...sites.map(
                  (site) => ElevatedButton(
                    onPressed: () => _centreLocation(
                      LatLng(
                        site.location!['latitude']!,
                        site.location!['longitude']!,
                      ),
                    ),
                    child: Text(site.name),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
