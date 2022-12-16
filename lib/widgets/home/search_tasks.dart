import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SearchTasks extends StatelessWidget {
  SearchTasks({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: TextField(
          controller: _controller,
          style: kTextStyleBoldBlack(22.0),
          maxLines: 1,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: 'Search a task...',
            prefixIcon: const Icon(Icons.search, size: 30),
            hintStyle: kTextStyleBoldGrey(20.0),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
