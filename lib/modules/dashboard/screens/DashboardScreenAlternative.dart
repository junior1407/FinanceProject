import 'dart:math';

import 'package:flutter/material.dart';

class DashboardScreenAlternative extends StatefulWidget {

  @override
  _DashboardScreenAlternativeState createState() => _DashboardScreenAlternativeState();
}

class _DashboardScreenAlternativeState extends State<DashboardScreenAlternative> {
  late List<String> myList;
  var random = Random();

  _generateList() {
    return List.generate(random.nextInt(20), (index) => "item $index");
  }

  @override
  void initState() {
    myList = _generateList();
    super.initState();
  }

  Future<void> onRefresh() async {
    var newList = await Future.delayed(Duration(seconds: 2), () => _generateList());
  setState(() {
    myList = newList;
  });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView.builder
      (itemCount: myList.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(myList[index]),);
      }, ),
        onRefresh: onRefresh);
  }
}
