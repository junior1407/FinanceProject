
import 'package:anime_finance/config/themes/AppThemeData.dart';
import 'package:anime_finance/modules/dashboard/screens/add_screen/AddTransactionForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransactionScreen extends StatelessWidget {
  AddTransactionScreen({Key? key}) : super(key: key);
  PageController _pageController = PageController(initialPage: 0);
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  void nextPage() {
    _pageController.jumpToPage(currentPage.value + 1);
  }

  void previousPage() {
    _pageController.jumpToPage(currentPage.value - 1);
  }

  void _onPageViewChanged(int value) {
    print("I'm at $currentPage and will be in $value");
    currentPage.value = value;
  }

  @override
  Widget build(BuildContext context) {
    print("Building AddTransactionScreen");
    Color coolBlack = context.watch<AppThemeData>().coolBlack;
    Color pink = context.watch<AppThemeData>().primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.close),
              onPressed: () { Navigator.pop(context); },
              color: coolBlack,
            );
          },
        ),
        title: Text('Add Transaction', style: TextStyle(color: coolBlack),),
        bottom: PreferredSize(
          child: ValueListenableBuilder(
              builder: (context, value, child) {
                int valueInt = value as int;
                double percentage = ((valueInt + 1) / 5.0);
                return ProgressBarWidget(percentage, pink);
              },
            valueListenable: currentPage,),
          preferredSize: Size(double.infinity, 6.0),),

      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageViewChanged,
        allowImplicitScrolling: false,
        physics: NeverScrollableScrollPhysics(),
        children: [
          AddTransactionForm(),
          Page1(goNextPage: nextPage, goPreviousPage: previousPage, color: Colors.blueGrey),
        ],
      ),
    );
  }
}

class ProgressBarWidget extends StatelessWidget {
  final double value;
  final Color pink;

  const ProgressBarWidget(this.value, this.pink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building ProgressBarWidget");
    return LinearProgressIndicator(
      backgroundColor: Colors.white,
      value: value,
      color: pink,
    );
  }
}

class Page1 extends StatelessWidget {
  final VoidCallback goNextPage;
  final VoidCallback goPreviousPage;
  final Color color;
  const Page1({Key? key, required this.goNextPage, required this.goPreviousPage, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: [
          TextButton(onPressed: () => goNextPage.call(), child: Text("GO"),),
          TextButton(onPressed: () => goPreviousPage.call(), child: Text("Back"),)

        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );
  }
}

