import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nhs_covid_19/screens/guideline_list/guideline_list_screen.dart';
import 'package:nhs_covid_19/screens/guideline_list/widgets/guideline_list_screen_widgets.dart';

class GuidelinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guidelines')),
      body: Container(child: Guidelines()),
    );
  }
}

class Guidelines extends StatelessWidget {
  Guidelines();

  @override
  Widget build(BuildContext context) {
    String query = """
      query {
        guidelines(sort: "order:asc") {
          order
          title
          items {
            title
            body
          }
        }
      }
    """;
    return Query(
      options: QueryOptions(documentNode: gql(query)),
      builder: (
        QueryResult result, {
        VoidCallback refetch,
        FetchMore fetchMore,
      }) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.loading) {
          return Center(
            child: Text(
              'Loading...',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }

        // it can be either Map or List
        List listItems = result.data['guidelines'];

        return ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            final listItem = listItems[index];
            return GuidelineListButton(
              title: "${listItem['order']}. ${listItem['title']}",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuidelineListScreen(
                      items: listItem['items'],
                      title: listItem['title'],
                    ),
                  ),
                );
              },
              bgColor: Colors.blue,
            );
          },
        );
      },
    );
  }
}
