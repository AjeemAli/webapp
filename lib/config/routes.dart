import 'package:flutter/material.dart';

import '../features/home/presentation/home_screen.dart';
import '../features/home/presentation/splash_screen.dart';


class RouteConfig {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String yaseen = '/yaseen';
  static const String verseViewer = '/verseViewer';
  static const String translationViewer = '/translationViewer';
  static const String recitation = '/recitation';
  static const String reciterSelector = '/reciterSelector';
  static const String tafsir = '/tafsir';
  static const String tafsirCard = '/tafsirCard';
  static const String reminders = '/reminders';
  static const String reminderSettings = '/reminderSettings';
  static const String reminderCard = '/reminderCard';
  static const String homeHeader = '/homeHeader';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case yaseen:
      //   return MaterialPageRoute(builder: (_) => YaseenScreen());
      // case verseViewer:
      //   return MaterialPageRoute(builder: (_) => VerseViewer());
      // case translationViewer:
      //   return MaterialPageRoute(builder: (_) => TranslationViewer());
      // case recitation:
      //   return MaterialPageRoute(builder: (_) => RecitationScreen());
      // case reciterSelector:
      //   return MaterialPageRoute(builder: (_) => ReciterSelector());
      // case tafsir:
      //   return MaterialPageRoute(builder: (_) => TafsirScreen());
      // case tafsirCard:
      //   return MaterialPageRoute(builder: (_) => TafsirCard());
      // case reminders:
      //   return MaterialPageRoute(builder: (_) => ReminderScreen());
      // case reminderSettings:
      //   return MaterialPageRoute(builder: (_) => ReminderSettings());
      // case reminderCard:
      //   return MaterialPageRoute(builder: (_) => ReminderCard());
      // case homeHeader:
      //   return MaterialPageRoute(builder: (_) => HomeHeader());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
