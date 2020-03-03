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
                child: Row(
                  children: <Widget>[
                    LandingButton(
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
                    Spacer(),
                    LandingButton(
                      title: "Feature 1",
                      bgColor: Colors.cyan,
                      isLocked: true,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text("message of the day"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    LandingButton(
                      title: "Feature 2",
                      bgColor: Colors.indigo,
                      isLocked: true,
                      onPressed: () {},
                    ),
                    Spacer(),
                    LandingButton(
                      title: "Feature 3",
                      bgColor: Colors.teal,
                      isLocked: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
