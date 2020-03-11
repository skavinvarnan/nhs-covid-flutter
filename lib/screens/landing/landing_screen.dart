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
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
                child: LandingButton(
                  title: "COVID-19 Guidelines",
                  bgColor: Colors.blue,
                  isLocked: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuidelinesScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Loading...", style: TextStyle(color: Colors.black, fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
