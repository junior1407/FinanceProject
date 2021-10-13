import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.pink,
          pinned: true,
          floating: false,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Finance APP"),
          ),),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.all(15),
                child: Container(
                  color: Colors.blue[100 * (index % 9 + 1)],
                  height: 80,
                  alignment: Alignment.center,
                  child: Text(
                    "Item $index",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              );
            },
            childCount: 20, // 1000 list items
          ),
        ),
      ],
    );
  }
}
