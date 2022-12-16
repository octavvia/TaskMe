import 'package:flutter/material.dart';
import 'package:taskme/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      required this.label,
      required this.hintText,
      this.onTap,
      this.readOnly = false})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final bool? readOnly;

  Icon? _getRightIcon() {
    if (label == 'Time') {
      return Icon(
        Icons.access_time_rounded,
        color: Colors.grey.withOpacity(0.5),
      );
    }
    if (label == 'Date') {
      return Icon(
        Icons.date_range,
        color: Colors.grey.withOpacity(0.5),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kTextStyleBlack(20)),
        TextField(
          readOnly: readOnly as bool,
          maxLines: label == 'Description' ? 5 : 1,
          controller: controller,
          style: kTextStyleBoldBlack(18),
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(14),
            hintText: hintText,
            hintStyle: kTextStyleBoldGrey(18),
            suffixIcon: _getRightIcon(),
            border: InputBorder.none,
            enabledBorder: _borders(),
            focusedBorder: _borders(),
            disabledBorder: _borders(),
          ),
        ),
        kVerticalSpace(20),
      ],
    );
  }

  _borders() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 1,
        color: Colors.amber.withOpacity(0.3),
      ),
    );
  }
}
