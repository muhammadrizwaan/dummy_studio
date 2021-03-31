
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/confirmBookLoad/confirm_book_load.dart';
import 'package:truckoom_shipper/utilities/toast.dart';

class BookLoadProvider extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}){
    this.context = context;
  }

  Future onNavigateNext({
    @required BuildContext context,
    @required String pickup_latitude,
    @required String pickup_longitude,
    @required String dropoff_latitude,
    @required String dropoff_longitude,
    @required String pickup_location ,
    @required String dropoff_location,
    @required int distance
  }) async{
    if(pickup_location.isEmpty || pickup_latitude.isEmpty || pickup_longitude.isEmpty){
      ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.pickupLocationErrorText);
    }
    else if(dropoff_location.isEmpty || dropoff_latitude.isEmpty || dropoff_longitude.isEmpty){
      ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.dropoffLocationErrorText);
    }
    else{
      Navigator.push(
          context,
          SlideRightRoute(
              page: ConfirmBookLoad(
                PickupLatitude: pickup_latitude,
                PickupLongitude: pickup_longitude,
                DropoffLatitude: dropoff_latitude,
                DropoffLongitude: dropoff_longitude,
                PickupLocation: pickup_location,
                DropoffLocation: dropoff_location,
                Distance: distance
              ),
          ),
      );
    }

  }
}