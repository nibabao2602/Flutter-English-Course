import 'package:flutter/material.dart';

class NumberItem extends StatelessWidget {
  final BuildContext context;
  final String value;
  final String text;

  const NumberItem(
      {Key? key,
      required this.context,
      required this.value,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 2,
          ),
          Text(text)
        ],
      ),
    );
  }
}
