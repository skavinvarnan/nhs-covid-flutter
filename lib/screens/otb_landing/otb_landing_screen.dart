import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nhs_covid_19/screens/otb_details/otb_details_screen.dart';

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
      body: OTBList(graphQlKey: this.graphQlKey),
    );
  }
}

class OTBList extends StatelessWidget {
  final String graphQlKey;

  OTBList({@required this.graphQlKey});

  @override
  Widget build(BuildContext context) {
    String query = """
      query {
        ${this.graphQlKey}(sort: "order:asc") {
          order
          title
          body
        }
      }
    """;
    return Query(
      options: QueryOptions(
        documentNode: gql(query), // this is the query string you just created
        variables: {
          'strapiCollection': this.graphQlKey,
        },
        pollInterval: 10,
      ),
      builder: (
        QueryResult result, {
        VoidCallback refetch,
        FetchMore fetchMore,
      }) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.loading) {
          return Text('Loading');
        }

        // it can be either Map or List
        List listItems = result.data[this.graphQlKey];

        return ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              final listItem = listItems[index];
              return OTBLandingButton(
                title: "${listItem['order']}. ${listItem['title']}",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTBDetailScreen(
                        markdown: listItem['body'],
                        title: listItem['title'],
                      ),
                    ),
                  );
                },
                bgColor: Colors.blue,
              );
            });
      },
    );
  }
}
