import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nhs_covid_19/screens/landing/landing_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nhs_covid_19/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: Constants.appUrl),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LandingScreen(
            title: "COVID-19",
          ),
        ),
      ),
    );
  }
}
