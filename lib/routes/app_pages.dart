
import 'package:final_flutter_two_nesma/modules/cart_screen.dart';
import 'package:final_flutter_two_nesma/modules/events_screen.dart';
import 'package:final_flutter_two_nesma/modules/settings_screen.dart';
import 'package:final_flutter_two_nesma/modules/splash_screen.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.event, page: () => const  EventsScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
   GetPage(
      name: Routes.settings,
      page: () => SettingsScreen(),
    ),
  ];
}
