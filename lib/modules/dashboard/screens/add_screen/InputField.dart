import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'ModalFIt.dart';

class InputField extends StatelessWidget {
  final int type;

  InputField({Key? key, this.type = 1}) : super(key: key);
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter();
  @override
  Widget build(BuildContext context) {
    final double total_height = 8.h;
    final Widget faIcon = FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.center,
        child: FaIcon(FontAwesomeIcons.chevronCircleRight,
            size: total_height / 2));
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  child: Container(
                      height: total_height / 2,
                      child: faIcon)),
              Flexible(
                  flex: 6,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Container(
                      height: total_height,
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
                          Container(
                            child: type == 1
                                ? Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 3.h),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          "ABC",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: TextFormField(
                                    decoration: false
                                        ? InputDecoration()
                                        : InputDecoration(
                                            isCollapsed: true,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 4),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.cyan),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.red),
                                            ),
                                          ),
                                    initialValue: _formatter.format("0"),
                                    inputFormatters: [_formatter],
                                    keyboardType: TextInputType.number,
                                  )),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
