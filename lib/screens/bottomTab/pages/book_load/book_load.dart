import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_provider.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/widgets/MapView.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import '../../../../animations/slide_right.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'dart:ui' as ui;
import '../../bottom_tab.dart';

class BookLoad extends StatefulWidget {
  @override
  _BookLoadState createState() => _BookLoadState();
}

class _BookLoadState extends State<BookLoad> {

  BookLoadComponents _bookLoadComponents;
  BookLoadProvider _bookLoadProvider;
  bool isPickUp, isDropOff;
  int count;
  String pickupText, dropoffText;
  GoogleMapsPlaces _places = GoogleMapsPlaces();
  String _apiKey = "AIzaSyAERKSFYMxdSR6mrMmgyesmQOr8miAFd4c";
  double pickup_latitude, pickup_longitude, dropoff_latitude, dropoff_longitude;
  String pickup_location;
  String dropoff_location;


  // maps data
  Set<Marker> markers = {};
  PolylinePoints polylinePoints;
// List of coordinates to join
  List<LatLng> polylineCoordinates = [];
  GoogleMapController mapController;
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  Map<PolylineId, Polyline> polylines = {};
  Position startCoordinates;
  Position destinationCoordinates;


  @override
  void initState() {
    super.initState();
    _bookLoadProvider = Provider.of<BookLoadProvider>(context, listen: false);
    _bookLoadProvider.init(context: context);
    _places = GoogleMapsPlaces(apiKey: _apiKey);
    isPickUp = true;
    count = 0;
    isDropOff = false;
    pickupText = "Select Pickup Location";
    dropoffText = "Select Dropoff Location";
    _bookLoadComponents = BookLoadComponents();
    // pickup_latitude = 32.166351;
    // pickup_longitude = 74.195900;
    // dropoff_latitude = 31.582045;
    // dropoff_longitude = 74.329376;
    pickup_latitude = null;
    pickup_longitude = null;
    dropoff_latitude = null;
    dropoff_longitude = null;
    pickup_location = "";
    dropoff_location = "";
    _getCurrentLocation();
  }

  setNotification(){
    Constants.setNotification(false);
    Navigator.push(context, SlideRightRoute(page: Notifications()));
    if(bottomTabState.mounted){
      bottomTabState.setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    polylines  = destinationCoordinates =startCoordinates = markers = pickup_longitude = pickup_latitude = dropoff_longitude = dropoff_latitude = null;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: AppSizes.height * 0.6,
                child: GoogleMap(
                  initialCameraPosition: _initialLocation,
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
              ),
              Positioned(
                top: 0,
                child: CommonWidgets.tabsAppBar1(
                  text: "Book a Load",
                  iconName: Constants.getNotification()  == false? Assets.notificationIcon: Assets.notificationReceiveIcon,
                  onPress: () {
                    setNotification();
                  },),
              ),

              DraggableScrollableSheet(
                initialChildSize: 0.32,
                minChildSize:  0.32,
                maxChildSize: 0.91,
                  builder:(BuildContext context, myScrollControler){
                  return Container(
                      height: AppSizes.height * 0.5,
                      padding: EdgeInsets.only(top: AppSizes.height * 0.01, bottom: AppSizes.height * 0.1),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              _bookLoadComponents.getSlidingUpLine(),
                              Expanded(
                                child: ListView(
                                  controller: myScrollControler,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: AppSizes.width * 0.05),
                                      child: Row(
                                        children: [
                                          _bookLoadComponents.getLocationImage(),
                                          SizedBox(width: AppSizes.width * 0.02),
                                          Column(
                                            children: [
                                              _bookLoadComponents.onLocationPickerButton(
                                                context: context,
                                                buttonId: 1,
                                                onPress: () async {
                                                  Prediction p =
                                                  await PlacesAutocomplete.show(
                                                      context: context, apiKey: _apiKey);
                                                  onDisplayPrediction(p, isDeparture: true);
                                                },
                                                text: pickupText,
                                                isSelected: isPickUp,
                                              ),
                                              SizedBox(height: AppSizes.height * 0.02),
                                              _bookLoadComponents.onLocationPickerButton(
                                                context: context,
                                                buttonId: 2,
                                                onPress: () async {
                                                  Prediction p =
                                                  await PlacesAutocomplete.show(
                                                      context: context, apiKey: _apiKey);
                                                  onDisplayPrediction(p, isDeparture: false);
                                                },
                                                text: dropoffText,
                                                isSelected: isDropOff,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    _bookLoadComponents.getHorizontalLine(),
                                    SizedBox(height: AppSizes.height * 0.02),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppSizes.width * 0.05),
                                      child: _bookLoadComponents.getLocationPickupText(
                                          text: "Recent Locations"),
                                    ),
                                    Wrap(
                                      children: [
                                        ...List.generate(
                                            10,
                                                (index) => Column(
                                              children: [
                                                _bookLoadComponents.getHistroyText(
                                                    context: context, text: "at Khor Fakkan"),
                                                SizedBox(height: AppSizes.height *0.01),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                                                  height: 1,
                                                  color: AppColors.grey,
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                    },
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child:
                  Container(
                    // height: AppSizes.height * 0.07,
                    color: AppColors.white,
                    child: Container(
                      height: AppSizes.height * 0.07,
                      margin: EdgeInsets.only(
                          bottom: AppSizes.width * 0.03,
                          left: AppSizes.width * 0.05,
                          right: AppSizes.width * 0.05),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(
                          08,
                        ),
                      ),
                      width: AppSizes.width,
                      child: FlatButton(
                        onPressed: () {
                          _bookLoadProvider.onNavigateNext(
                              context: context,
                              pickup_latitude: pickup_latitude.toString(),
                              pickup_longitude: pickup_longitude.toString(),
                              dropoff_latitude: dropoff_latitude.toString(),
                              dropoff_longitude: dropoff_longitude.toString(),
                              pickup_location: pickup_location,
                              dropoff_location: dropoff_location,
                              distance: double.parse(MapView.distanceBetweenLocations).toInt()
                          );
                        },
                        child: TextView.getBottomButtonText04(
                          "Next",
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
    );

  }



  Future<Null> onDisplayPrediction(Prediction p,
      {@required bool isDeparture}) async {
    if (isDeparture) {
      if (p != null) {
        PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);

        var placeId = p.placeId;
        double lat = detail.result?.geometry?.location?.lat;
        double lng = detail.result?.geometry?.location?.lng;

        var address = await Geocoder.local.findAddressesFromQuery(p.description);
        print('pickup location');
        print(address);
        pickupText = address.first.addressLine;
        pickup_location = address.first.addressLine;
        pickup_latitude = lat;
        pickup_longitude = lng;
        isPickUp = true;
        onLocationChange();
      } else {
        print("pridiction is null");
      }
    } else {
      //selected city is destination/to city
      if (p != null) {
        PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId);

        var placeId = p.placeId;
        double lat = detail.result.geometry.location.lat;
        double lng = detail.result.geometry.location.lng;

        var address =
        await Geocoder.local.findAddressesFromQuery(p.description);
        // this.dropoff_location = address.first.locality ?? address.first.addressLine;
        print('dropoff location');
        print(lat);
        print(lat);
        dropoffText = address.first.addressLine;
        dropoff_location = address.first.addressLine;
        dropoff_latitude = lat;
        dropoff_longitude = lng;
        isDropOff = true;
        onLocationChange();
      } else {
        print("pridiction is null");
      }
    }
  }


  onLocationChange() async{
    if(pickup_latitude != null && dropoff_latitude == null){
      await setPickerMarker();
      onMove(pickup_latitude, pickup_longitude);
    }
    else if(pickup_latitude == null && dropoff_latitude != null){
      await setDropoffMarker();
      onMove(dropoff_latitude, dropoff_longitude);
    }
    else if(pickup_latitude != null && dropoff_latitude != null){
      await setPickerMarker();
      await setDropoffMarker();
      _createPolylines(startCoordinates, destinationCoordinates);
    }

  }


  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
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
  onMove(double lat, double long) async {
    setState(() {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, long),//LatLng(position.latitude, position.longitude),
            zoom: 8.0,
          ),
        ),
      );
    });
  }

  setPickerMarker() async{
    // markers = {};
    markers.removeWhere((element) => element.markerId.value == 'startMarkerPic');
    startCoordinates = Position(latitude: pickup_latitude, longitude: pickup_longitude);
    final Uint8List pickupMarker = await getBytesFromAsset(Assets.pickupLocationImage, 40);
    Marker startMarker = Marker(
        markerId: MarkerId('startMarkerPic'),
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
    markers.add(startMarker);
  }

  setDropoffMarker()async{
    // markers = {};
    destinationCoordinates = Position(latitude: dropoff_latitude, longitude: dropoff_longitude);
    final Uint8List dropoffMarker = await getBytesFromAsset(Assets.dropoffLocationImage, 40);
    markers.removeWhere((element) => element.markerId.value == 'destinationMarkerPic');
    Marker destinationMarker = Marker(
        markerId: MarkerId('destinationMarkerPic'),
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

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  _createPolylines(Position start, Position destination) async {
    polylines = {};
    polylineCoordinates.clear();
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      getDirectionsApi, // Google Maps API Key
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
  }
  _viewBothCoordinates(){

    LatLngBounds latLngBounds;
    if (startCoordinates.latitude > destinationCoordinates.latitude && startCoordinates.longitude > destinationCoordinates.longitude) {
      latLngBounds = LatLngBounds(southwest: LatLng(destinationCoordinates.latitude, destinationCoordinates.longitude), northeast: LatLng(startCoordinates.latitude, startCoordinates.longitude));
    }
    else if(startCoordinates.longitude > destinationCoordinates.longitude){
      latLngBounds = LatLngBounds(southwest: LatLng(startCoordinates.latitude, destinationCoordinates.longitude), northeast: LatLng(destinationCoordinates.latitude, startCoordinates.longitude));
    }
    else if(startCoordinates.latitude > destinationCoordinates.latitude){
      latLngBounds = LatLngBounds(southwest: LatLng(destinationCoordinates.latitude, startCoordinates.longitude), northeast: LatLng(startCoordinates.latitude, destinationCoordinates.longitude));
    }
    else{
      latLngBounds = LatLngBounds(southwest: LatLng(startCoordinates.latitude, startCoordinates.longitude), northeast: LatLng(destinationCoordinates.latitude, destinationCoordinates.longitude));
    }

    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        latLngBounds,
        100.0, // padding
      ),
    );
  }
}
