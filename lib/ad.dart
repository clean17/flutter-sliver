import 'package:flutter/material.dart';

class AD extends StatelessWidget {
  const AD(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      color: Colors.lightBlue[100 * (index % 9)],
      child: Text("Advertise $index"),
    );
  }
}
