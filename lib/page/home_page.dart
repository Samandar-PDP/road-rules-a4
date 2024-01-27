
import 'package:flutter/material.dart';
import 'package:road_rules/widget/rule_item.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Road Rules"),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return RuleItem(onClick: () {});
          },
        ),
      );
    }
  }
