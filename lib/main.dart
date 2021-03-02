
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/providers/multi_provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/utilities/toast.dart';

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
      // ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: value);
      // print("The fCM  tokeen is: "+ value);
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // _showItemDialog(message);
        ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "Message Received");
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
        ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "Message Received");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // _navigateToItemDetail(message);
        ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "Message Received");
      },
    );
  }

  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
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

