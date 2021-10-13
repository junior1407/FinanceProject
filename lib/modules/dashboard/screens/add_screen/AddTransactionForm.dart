import 'package:anime_finance/modules/dashboard/screens/add_screen/AmountInput.dart';
import 'package:anime_finance/modules/dashboard/screens/add_screen/InputField.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'ModalFIt.dart';
import 'TransactionChooser.dart';

class AddTransactionForm extends StatelessWidget {
  const AddTransactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              TransactionChooser(),
              AmountInput(),
            ],
          ),
          Row(
            children: [
              TransactionChooser(),
              InputField()
            ],
          ),
          Row(
            children: [
              InputField()
            ],
          ),
          Row(
            children: [
              InputField(type: 2,), InputField(),
            ],
          )
          /*Container(height: 10.h, color: Colors.blueGrey),
          Item1(),
          Item2(),
          Item1(),*/
        ],
      ),
    );
  }
}
class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.pink,
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black, height: 50);
  }
}
