import 'package:flutter/material.dart';
import 'package:qrcode/mainscreen.dart';
import 'package:qrcode/screen_setting/login_screen.dart';
import 'package:qrcode/screens/intro_screen.dart';
import 'package:qrcode/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  IntroSigin.routeName: (context) => const IntroSigin(),
  SplashScreen.routeName: (context) => const SplashScreen(),
};

class CustomPageRouteBuilder<T> extends PageRoute<T> {
  final RoutePageBuilder pageBuilder;
  final PageTransitionsBuilder matchingBuilder =
      const CupertinoPageTransitionsBuilder(); // Default iOS/macOS (to get the swipe right to go back gesture)
  // final PageTransitionsBuilder matchingBuilder = const FadeUpwardsPageTransitionsBuilder(); // Default Android/Linux/Windows

  CustomPageRouteBuilder({required this.pageBuilder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(
      milliseconds:
          900); // Can give custom Duration, unlike in MaterialPageRoute

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return matchingBuilder.buildTransitions<T>(
        this, context, animation, secondaryAnimation, child);
  }
}

class RouteUtil {
  static Route _createRouteByName(
      String routeName, Widget toScreen, bool isFullscreenDialog) {
    return CustomPageRouteBuilder(
      pageBuilder: (context, animation, _) => toScreen,
    );
  }

  static bool redirectToLoginScreen(BuildContext context) {
    try {
      Navigator.of(context)
          .push(_createRouteByName(MainScreen.routeName, LoginScreen(), false));
      return true;
    } catch (e) {
      return false;
    }
  }
}
