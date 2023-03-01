import 'package:flutter/material.dart';

class SearchTabView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: Colors.red,
              title: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.call), text: 'Call'),
                  Tab(icon: Icon(Icons.message), text: 'Message'),
                ],
              ),
            ),
          ],
          body: Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}
