import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class ModalFit extends StatelessWidget {
  final List<ModalFitItem> elements;

  ModalFit(this.elements, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        //color: Colors.pink,
        borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(10),
        topRight: const Radius.circular(10)
    ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                vertical: 1.h,
              horizontal: 40.w,
            ),
                  child: Center(
                    child: Container(
                      height: 0.5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text("Select the type of transaction"),
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: elements.length,
                    itemBuilder: (context, index) {
                      ModalFitItem item = elements[index];
                      return ListTile(
                        title: Text(item.text),
                        leading: Icon(item.icon, color: item.color,),
                        onTap: () => Navigator.of(context).pop(item.returnValue),
                      );
                  },),
                )
              ],
            ),
          ),
    );
  }
}
class ModalFitItem {
  final String text;
  final IconData icon;
  final int returnValue;
  final Color color;
  ModalFitItem(this.text, this.icon, this.returnValue, this.color);
}