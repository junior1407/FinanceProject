import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'ModalFIt.dart';

class TransactionChooser extends StatefulWidget {
  const TransactionChooser({
    Key? key,
  }) : super(key: key);

  static final List<ModalFitItem> options = [
    ModalFitItem("Income", FontAwesomeIcons.chevronCircleLeft, 0, Colors.pink),
    ModalFitItem(
        "Expense", FontAwesomeIcons.chevronCircleRight, 1, Colors.blue),
  ];

  @override
  State<TransactionChooser> createState() => _TransactionChooserState();
}

class _TransactionChooserState extends State<TransactionChooser> {
  int _selected = 0;

  void changeSelected(int value) {
    if (value != _selected) {
      setState(() {
        _selected = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ModalFitItem selectedItem = TransactionChooser.options[_selected];
    return Flexible(
        child: InkWell(
      onTap: () {
        showMaterialModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return ModalFit(TransactionChooser.options);
          },
        ).then((value) {
          if (value != null) {
            changeSelected(value);
          }
        });
      },
      child: Container(
        child: Row(
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Center(
                  child: Container(
                      child: FaIcon(
                    selectedItem.icon,
                    size: 4.h,
                    color: selectedItem.color,
                  )),
                )),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                child: SizedBox(
                  height: 10.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Transaction type",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              selectedItem.text,
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
