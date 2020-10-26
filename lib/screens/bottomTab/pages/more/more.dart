import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/models/api_models/login_response.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/more/more_components.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';

import '../../../../animations/slide_right.dart';
import '../../../../res/assets.dart';
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
                text: "More", iconName: Assets.bellIconUnpress, onPress: () {
                  Navigator.push(context, SlideRightRoute(page: Notifications()));
            }),
            Divider(
              height: 10,
            ),
            _moreComponents.getProfileContainer(
              ProfileImg: Assets.profileImg,
              name: 'Matthew',
              email: 'Matthew@gmail.com',
              onPress: () {
                if(widget.tag == Strings.indiviual){
                  Navigator.push(context, SlideRightRoute(page: IndividualProfile()));
                }
                else if(widget.tag == Strings.business){
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
            _moreComponents.getSOSbutton(
              text: 'Language',
              onPress: () {
                // Navigator.pop(
                //     context, SlideRightRoute(page: DriverDetails()));
              },
            ),
            Divider(
              height: 10,
            ),
            _moreComponents.touchableButton(
              text: 'Logout',
              onPress: () {
              },
            ),
            Divider(
              height: 10,
            ),
          ],
        ));
  }
}
