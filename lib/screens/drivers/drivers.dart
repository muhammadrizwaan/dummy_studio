
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/screens/drivers/drivers_components.dart';
import 'package:truckoom_shipper/screens/drivers/drivers_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';

class Drivers extends StatefulWidget {
  int loadId;
  Drivers({@required this.loadId});
  @override
  _DriversState createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  DriversCompnents _driversCompnents;
  DriversProvider _driversProvider;
  @override
  void initState() {
    super.initState();
    _driversCompnents = DriversCompnents();
    _driversProvider = Provider.of<DriversProvider>(context, listen: false);
    _driversProvider.init(context: context, loadId: widget.loadId);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<DriversProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.white,
            child: _driversProvider.isDataFetched?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.tabsAppBar2(
                    text: 'Drivers & Vehicles',
                    onPress: (){
                      Navigator.pop(context);
                    }
                ),
                _driversCompnents.getAssignTable(),
                Expanded(
                    child: ListView.builder(
                      itemCount: _driversProvider.getDriverList().result.length,
                        itemBuilder: (context, index){
                          return _driversCompnents.getTableData(
                            sr:  index,
                            driver: _driversProvider.getDriverList().result[index].driverName,
                            vehicle: _driversProvider.getDriverList().result[index].vehicleName,
                            status: _driversProvider.getDriverList().result[index].status,
                            onPress: (){
                              Navigator.push(context, SlideRightRoute(page: DriverDetailScreen(driverId:_driversProvider.getDriverList().result[index].assignedDriverId)));
                            }
                          );
                        },
                    )
                ),

              ],
            ):
            Center(
              child: Container(
                height: AppSizes.height * 0.15,
                // width: AppSizes.width,
                child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
    );
  }
}
