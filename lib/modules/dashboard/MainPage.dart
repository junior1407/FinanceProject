import 'package:anime_finance/config/themes/AppThemeData.dart';
import 'package:anime_finance/constants/sizes.dart';
import 'package:anime_finance/constants/strings.dart';
import 'package:anime_finance/modules/dashboard/screens/DashboardScreen.dart';
import 'package:anime_finance/modules/dashboard/screens/DashboardScreenAlternative.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);
  int _currPageIndex = 0;
  final List<Widget> _screens = [
    DashboardScreen(),
    DashboardScreenAlternative(),
    Container(width: 100, height: 100, color: Colors.blue,),
    SizedBox.expand(child: Container(color: Colors.black,),),
  ];

  onTabTapped(int index) {
//    setState(() {
  //    _currPageIndex = index;
    //});
    _pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    print("Building MainPage");
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, ADD_ROUTE);

      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             /* IconButton(
                tooltip: 'Open navigation menu',
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              placeHolder,
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),*/
              buildTabItem(0, FontAwesomeIcons.calendarAlt, "Daily", onTabTapped, _pageIndex),
              buildTabItem(1, FontAwesomeIcons.chartBar, "Stat", onTabTapped, _pageIndex),
              buildTabItem(1, FontAwesomeIcons.chartBar, "_", onTabTapped, _pageIndex, visible: false),
              buildTabItem(2, FontAwesomeIcons.wallet, "Budget", onTabTapped, _pageIndex),
              buildTabItem(3, FontAwesomeIcons.userCircle, "Profile", onTabTapped, _pageIndex),


            ],
          ),
        ),
      ),
        body: ValueListenableBuilder(
            valueListenable: _pageIndex,
            builder: (context, value, child) {
              print("Building only screen $value");
              return _screens[value as int];
            },
            child: _screens[_currPageIndex])
    );
  }

  Widget buildTabItem(int index, final IconData icon, String text, ValueChanged<int> onPressed, ValueNotifier<int> pageIndex, {bool visible = true}) {
    return ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (context, value, child) {
        Color color = value == index? context.watch<AppThemeData>().selectedTabColor: context.watch<AppThemeData>().unselectedTabColor;
        return Expanded(
          child: SizedBox(
            height: BUTTON_HEIGHT,
            child: visible? Material(
              type: MaterialType.transparency,
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () => onPressed(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FaIcon(icon, color: color,),
                    Text(
                      text,
                      style: TextStyle(color: color),
                    )
                  ],
                ),
              ),
            ): Container(),
          ),
        );
      },
    );
  }
}

