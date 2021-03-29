import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

class MapView extends StatefulWidget {
  double startLat,startLong,endLat,endLong;
  var apiKey;
  var directionsApiKey;
  List driversList;
  static String distanceBetweenLocations = "0.0";
  // String getDistance() => _distanceBetweenLocations;
  // String getTotalDistance() => _MapViewState
  // static _MapViewState _map_state;
  // MapView({@required this.startLat,@required this.startLong, @required this.endLat,@required this.endLong, @required this.apiKey,@required this.directionsApiKey})
  // {
  //   if (_map_state != null) {
  //     if(_map_state.mounted){
  //
  //       _map_state.setCustomMarker().then((value) {
  //         _map_state._getInitialLocation();
  //       });
  //
  //         }
  //   }
  // }
  //
  // @override
  // _MapViewState createState() {
  //   _map_state = _MapViewState();
  //   return _map_state;
  // }

  static _MapViewState _map_state;
  MapView({@required this.startLat,@required this.startLong, @required this.endLat,@required this.endLong, @required this.apiKey,@required this.directionsApiKey, @required this.driversList});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // Initial location of the Map view
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  Position startCoordinates;
  Position destinationCoordinates;
  Position driverLocation;

  // For controlling the view of the Map
  GoogleMapController mapController;
  // final Geolocator _geolocator = Geolocator();
  // For storing the current position
  Position _currentPosition;
  bool isFullScreen = false;

  Set<Marker> markers = {};
// Object for PolylinePoints
  PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting
// two points
  Map<PolylineId, Polyline> polylines = {};

  double _placeDistance = 0.0;
  @override
  void dispose() {
    super.dispose();
    polylines = _currentPosition = destinationCoordinates =startCoordinates = markers = widget.startLong = widget.startLat = widget.endLong = widget.endLat = null;
  }
  BitmapDescriptor pickupMarker;
  BitmapDescriptor dropoffMarker;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  onDriverMarkers() async{
    List drivers = widget.driversList;
    if(drivers.isNotEmpty){
    for(int i = 0; i< drivers.length; i++) {
      driverLocation = Position(latitude: drivers[i].latitude, longitude: drivers[i].longitude);
      final Uint8List dropoffMarker = await getBytesFromAsset(
          Assets.driverVehicleIcon, 40);
      markers.removeWhere((element) =>
      element.markerId.value == drivers[i].assignedDriverId.toString());
      Marker destinationMarker = Marker(
          markerId: MarkerId(drivers[i].assignedDriverId.toString()),
          position: LatLng(
            driverLocation.latitude,
            driverLocation.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Driver',
            snippet: drivers[i].assignedDriver,
          ),
          icon: await BitmapDescriptor.fromBytes(dropoffMarker)
      );
      markers.add(destinationMarker);
    }
    }
  }




  Future<void> setCustomMarker() async{
    startCoordinates = Position(latitude: widget.startLat, longitude: widget.startLong);
    destinationCoordinates = Position(latitude: widget.endLat, longitude: widget.endLong);
    final Uint8List pickupMarker = await getBytesFromAsset(Assets.pickupLocationImage, 40);
    final Uint8List dropoffMarker = await getBytesFromAsset(Assets.dropoffLocationImage, 40);
    // Start Location Marker
    if(widget.startLat != null) {
      Marker startMarker = Marker(
        markerId: MarkerId('$startCoordinates'),
        position: LatLng(
          startCoordinates.latitude,
          startCoordinates.longitude,
        ),
        infoWindow: InfoWindow(
          title: 'Start',
          snippet: "starting location",
        ),
        // icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), Assets.pickupLocationImage),
        icon: await BitmapDescriptor.fromBytes(pickupMarker)
        // icon: pickupMarker,
      );
// Destination Location Marker
      if (widget.endLong != null) {
        Marker destinationMarker = Marker(
          markerId: MarkerId('$destinationCoordinates'),
          position: LatLng(
            destinationCoordinates.latitude,
            destinationCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: "destination location",
          ),
          icon: await BitmapDescriptor.fromBytes(dropoffMarker)
        );
        markers.add(destinationMarker);
      }

      // Add the markers to the list
      markers.add(startMarker);
    }
    return;
  }

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
    _getInitialLocation();
    onDriverMarkers();
    setCustomMarker();
    _createPolylines(startCoordinates, destinationCoordinates);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _initialLocation,
              // initialCameraPosition: _currentPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              markers: markers != null ? Set<Marker>.from(markers) : null,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {mapController = controller;
              },
            ),

            // Design for current location button

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      // splashColor: Colors.red, // inkwell color
                      child: Image.asset(Assets.googleMapImage, width: 30, height: 30,),
                      onTap: () {
                        // on button tap
                        openMap();
                      },
                    ),
                    SizedBox(height: 10,),
                    ClipOval(
                      child: Material(
                        color: Colors.blueGrey, // button color
                        child: InkWell(
                          splashColor: Colors.red, // inkwell color
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: Icon(Icons.my_location,color: Colors.white,),
                          ),
                          onTap: () {
                            // on button tap
                            _getCurrentLocation();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    GestureDetector(
                      onTap: (){
                        zoomIn();
                      },
                      child: Container(
                        color: Colors.white,
                        child: Icon(Icons.zoom_in),
                      ),
                    ),
                    // SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        zoomOut();
                      },
                      child: Container(
                        color: Colors.white,
                        child: Icon(Icons.zoom_out),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
  zoomIn(){
    // Zoom In action
    mapController.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }
  zoomOut(){
    // Zoom Out action
    mapController.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }
  moveToNewPosition(_currentPosition){
    // Move camera to the specified latitude & longitude
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            // Will be fetching in the next step
            _currentPosition.latitude,
            _currentPosition.longitude,
          ),
          zoom: 18.0,
        ),
      ),
    );
  }
  openMap() async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${widget.endLat},${widget.endLong}';
    // String googleUrl = 'https://www.google.com/maps/search/?api=1&query=jinnbyte 227 DHA phase 4 lahore';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  _getInitialLocation() async{
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _initialLocation = CameraPosition(target: LatLng(position.latitude, position.longitude));
        widget.startLat != null?
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(widget.startLat, widget.startLong),//LatLng(position.latitude, position.longitude),
              zoom: 8.0,

            ),
          ),
        ):
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),//LatLng(position.latitude, position.longitude),
              zoom: 8.0,

            ),
          ),
        );
        print('CURRENT POS: $_currentPosition');// For moving the camera to current location

      });
    }).catchError((e) {
      print(e);
    });
  }


  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),//LatLng(position.latitude, position.longitude),
              zoom: 8.0,

            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }
  // Create the polylines for showing the route between two places

  _createPolylines(Position start, Position destination) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      widget.directionsApiKey, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColors.yellow,
      points: polylineCoordinates,
      width: 5,
    );

    // Adding the polyline to the map
    setState(() {
      polylines[id] = polyline;
      print("PLOYLINE DRAWN :::::::::::" + polyline.points.toString());
    });
    _viewBothCoordinates();
    getDistance();
  }
  ///////////////////////////////////////////////////////////////////////
  //                    Calculating the distance now
  ///////////////////////////////////////////////////////////////////////
  String getDistance() {
    if(polylineCoordinates.length == 0){
      double distanceInMeters = Geolocator.distanceBetween(
        widget.startLat,
        widget.startLong,
        widget.endLat,
        widget.endLong,
      );
      MapView.distanceBetweenLocations = (distanceInMeters / 1000).toStringAsFixed(2);
    }
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      _placeDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }

    MapView.distanceBetweenLocations = _placeDistance.toStringAsFixed(2);
    // ApplicationToast.onPayConfirmationAlert(context: context, onCancellLoad: null, text: "The distance is " + MapView.distanceBetweenLocations);
    return _placeDistance.toStringAsFixed(2);
  }
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _viewBothCoordinates(){
    // Calculating to check that
    // Define two position variables
    Position _northeastCoordinates;
    Position _southwestCoordinates;
// southwest coordinate <= northeast coordinate
    if (startCoordinates.latitude <= destinationCoordinates.latitude) {
      _southwestCoordinates = startCoordinates;
      _northeastCoordinates = destinationCoordinates;
    } else {
      _southwestCoordinates = destinationCoordinates;
      _northeastCoordinates = startCoordinates;
    }

// Accommodate the two locations within the
// camera view of the map
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(
            _northeastCoordinates.latitude,
            _northeastCoordinates.longitude,
          ),
          southwest: LatLng(
            _southwestCoordinates.latitude,
            _southwestCoordinates.longitude,
          ),
        ),
        100.0, // padding
      ),
    );
  }
}
