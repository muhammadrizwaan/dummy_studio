
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/screens/maps/maps_provider.dart';

final multiProviders = [
//  ChangeNotifierProvider<SplashProvider>(
//    create: (_) => SplashProvider(),
//    lazy: true,
//  ),

  ChangeNotifierProvider<MapsProvider>(
    create: (_) => MapsProvider(),
    lazy: true,
  ),
];
