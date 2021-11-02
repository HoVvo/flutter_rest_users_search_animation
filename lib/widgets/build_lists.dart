import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_users/pages/user_page.dart';
import 'package:flutter_search_users/services/search_provider.dart';
import 'package:provider/provider.dart';

class build_ListsWidget extends StatefulWidget {
  @override
  _build_ListsWidgetState createState() => _build_ListsWidgetState();
}

class _build_ListsWidgetState extends State<build_ListsWidget> {
  @override
  void didChangeDependencies() {
    SearchProvider searchProvider =
        Provider.of<SearchProvider>(context, listen: false);
    searchProvider.updateUsersData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, value, child) {
        if (value.status == true) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          );
        } else {
          return ListView(
            children: value.users
                .where((u) => u.name
                    .toLowerCase()
                    .contains(value.searchText.toLowerCase()))
                .map((e) => BounceInDown(
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPage(user: e)),
                            );
                          },
                          leading: Hero(
                            tag: 'hero-${e.id}',
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(e.avatar),
                            ),
                          ),
                          title: Text(e.name),
                          subtitle: Text(e.email),
                          trailing: Text(e.id.toString()),
                        ),
                      ),
                    ))
                .toList(),
          );
        }
      },
    );
  }
}
