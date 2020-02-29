import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nhs_covid_19/screens/landing/landing_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(
        title: "COVID-19",
      ),
    );
  }
}

class TestingMarkdown extends StatelessWidget {
  final String md =
      "In preparation, healthcare professionals or facilities that may be involved in the investigation or management and care of possible cases should:\n\n- review their local policies and ensure that operational procedures are described, and staff are familiar with them; for example, where PPE is stored and how it should be used\n- review procedures for rapidly decontaminating parts of the healthcare environment where a possible case has been located\n- ensure there is a process that would ensure possible cases are identified at presentation leading to the triggering of relevant case management and infection control policies\n- ensure that staff are aware of where a possible case will be isolated and the need for a negative pressure room, if it is available\n- ensure that staff who are assessing or caring for suspected COVID-19 cases are familiar with an FFP3 respirator conforming to EN149, and that fit testing has been undertaken before using this equipment. If an individual cannot use an FFP3 respirator due to inadequate fit, then an alternative with equivalent protection (such as powered hood respirator) must be identified prospectively\n- ensure that staff caring for patients with suspected COVID-19 are trained in the [safe donning and removal of PPE](https://www.gov.uk/government/publications/wuhan-novel-coronavirus-infection-prevention-and-control/wuhan-novel-coronavirus-wn-cov-infection-prevention-and-control-guidance#anchor)\n- ensure staff know who to contact within their organisation to discuss possible cases\n- ensure there is a clear internal procedure for co-ordinating infection control and [arranging testing](https://www.gov.uk/government/publications/wuhan-novel-coronavirus-guidance-for-clinical-diagnostic-laboratories/wuhan-novel-coronavirus-who-to-call-to-request-laboratory-testing) for possible cases to exclude COVID-19 \n\nEnsure that adequate supplies or equipment are available (with appropriate training provided), including:\n\n- FFP3 respirators\n- gloves with long tight-fitting cuffs\n- gowns - disposable fluid-resistant full-sleeve gowns and single-use\n- eye protection, for example, full face visor or single-use goggles\n- clinical waste bags\n- hand hygiene supplies\n- general-purpose detergent and chlorine based disinfectant solutions.\n";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: SafeArea(
        child: Container(
          child: Markdown(
            data: md,
            onTapLink: (href) {
              print(href);
            },
          ),
        ),
      ),
    );
  }
}
