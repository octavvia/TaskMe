import 'package:flutter/material.dart';

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
