
import 'package:provider/provider.dart';
import 'package:vet/screens/bottomTabScreens/Appointments/appointmentsProvider.dart';
import 'package:vet/screens/bottomTabScreens/bottomTabProvider.dart';
import 'package:vet/screens/bottomTabScreens/home/homeProvider.dart';
import 'package:vet/screens/bottomTabScreens/market/marketProvider.dart';
import 'package:vet/screens/bottomTabScreens/profile/profileProvider.dart';
import 'package:vet/screens/findDoctor/findDoctorProvider.dart';
import 'package:vet/screens/language/languageProvider.dart';
import 'package:vet/screens/splash/splashProvider.dart';

final multiProviders = [
  ChangeNotifierProvider<SplashProvider>(
    create: (_) => SplashProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<LanguageProvider>(
    create: (_) => LanguageProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BottomTabProvider>(
    create: (_) => BottomTabProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<HomeProvider>(
    create: (_) => HomeProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<AppointmentsProvider>(
    create: (_) => AppointmentsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<MarketProvider>(
    create: (_) => MarketProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ProfileProvider>(
    create: (_) => ProfileProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<FindDoctorProvider>(
    create: (_) => FindDoctorProvider(),
    lazy: true,
  ),
];
