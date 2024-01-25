import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_rules/page/add_page.dart';
import 'package:road_rules/page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final _pages = [HomePage()];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width > 500) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              trailing: FloatingActionButton(
                backgroundColor: Colors.indigo,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                onPressed: _navigate,
                child: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
              ),
              onDestinationSelected: (index) {
                setState(() {
                  _index = index;
                });
              },
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text("")),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text("")),
                NavigationRailDestination(
                    icon: Icon(Icons.info), label: Text("")),
              ],
              selectedIndex: _index,
            ),
            const VerticalDivider(),
            Expanded(child: HomePage())
          ],
        ),
      );
    } else {
      return Scaffold(
        body: HomePage(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          onPressed: _navigate,
          child: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          inactiveColor: Colors.grey,
          gapLocation: GapLocation.center,
          onTap: (i) {
            setState(() {
              _index = i;
            });
          },
          notchSmoothness: NotchSmoothness.smoothEdge,
          activeIndex: _index,
          icons: const [
            CupertinoIcons.home,
            CupertinoIcons.heart,
            CupertinoIcons.info,
            CupertinoIcons.profile_circled,
          ],
        ),
      );
    }
  }
  _navigate() {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => const AddPage())
    );
  }
}
