

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
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
  List products = [];
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button_businees =  false;
    button_indiviual = true;
    checkUserComponents = CheckUserComponents();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.white,
     child: Container(
       padding: EdgeInsets.only(left: AppSizes.width * 0.08, right: AppSizes.width*0.08, top: AppSizes.width*0.08),
       child: Stack(
         children: [
           Positioned(
             top: 0,
             child: Container(
               margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.04),
               child: CommonWidgets.getAppBar(
                   iconName: 'back_arrow_otp.png',
                   text: "",
                   clickableText: "",
                   onTap: () {},
                   onPress: () {
                     Navigator.pop(context);
                   }),
             ),
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Image(image: AssetImage('assets/png/logo_splash.png')),
               SizedBox(height: AppSizes.height * 0.09,),
               checkUserComponents.getBottomButton(
                   text: "Individual",
                   onPress: (){
                     setState(() {
                       button_indiviual = true;
                       button_businees = false;
                     });
                     // addData();
                     Navigator.push(context, SlideRightRoute(page: PhoneNumber(tag: Strings.indiviual,)));
                   },
                   state: button_indiviual),
               SizedBox(height: AppSizes.height * 0.03,),
               checkUserComponents.getBottomButton(
                 text: "Business Owner",
                 onPress: (){
                   setState(() {
                     button_indiviual = false;
                     button_businees = true;
                   });
                   // onRemoveData(0);
                   Navigator.push(context, SlideRightRoute(page: PhoneNumber(tag: Strings.business,)));
                 },
                 state: button_businees,
               ),
             ],
           ),
         ],
       ),
     ),
    );
  }

  addData(){
    var productMap = {
      'name': "an",
      'price': 25,
      'NO': i,
    };
    i++;
    products.add(productMap);
    print(products.length);
    for(int i =0; i< products.length; i++){
      print('name is');
      print(products[i]['name']+products[i]['NO'].toString());
    }
  }
  //
  // onRemoveData(int index){
  //   List tempData = [];
  //   for(int i =0; i< products.length; i++){
  //     if(products[i]['NO'] != index){
  //       tempData.add(products[i]);
  //     }
  //   }
  //   products = tempData;
  //   for(int i =0; i< products.length; i++){
  //     print('name is');
  //     print(products[i]['name']+products[i]['NO'].toString());
  //   }
  // }
}
