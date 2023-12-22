import 'package:flutter/material.dart';
import 'package:superb_cuisine/core/extension/int_extension.dart';

class HYOperationItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color textColor;

  const HYOperationItem(
      {super.key,
      this.textColor = Colors.black,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.px,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 8.px,
          ),
          Container(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: textColor),
            ),
          )
        ],
      ),
    );
  }
}
