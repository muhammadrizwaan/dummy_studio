import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/more/more_components.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/language/language.dart';
import 'package:truckoom_shipper/screens/wallet/wallet.dart';
import 'package:truckoom_shipper/widgets/faqs_expandable.dart';
import 'package:truckoom_shipper/widgets/language_expandable_container.dart';
import '../../../../animations/slide_right.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../res/strings.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../contact_us/contact_us.dart';
import '../../../individualProfile/individual_profile.dart';
import '../../../notifications/notifications.dart';
import '../../../referrals/referrals.dart';

class More extends StatefulWidget {
  String tag;

  More({@required this.tag});
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  MoreComponents _moreComponents;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moreComponents = MoreComponents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.white,
        child: Column(
          children: [
            CommonWidgets.tabsAppBar1(
                text: "More", iconName: FontAwesome5.bell, onPress: () {
                  Navigator.push(context, SlideRightRoute(page: Notifications()));
            }),
            Expanded(
              child: ListView(
                children: [
                  _moreComponents.getProfileContainer(
                    profileImg: Constants.getUserImage(),
                    name: Constants.getUserName(),
                    email: Constants.getUserEmail(),
                    onPress: () {
                      if(Constants.getUser() == Strings.indiviual){
                        Navigator.push(context, SlideRightRoute(page: IndividualProfile()));
                      }
                      else if(Constants.getUser() == Strings.business){
                        Navigator.push(context, SlideRightRoute(page: BusinessProfile()));
                      }
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  _moreComponents.touchableButton(
                    text: 'Referrals',
                    onPress: () {
                      Navigator.push(context, SlideRightRoute(page: Referrals()));
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  _moreComponents.touchableButton(
                    text: 'Contact Us',
                    onPress: () {
                      Navigator.push(context, SlideRightRoute(page: ContactUs()));
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  LanguageContainer(),
                  Divider(
                    height: 10,
                  ),
                  FAQsExpandable(),
                  Divider(
                    height: 10,
                  ),
                  _moreComponents.touchableButton(
                    text: 'Wallet',
                    onPress: () {
                      Navigator.push(context, SlideRightRoute(page: Wallet()));
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  _moreComponents.touchableButton(
                    text: 'Logout',
                    onPress: () {
                      onLogout();
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  onLogout() async{
    Constants.setUserEmail("");
    Constants.setCityId(0);
    Constants.setCityName("");
    Constants.setPassword("");
    Constants.setToken("");
    Constants.setUser("");
    Constants.setUserId(0);
    Constants.setUserImage("");
    Constants.setUserName("");
    Constants.setUserPhone("");
    Constants.setLicenseExpiryDate("");
    Constants.setCommpanyTrn("");
    Constants.setCommpanyPhone("");
    Constants.setCommpanyName("");
    await Constants.setLicenseImages([]);
    // Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: Language()), (route) => false);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Language()), ModalRoute.withName(Routes.bottomTab));
  }


}
