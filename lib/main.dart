import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:nhs_covid_19/client_provider.dart';
import 'package:nhs_covid_19/screens/landing/landing_screen.dart';
import 'package:nhs_covid_19/utils/constants.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    FirebaseAnalytics analytics = FirebaseAnalytics();
    return ClientProvider(
      uri: Constants.appUrl,
      child: MaterialApp(
        title: 'LTH Guidelines',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingScreen(
          title: "LTH Guidelines",
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}
