import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_components.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';
import '../../widgets/common_widgets.dart';

class SelectVehicle extends StatefulWidget {
  String PickupLatitude,
      PickupLongitude,
      DropoffLatitude,
      DropoffLongitude,
      PickupLocation,
      DropoffLocation;
  int Distance;

  SelectVehicle(
      {@required this.PickupLatitude,
      @required this.PickupLongitude,
      @required this.DropoffLatitude,
      @required this.DropoffLongitude,
      @required this.PickupLocation,
      @required this.DropoffLocation,
      @required this.Distance});

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
  int id, vehicleCategoryId, vehicleTypeId;

  // var _responseList;

  @override
  void initState() {
    super.initState();
    _selectVehicleComponents = SelectVechileComponents();
    _search = TextEditingController();
    _selectVehicleProvider =
        Provider.of<SelectVehicleProvider>(context, listen: false);
    _selectVehicleProvider.init(context: context);
    id = 0;
    vehicleCategoryId = 0;
    vehicleTypeId = 0;
    isSelect = false;

    _search.addListener(() {
      if (_search.text.isEmpty) {
        // No need to Search
        _selectVehicleProvider.setFilteredList();
        setState(() {});
        return;
      }
      _selectVehicleProvider.filteredResult.result.clear();
      for (final listData
          in _selectVehicleProvider.getRidesByUserIdResponse().result) {
        if (_selectVehicleProvider.stringContains(
            listData.name, _search.text)) {
          _selectVehicleProvider.setIsDataLoaded(isVehicleFetched: true);
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
                            textEditingController: _search,
                            hintText: "Search",
                          ),
                        ),
                        SizedBox(height: AppSizes.height * 0.01),
                        _selectVehicleProvider.getIsVehicleFetched()
                            ? _selectVehicleProvider
                                        .getFilteredList()
                                        .result
                                        .length >
                                    0
                                ? Expanded(
                                    child: ListView.builder(
                                        itemCount: _selectVehicleProvider
                                            .getFilteredList()
                                            .result
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Column(
                                              children: [
                                                _selectVehicleComponents
                                                    .getGoodsType(
                                                  context: context,
                                                  onPress: () {
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        .unfocus();
                                                    _search.text = "";
                                                    isSelect = false;
                                                    vehicleTypeId =
                                                        _selectVehicleProvider
                                                            .getFilteredList()
                                                            .result[index]
                                                            .vehicleTypeId;
                                                    _selectVehicleProvider.onGetCategory(
                                                        context: context,
                                                        vehicleId:
                                                            _selectVehicleProvider
                                                                .getFilteredList()
                                                                .result[index]
                                                                .vehicleTypeId);
                                                  },
                                                  text: _selectVehicleProvider
                                                      .getFilteredList()
                                                      .result[index]
                                                      .name,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                                : Container()
                            : _selectVehicleProvider
                                        .getCategoryResponse()
                                        .result
                                        .length >
                                    0
                                ? Expanded(
                                    child: ListView.builder(
                                        itemCount: _selectVehicleProvider
                                            .getCategoryResponse()
                                            .result
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height:
                                                      AppSizes.height * 0.01,
                                                ),
                                                _selectVehicleComponents
                                                    .getVehicleDetail(
                                                  leftIcon:
                                                      _selectVehicleProvider
                                                          .getCategoryResponse()
                                                          .result[index]
                                                          .vehicleCategoryImage,
                                                  vehicleType:
                                                      _selectVehicleProvider
                                                          .getCategoryResponse()
                                                          .result[index]
                                                          .vehicleCategory,
                                                  vehicleDetail:
                                                      _selectVehicleProvider
                                                          .getCategoryResponse()
                                                          .result[index]
                                                          .vehicleType,
                                                  Category:
                                                      _selectVehicleProvider
                                                          .getCategoryResponse()
                                                          .result[index]
                                                          .vehicleType,
                                                  onLoadDetail: () {
                                                    setState(() {
                                                      isSelect = true;
                                                      id = _selectVehicleProvider
                                                          .getCategoryResponse()
                                                          .result[index]
                                                          .vehicleCategoryId;
                                                      vehicleCategoryId =
                                                          _selectVehicleProvider
                                                              .getCategoryResponse()
                                                              .result[index]
                                                              .vehicleCategoryId;
                                                    });
                                                  },
                                                  isSelect: id ==
                                                          _selectVehicleProvider
                                                              .getCategoryResponse()
                                                              .result[index]
                                                              .vehicleCategoryId
                                                      ? true
                                                      : false,
                                                  onAlert: () {
                                                    ApplicationToast
                                                        .onDescriptionAlert(
                                                      context: context,
                                                      description:
                                                          _selectVehicleProvider
                                                              .getCategoryResponse()
                                                              .result[index]
                                                              .vehicleDescription,
                                                    );
                                                  },
                                                ),
                                                SizedBox(
                                                  height:
                                                      AppSizes.height * 0.01,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                                : Container()
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
              child: isSelect
                  ? Container(
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

  onNavigateNest() {
    // _selectVehicleProvider.data = [];
    _selectVehicleProvider.notifyListeners();
    setState(() {
      isSelect = false;
      id = 0;
    });
    _selectVehicleProvider.onEstimatedRate(
      context: context,
      pickupLatitude: widget.PickupLatitude,
      pickupLongitude: widget.PickupLongitude,
      dropoffLatitude: widget.DropoffLatitude,
      dropoffLongitude: widget.DropoffLongitude,
      pickupLocation: widget.PickupLocation,
      dropoffLocation: widget.DropoffLocation,
      VehicleTypeId: vehicleTypeId,
      vehicleCategoryId: vehicleCategoryId,
      distance: widget.Distance,
    );
  }
}
