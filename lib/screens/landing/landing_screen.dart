import 'package:flutter/material.dart';
import 'package:nhs_covid_19/screens/guidelines/guidelines_screen.dart';

import 'widgets/landing_screen_widgets.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            LandingButton(
              title: "Guidelines",
              bgColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuidelinesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
