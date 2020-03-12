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
    return ClientProvider(
      uri: Constants.appUrl,
      child: MaterialApp(
        title: 'Guidelines LTHTR',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingScreen(
          title: "Guidelines LTHTR",
        ),
      ),
    );
  }
}
