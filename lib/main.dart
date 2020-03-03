import 'package:flutter/material.dart';
import 'package:nhs_covid_19/client_provider.dart';
import 'package:nhs_covid_19/screens/landing/landing_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nhs_covid_19/utils/constants.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingScreen(
          title: "COVID-19",
        ),
      ),
    );
  }
}
