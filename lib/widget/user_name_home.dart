import 'package:flutter/material.dart';

class WidgetUserNameHome extends StatelessWidget {
  const WidgetUserNameHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text(
          'Hello,',
          style: TextStyle(
            // color: Constants.colorWhite,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 8),
        Text(
          'Username 👋',
          style: TextStyle(
            // color: Constants.colorWhite,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
