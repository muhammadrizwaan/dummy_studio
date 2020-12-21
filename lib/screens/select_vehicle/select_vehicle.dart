import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_components.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../animations/slide_right.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';
import '../../widgets/common_widgets.dart';

class SelectVehicle extends StatefulWidget {
  String
      PickupLatitude,
      PickupLongitude,
      DropoffLatitude,
      DropoffLongitude,
      PickupLocation,
      DropoffLocation;

  SelectVehicle({
    @required this.PickupLatitude,
    @required this.PickupLongitude,
    @required this.DropoffLatitude,
    @required this.DropoffLongitude,
    @required this.PickupLocation,
    @required this.DropoffLocation,
  });

  @override
  _SelectVehicleState createState() => _SelectVehicleState();
}

class _SelectVehicleState extends State<SelectVehicle> {
  int _value = 1;

  SelectVechileComponents _selectVehicleComponents;
  SelectVehicleProvider _selectVehicleProvider;
  TextEditingController search;
  bool isSelect;
  String _selectedValue;
  int id, vehicleCategoryId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectVehicleProvider = Provider.of<SelectVehicleProvider>(context, listen: false);
    _selectVehicleProvider.init(context: context);
    _selectVehicleComponents = SelectVechileComponents();
    search = TextEditingController();
    id = 0;
    vehicleCategoryId = 0;
    isSelect = false;

  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SelectVehicleProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _selectVehicleProvider.isDataFetched
                ? Container(
                    height: AppSizes.height,
                    width: AppSizes.width,
                    color: AppColors.white,
                    child: Column(
                      children: [
                        CommonWidgets.tabsAppBar2(
                            text: "Book a Load - Vehicle Type",
                            onPress: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.width * 0.05),
                          child: _selectVehicleComponents.getTextField(
                            leftIcon: Assets.searchIcon,
                            textEditingController: search,
                            hintText: "Search",
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.width * 0.05,
                          ),
                          height: AppSizes.height * 0.06,
                          width: AppSizes.width,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              // border: Border.all(color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500].withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 0))
                              ]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                  height: AppSizes.height * 0.06,
                                  width: AppSizes.width * 0.06,
                                  child: Image.asset(
                                    Assets.vehicle,
                                    color: AppColors.colorBlack,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    isExpanded: true,
                                    value: _selectedValue,
                                    hint: TextView.getLightText04(
                                      "Select Vehicle Type",
                                      color: AppColors.colorBlack,
                                    ),
                                    items: _selectVehicleProvider.description
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: TextView.getLightText04(
                                          value,
                                          color: AppColors.colorBlack,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String value) {
                                      setState(() {
                                        _selectedValue = value;
                                      });
                                      _selectVehicleProvider.onGetVehicleById(context: context, vehicleId: _getVehicleTypeId());
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSizes.height * 0.02),
                        _selectVehicleProvider.isVehicleFetched? Expanded(
                          child: ListView.builder(
                            itemCount: _selectVehicleProvider.vehicleByVehicleIdResponse.result.length,
                              itemBuilder: (context, index){
                            return Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),
                                  _selectVehicleComponents.getVehicleDetail(
                                    leftIcon: _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleImage,
                                    vehicleType: _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleName,
                                    vehicleDetail: _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleCategory,
                                    Category: _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleType,
                                    onLoadDetail: () {
                                      setState(() {
                                        isSelect = true;
                                        id = _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleId;
                                        vehicleCategoryId = _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleCategoryId;
                                      });
                                      //show button
                                    },
                                    isSelect: id == _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleId? true:false,
                                    onAlert: () {
                                      ApplicationToast.onDescriptionAlert(
                                          context: context,
                                          description: _selectVehicleProvider.vehicleByVehicleIdResponse.result[index].vehicleDescription,
                                      );
                                      // ApplicationToast.onDescriptionAlert(
                                      //     context: context);
                                    },
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),

                                ],
                              ),
                            );
                          })
                        ):
                        Center(
                          child: Container(
                            height: AppSizes.height * 0.15,
                            // width: AppSizes.width,
                            // child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ))
                : Center(
                    child: Container(
                      height: AppSizes.height * 0.15,
                      child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
              isSelect?
              Container(
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
                          Navigator.push(
                              context,
                              SlideRightRoute(
                                  page: AddLoad(
                                      PickupLatitude: widget.PickupLatitude,
                                      PickupLongitude: widget.PickupLongitude,
                                      DropoffLatitude: widget.DropoffLatitude,
                                      DropoffLongitude: widget.DropoffLongitude,
                                      PickupLocation: widget.PickupLocation,
                                      DropoffLocation: widget.DropoffLocation,
                                      VehicleTypeId: _getVehicleTypeId(),
                                      VehicleCategoryId: vehicleCategoryId)));
                        },
                        child: TextView.getBottomButtonText04(
                          "Next",
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  int _getVehicleTypeId() {
    int tempGoodTypeId = 0;
    for (int i = 0;
        i < _selectVehicleProvider.getVehicleType().result.length;
        i++) {
      if (_selectedValue ==
          _selectVehicleProvider.getVehicleType().result[i].description) {
        tempGoodTypeId =
            _selectVehicleProvider.getVehicleType().result[i].vehicleTypeId;
        break;
      }
    }
    return tempGoodTypeId;
  }
}
