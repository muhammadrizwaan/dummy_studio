
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/providers/multi_provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'dart:io' as io;
import 'commons/utils.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  dynamic restartApp({BuildContext context}){
    final _MyAppState state = context.findAncestorStateOfType<State<MyApp>>();
    state.restartApp();
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  final _firebaseMessaging = FirebaseMessaging();

  configureFcm(){
    FirebaseMessaging().getToken().then((value) async{
      await PreferenceUtils.setString(Strings.deviceId, value);
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        Constants.setNotification(true);
        if(bottomTabState.mounted){
          bottomTabState.setState(() {});
        }
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        Constants.setNotification(true);
        if(bottomTabState.mounted){
          bottomTabState.setState(() {});
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        Constants.setNotification(true);
        if(bottomTabState.mounted){
          bottomTabState.setState(() {});
        }
      },
    );
  }

  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    if(io.Platform.isIOS){
      _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings());
    }
  }

  @override
  Widget build(BuildContext context) {
  configureFcm();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        key: key,
        title: 'Truckoom',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: Assets.poppinsMedium,
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: Routes.splash,
      ),
    );
  }
}

