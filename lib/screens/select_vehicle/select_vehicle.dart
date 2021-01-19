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
  TextEditingController _search;
  bool isSelect;
  String _selectedValue;
  int id, vehicleCategoryId;

  // var _responseList;

  @override
  void initState() {
    super.initState();
    _selectVehicleComponents = SelectVechileComponents();
    _search = TextEditingController();
    _selectVehicleProvider = Provider.of<SelectVehicleProvider>(context, listen: false);
    _selectVehicleProvider.init(context: context);
    id = 0;
    vehicleCategoryId = 0;
    isSelect = false;

    _search.addListener(() {
      if(_search.text.isEmpty){
        // No need to Search
        _selectVehicleProvider.setFilteredList();
        setState(() {});
        return;
      }
      _selectVehicleProvider.filteredResult.result.clear();
      for(final listData in _selectVehicleProvider.getRidesByUserIdResponse().result){
          if (_selectVehicleProvider.stringContains(listData.vehicleCategory, _search.text)) {
            _selectVehicleProvider.setData(listData);
          }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _selectVehicleProvider.setIsDataLoaded(isVehicleFetched: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SelectVehicleProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _selectVehicleProvider.isDataFetched ?
                Container(
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
                        textEditingController: _search,
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
                                    isSelect = false;
                                  });
                                  _selectVehicleProvider.onGetVehicleById(
                                      context: context,
                                      vehicleId: _getVehicleTypeId());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSizes.height * 0.02),
                    Expanded(
                        child: _selectVehicleProvider.getIsVehicleFetched() ?
                        ListView.builder(
                            itemCount: _selectVehicleProvider.getFilteredList().result.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: AppSizes.height * 0.01,
                                    ),
                                    _selectVehicleComponents.getVehicleDetail(
                                      leftIcon: _selectVehicleProvider.getFilteredList().result[index].vehicleCategoryImage,
                                      vehicleType: _selectVehicleProvider.getFilteredList().result[index].vehicleCategory,
                                      vehicleDetail: _selectVehicleProvider.getFilteredList().result[index].vehicleType,
                                      Category: _selectVehicleProvider.getFilteredList().result[index].vehicleType,
                                      onLoadDetail: () {
                                        setState(() {
                                          isSelect = true;
                                          id = _selectVehicleProvider.getFilteredList().result[index].vehicleCategoryId;
                                          vehicleCategoryId = _selectVehicleProvider.getFilteredList().result[index].vehicleCategoryId;
                                        });
                                      },
                                      isSelect: id == _selectVehicleProvider.getFilteredList().result[index].vehicleCategoryId ? true : false,
                                      onAlert: () {
                                        ApplicationToast.onDescriptionAlert(
                                          context: context,
                                          description: _selectVehicleProvider.getFilteredList().result[index].vehicleDescription,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: AppSizes.height * 0.01,
                                    ),

                                  ],
                                ),
                              );
                            }):
                        Center(
                          child: Container(
                            height: AppSizes.height * 0.15,
                            // width: AppSizes.width,
                            child: CommonWidgets.onNullData(text: "No Vehicles Available"),
                          ),
                        ),
                    ) ,
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
              isSelect ?
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
                    onNavigateNest();
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
    for (int i = 0; i < _selectVehicleProvider.getVehicleType().result.length; i++) {
      if (_selectedValue ==
          _selectVehicleProvider
              .getVehicleType()
              .result[i].description) {
        tempGoodTypeId =
            _selectVehicleProvider
                .getVehicleType()
                .result[i].vehicleTypeId;
        break;
      }
    }
    return tempGoodTypeId;
  }

  onNavigateNest() {
    // _selectVehicleProvider.data = [];
    _selectVehicleProvider.notifyListeners();
    setState(() {
      isSelect = false;
      id = 0;
    });
    _selectVehicleProvider.onEstimatedRate(context: context,
        pickupLatitude: widget.PickupLatitude,
        pickupLongitude: widget.PickupLongitude,
        dropoffLatitude: widget.DropoffLatitude,
        dropoffLongitude: widget.DropoffLongitude,
        pickupLocation: widget.PickupLocation,
        dropoffLocation: widget.DropoffLocation,
        VehicleTypeId: _getVehicleTypeId(),
        vehicleCategoryId: vehicleCategoryId);
  }
}
