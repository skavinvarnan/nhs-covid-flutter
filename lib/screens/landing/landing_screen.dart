import 'package:flutter/material.dart';
import 'package:nhs_covid_19/screens/otb_landing/otb_landing_screen.dart';
import 'package:nhs_covid_19/screens/otb_landing/widgets/otb_landing_screen_widgets.dart';

import 'widgets/landing_screen_widgets.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
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
                    builder: (context) => OTBLandingScreen(
                      title: "Guidelines",
                      graphQlKey: "guidelines",
                    ),
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
