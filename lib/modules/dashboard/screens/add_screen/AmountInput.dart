import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'ModalFIt.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
class AmountInput extends StatelessWidget {

  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter();
  @override
  Widget build(BuildContext context) {
    ModalFitItem selectedItem = ModalFitItem("Income", FontAwesomeIcons.chevronCircleLeft, 0, Colors.pink);
    return Flexible(
        child: Container(
          child: SizedBox(
            height: 9.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amount",
                  style: TextStyle(fontSize: 10.sp),
                ),
                Spacer(),
                Container(
                  child: TextFormField(
                    decoration: false? InputDecoration() : InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.only(bottom: 4),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    initialValue: _formatter.format("0"),
                    inputFormatters: [_formatter],
                    keyboardType: TextInputType.number,),
                )
              ],
            ),
          ),
        )
        );
  }
}