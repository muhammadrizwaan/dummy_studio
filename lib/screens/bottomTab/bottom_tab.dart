import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bank/bank_screen.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_components.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/history/history.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
import 'package:truckoom_shipper/screens/invoice/invoice.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail.dart';
import 'package:truckoom_shipper/screens/loadDetails/load_details.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';
import 'package:truckoom_shipper/screens/referrals/referrals.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/screens/wallet/wallet.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BottomTab extends StatefulWidget {
  String tag;

  BottomTab({@required this.tag});

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  BottomTabComponents _bottomTabComponents;
  TextEditingController search;
  int _currentIndex = 0;
  int _value = 1;

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
                  "History",
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
              Divider(height: 10),
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
              SizedBox(height: AppSizes.height * 0.02,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05,),
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
                    ]
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image(image: AssetImage(Assets.vehicle)),
                    ) ,
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Select Category",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: Assets.poppinsLight,
                                      fontSize: 12,
                                      color: AppColors.colorBlack
                                  ),),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Category 1",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: Assets.poppinsLight,
                                      fontSize: 12,
                                      color: AppColors.colorBlack
                                  ),),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Category 2",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: Assets.poppinsLight,
                                        fontSize: 12,
                                        color: AppColors.colorBlack
                                    ),),
                                  value: 3
                              ),
                              DropdownMenuItem(
                                  child: Text("Category 3",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: Assets.poppinsLight,
                                        fontSize: 12,
                                        color: AppColors.colorBlack
                                    ),
                                  ),
                                  value: 4
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }
                        ),
                      ),
                    ),
                  ],
                ),

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
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _bottomTabComponents.getVehicleDetail(
                              leftIcon: Assets.vehicle_img,
                              vehicleType: 'Toyota Prius',
                              vehicleDetail: '22 Ton',
                              Category: 'Cargo',
                              onLoadDetail: (){
                                Navigator.push(context,
                                    SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                              },
                              onTap: () {
                                // _alertDialogueContainer();
                              }),
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
                text: "My Jobs",
                iconName: Assets.walletIcon,
                onPress: () {
                  // Navigator.push(context, SlideRightRoute(page: Wallet()));
                  Navigator.push(context, SlideRightRoute(page: Wallet()));
                },
              ),
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
                        text: "Active",
                        onPress: () {
                          // Navigator.push(
                          //     context, SlideRightRoute(page: LoadDetail()));
                        }),
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
                              jobDetail: "01",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug,",
                              time: '12:00am',
                              status: "Active",
                              onTap: () {}),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "01",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug,",
                              time: '12:00am',
                              status: "Active",
                              onTap: () {}),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "01",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug,",
                              time: '12:00am',
                              status: "Active",
                              onTap: () {}),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _bottomTabComponents.getJobContainer(
                              jobDetail: "01",
                              pickUpLocation: "ABC Port:",
                              destinationLocation: "227 Building, UAE:",
                              startDate: "11 Aug,",
                              time: '12:00am',
                              status: "Active",
                              onTap: () {}),
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
                  text: "History",
                  iconName: Assets.bellIconUnpress,
                  onPress: () {
                    Navigator.push(
                        context, SlideRightRoute(page: Notifications()));
                  }),
              Divider(
                height: 10,
              ),
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
                          jobDetail: "01",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          status: "Completed",
                          onTap: () {},
                          onInvoice: () {
                            Navigator.push(context,
                                SlideRightRoute(page: InvoiceDetail()));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _bottomTabComponents.getTransectionsContainer(
                          jobDetail: "01",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          status: "Completed",
                          onTap: () {},
                          onInvoice: () {
                            Navigator.push(context,
                                SlideRightRoute(page: InvoiceDetail()));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _bottomTabComponents.getTransectionsContainer(
                          jobDetail: "01",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          status: "Completed",
                          onTap: () {},
                          onInvoice: () {
                            Navigator.push(context,
                                SlideRightRoute(page: InvoiceDetail()));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _bottomTabComponents.getTransectionsContainer(
                          jobDetail: "01",
                          pickUpLocation: "ABC Port:",
                          destinationLocation: "227 Building, UAE:",
                          startDate: "11 Aug, 12:00am",
                          endDate: "12 Aug, 11:00pm",
                          price: "Price: AED 260",
                          status: "Completed",
                          onTap: () {},
                          onInvoice: () {
                            Navigator.push(context,
                                SlideRightRoute(page: InvoiceDetail()));
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
                    if (widget.tag == Strings.indiviual) {
                      Navigator.push(
                          context,
                          SlideRightRoute(
                              page: IndividualProfile(tag: widget.tag)));
                    } else if (widget.tag == Strings.business) {
                      Navigator.push(
                          context,
                          SlideRightRoute(
                              page: BusinessProfile(
                            tag: widget.tag,
                          )));
                    }
                  }),
              Divider(
                height: 10,
              ),
              // _bottomTabComponents.touchableButton(
              //     text: 'History',
              //     onPress: () {
              //       Navigator.push(context, SlideRightRoute(page: History()));
              //     }),
              // Divider(
              //   height: 10,
              // ),
              _bottomTabComponents.touchableButton(
                  text: 'Referrals',
                  onPress: () {
                    Navigator.push(context, SlideRightRoute(page: Referrals()));
                  }),
              Divider(
                height: 10,
              ),
              _bottomTabComponents.touchableButton(
                  text: 'Contact Us',
                  onPress: () {
                    Navigator.push(context, SlideRightRoute(page: ContactUs()));
                  }),
              Divider(
                height: 10,
              ),
              _bottomTabComponents.getSOSbutton(
                  text: 'Language',
                  onPress: () {
                    // Navigator.push(
                    //     context, SlideRightRoute(page: DriverDetails()));
                  }),
              Divider(
                height: 10,
              )
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
                        right: AppSizes.width * 0.08,
                      ),
                      height: AppSizes.height * 0.28,
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
                      height: AppSizes.height * 0.35,
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
                                  margin: EdgeInsets.only(
                                      left: AppSizes.width * 0.025),
                                  child: CommonWidgets.getSubHeadingText(
                                      text: "Vehicle Type"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: AppSizes.height * 0.01,
                                    left: AppSizes.width * 0.025,
                                    right: AppSizes.width * 0.025,
                                  ),
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
                                                  Image(
                                                      image: AssetImage(
                                                          Assets.truckIcon)),
                                                  // Icon(FontAwesomeIcons.truck),
                                                  SizedBox(
                                                    width:
                                                        AppSizes.width * 0.05,
                                                  ),
                                                  Text(
                                                    "Reefers",
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily:
                                                          Assets.poppinsLight,
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
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Row(children: []),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.02),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppSizes.width * 0.025),
                                  child: CommonWidgets.getSubHeadingText(
                                      text: "Vehicle Category"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: AppSizes.height * 0.01,
                                    left: AppSizes.width * 0.025,
                                    right: AppSizes.width * 0.025,
                                  ),
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
                                                  Image(
                                                      image: AssetImage(
                                                          Assets.truckIcon)),
                                                  // Icon(FontAwesomeIcons.truck),
                                                  SizedBox(
                                                    width:
                                                        AppSizes.width * 0.05,
                                                  ),
                                                  Text(
                                                    "4.2 Ton",
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily:
                                                          Assets.poppinsLight,
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
                                            borderRadius:
                                                BorderRadius.circular(7)),
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
                                      top: AppSizes.height * 0.025),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          SlideRightRoute(page: LoadDetail(tag: widget.tag)));
                                    },
                                    child: Text(
                                      "Tap & Continue",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 12,
                                        color: AppColors.yellow,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.02,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425),
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
                      child: Image(
                        image: AssetImage(Assets.truckMainIcon),
                      ),
                      // child: Icon(
                      //   FontAwesomeIcons.truck,
                      //   color: Colors.white,
                      //   size: 30,
                      // ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      }
    };
  }
}
