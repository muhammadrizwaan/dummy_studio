
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Drivers extends StatefulWidget {
  int loadId;
  Drivers({@required this.loadId});
  @override
  _DriversState createState() => _DriversState();
}

class _DriversState extends State<Drivers> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.tabsAppBar2(
                    text: 'Drivers & Vehicles',
                    onPress: (){
                      Navigator.pop(context);
                    }
                ),
              ],
            ),
          ),
        ),
    );
  }
}
