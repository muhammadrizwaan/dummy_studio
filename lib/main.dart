import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/providers/multi_provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/routes/routes.dart';

import 'res/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
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

