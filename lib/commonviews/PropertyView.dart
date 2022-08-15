import 'package:flutter/material.dart';

class PropertLabelRight extends StatelessWidget {
  String name;
  String value;
  PropertLabelRight(
    this.name,
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(175)),
          ),
          Text(
            value,
            style: const TextStyle(
                fontFamily: "Maven", fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: double.maxFinite,
            color: Colors.black.withOpacity(0.5),
            height: 1,
          )
        ],
      ),
    );
  }
}

class PropertLabelLeft extends StatelessWidget {
  String name;
  String value;
  PropertLabelLeft(
    this.name,
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black.withAlpha(175)),
        ),
        Text(
          value,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontFamily: "Maven", fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: 150,
          color: Colors.black.withOpacity(0.5),
          height: 1,
        )
      ],
    );
  }
}
