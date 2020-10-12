

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              CommonWidgets.tabsAppBar2(
                  text: 'Wallet',
                  iconName: Assets.backArrow,
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),
              Divider(height: 10,),
              CommonWidgets.getWalletPriceBox(
                  walletPrice: "258,000.00"
              )
            ],
          ),
        ),
      ),
    );
  }
}
