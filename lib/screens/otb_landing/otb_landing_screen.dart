import 'package:flutter/material.dart';

import 'widgets/otb_landing_screen_widgets.dart';

class OTBLandingScreen extends StatelessWidget {
  final String title;
  final String graphQlKey;

  OTBLandingScreen({@required this.title, @required this.graphQlKey});

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
            OTBLandingButton(
              title: "Guidelines",
              bgColor: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
