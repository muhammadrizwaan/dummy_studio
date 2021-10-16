
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet/res/assets.dart';
import 'package:vet/res/colors.dart';
import 'package:vet/res/res.dart';
import 'package:vet/screens/splash/splashProvider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashProvider _splashProvider = SplashProvider();
  bool isChecked=true;

  @override
  void initState() {
    _splashProvider = Provider.of<SplashProvider>(context, listen: false);
    _splashProvider.init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    initializeAppResources(context: context);
    Provider.of<SplashProvider>(context, listen: true);

    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: sizes.height,
        width: sizes.width,
        color: AppColors.whiteColor,
        child: Text("Splash added",

          style: TextStyle(
            fontFamily: Assets.poppinsBold
          ),
        )
    )
    ));



  }
}


