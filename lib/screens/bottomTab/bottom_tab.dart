import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_components.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/history/history.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
import 'package:truckoom_shipper/screens/invoice/invoice.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/referrals/referrals.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  BottomTabComponents _bottomTabComponents;
  TextEditingController search;
  int _currentIndex = 0;

  @override
  void initState() {
    _bottomTabComponents = BottomTabComponents();
    search = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: _bottomNavigationContainer(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.bookLoadIcon,
                    height: 40,
                    width: 50,
                    color:
                        _currentIndex == 0 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "Book Load",
                  style: TextStyle(
                    color:
                        _currentIndex == 0 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.jobsIcon,
                    height: 40,
                    width: 50,
                    color:
                        _currentIndex == 1 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "My Jobs",
                  style: TextStyle(
                    color:
                        _currentIndex == 1 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.transactionIcon,
                    height: 40,
                    width: 50,
                    color:
                        _currentIndex == 2 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "Transactions",
                  style: TextStyle(
                    color:
                        _currentIndex == 2 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  child: Image.asset(
                    Assets.moreIcon,
                    height: 40,
                    width: 50,
                    color:
                        _currentIndex == 3 ? AppColors.yellow : AppColors.grey,
                  ),
                ),
                title: Text(
                  "More",
                  style: TextStyle(
                    color:
                        _currentIndex == 3 ? AppColors.yellow : AppColors.grey,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _bottomNavigationContainer() {
    if (_currentIndex == 0) {
      return Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            children: [
              CommonWidgets.tabsAppBar2(
                  text: "Book a Load - Vehicle Type",
                  iconName: Assets.backArrow,
                  onPress: () {
                    Navigator.pop(context);
                  }),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                child: _bottomTabComponents.getTextField(
                    leftIcon: Assets.searchIcon,
                    textEditingController: search,
                    hintText: "Search"),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppSizes.height * 0.03,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg'),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              _alertDialogueContainer();
                            },
                            child: _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg',
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg'),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg'),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg'),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg'),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg'),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: 'Weight Capacity: 22kg'),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ));
    } else if (_currentIndex == 1) {
      return Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets.tabsAppBar1(
                  text: "My Jobs", iconName: Assets.walletIcon, onPress: () {}),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: AppSizes.height * 0.03,
              ),
              _bottomTabComponents.getSelectViewText(),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                child: Row(
                  children: [
                    _bottomTabComponents.onSelectViewType(
                        text: "Active", onPress: () {}),
                    SizedBox(
                      width: AppSizes.width * 0.02,
                    ),
                    _bottomTabComponents.onSelectViewType(
                        text: "In Processing", onPress: () {}),
                    SizedBox(
                      width: AppSizes.width * 0.02,
                    ),
                    _bottomTabComponents.onSelectViewType(
                        text: "Completed", onPress: () {}),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppSizes.width * 0.05),
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "1100 KG Container - Port Pickup",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug, 12:00am",
                              endDate: "12 Aug, 11:00pm",
                              status: "Active",
                              onEdit: () {},
                              onDelete: () {}),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ));
    } else if (_currentIndex == 2) {
      //    Transaction  Screen

      return Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            children: [
              CommonWidgets.tabsAppBar1(
                  text: "Transaction",
                  iconName: Assets.bellIconUnpress,
                  onPress: () {
                    Navigator.push(
                        context, SlideRightRoute(page: Notifications()));
                  }),
              Divider(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppSizes.width * 0.05),
                      child: Column(children: [
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _bottomTabComponents.getTransectionsContainer(
                          jobDetail: "1100 KG Container",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          onInvoice: () {
                            Navigator.push(
                                context, SlideRightRoute(page: Invoice()));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _bottomTabComponents.getTransectionsContainer(
                          jobDetail: "1100 KG Container",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          onInvoice: () {
                            Navigator.push(
                                context, SlideRightRoute(page: Invoice()));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _bottomTabComponents.getTransectionsContainer(
                          jobDetail: "1100 KG Container",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          onInvoice: () {
                            Navigator.push(
                                context, SlideRightRoute(page: Invoice()));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _bottomTabComponents.getTransectionsContainer(
                          jobDetail: "1100 KG Container",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          onInvoice: () {
                            Navigator.push(
                                context, SlideRightRoute(page: Invoice()));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ));
    } else if (_currentIndex == 3) {
      //   More component

      return Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            children: [
              CommonWidgets.tabsAppBar1(
                  text: "More",
                  iconName: Assets.bellIconUnpress,
                  onPress: () {
                    Navigator.push(
                        context, SlideRightRoute(page: Notifications()));
                  }),
              Divider(
                height: 10,
              ),
              _bottomTabComponents.getProfileContainer(
                  ProfileImg: Assets.profileImg,
                  name: 'Matthew',
                  email: 'Matthew@gmail.com',
                  onPress: () {
                    Navigator.push(
                        context, SlideRightRoute(page: IndividualProfile()));
                  }),
              Divider(
                height: 10,
              ),
              _bottomTabComponents.touchableButton(
                  text: 'History',
                  onPress: () {
                    Navigator.push(context, SlideRightRoute(page: History()));
                  }),
              Divider(
                height: 10,
              ),
              _bottomTabComponents.touchableButton(
                  text: 'Referrals',
                  onPress: () {
                    Navigator.push(context, SlideRightRoute(page: Referrals()));
                  }),
              Divider(
                height: 10,
              ),
              _bottomTabComponents.touchableButton(
                  text: 'Contact Us', onPress: () {}),
              Divider(
                height: 10,
              ),
              _bottomTabComponents.getSOSbutton(text: 'SOS', onPress: () {})
            ],
          ));
    }
  }

  _alertDialogueContainer() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.12,
                        right: AppSizes.width * 0.12,
                        top: AppSizes.width * 0.07,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.04,
                      ),
                      height: AppSizes.height * 0.30,
                      width: AppSizes.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                    margin:
                                    EdgeInsets.only(left: AppSizes.width * 0.025),
                                    child: CommonWidgets.getLableText(
                                        text: "Vehicle Type")),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppSizes.height * 0.01,
                                      left: AppSizes.width * 0.025),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.transparentColor),
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.alertContainer),
                                  child: ExpansionTile(
                                    title: Container(
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(FontAwesomeIcons.truck),
                                                  SizedBox(
                                                    width: AppSizes.width * 0.05,
                                                  ),
                                                  Text(
                                                    "Reefers",
                                                    style: TextStyle(
                                                      decoration:
                                                      TextDecoration.none,
                                                      fontSize: 12,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    children: [
                                      Container(
                                        height: AppSizes.height * 0.10,
                                        margin: EdgeInsets.all(6),
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: AppColors.grey,
                                            borderRadius: BorderRadius.circular(7)),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Row(children: []),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppSizes.height * 0.01,
                                      left: AppSizes.width * 0.025),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.transparentColor),
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.alertContainer),
                                  child: ExpansionTile(
                                    title: Container(
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(FontAwesomeIcons.truck),
                                                  SizedBox(
                                                    width: AppSizes.width * 0.05,
                                                  ),
                                                  Text(
                                                    "4.2 Ton",
                                                    style: TextStyle(
                                                      decoration:
                                                      TextDecoration.none,
                                                      fontSize: 12,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    children: [
                                      Container(
                                        height: AppSizes.height * 0.10,
                                        margin: EdgeInsets.all(6),
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: AppColors.grey,
                                            borderRadius: BorderRadius.circular(7)),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Row(children: []),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:EdgeInsets.only(top: AppSizes.height*0.025),
                                  child: GestureDetector(
                                    onTap: () {
                                      hideLoader(context);
                                    },
                                    child: Text(
                                      "Click & Continue",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 12,
                                        color: AppColors.yellow,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.45),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.truck,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
