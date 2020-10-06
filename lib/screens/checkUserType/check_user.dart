

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user_components.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class CheckUser extends StatefulWidget {
  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  CheckUserComponents checkUserComponents;
  bool button_indiviual, button_businees;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button_businees = button_indiviual = false;
    checkUserComponents = CheckUserComponents();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.white,
     child: Container(
       margin: EdgeInsets.all(AppSizes.width * 0.05),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Image(image: AssetImage('assets/png/logo_splash.png')),
           SizedBox(height: AppSizes.height * 0.09,),
           checkUserComponents.getBottomButton(
               text: "Indiviual",
               onPress: (){
                 setState(() {
                   button_indiviual = !button_indiviual;
                 });
                 Navigator.push(context, SlideRightRoute(page: Login()));
               },
               state: button_indiviual),
           SizedBox(height: AppSizes.height * 0.03,),
           checkUserComponents.getBottomButton(
               text: "Business",
               onPress: (){
                 setState(() {
                   button_businees = !button_businees;
                 });
                 Navigator.push(context, SlideRightRoute(page: BusinessSignup()));
               },
               state: button_businees,
           ),
         ],
       ),
     ),
    );
  }
}
