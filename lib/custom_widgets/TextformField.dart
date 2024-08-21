import 'package:flutter/material.dart';

class Custom_field extends StatefulWidget {
  Custom_field({
    super.key,
  });

  @override
  State<Custom_field> createState() => _Custom_fieldState();
}

class _Custom_fieldState extends State<Custom_field> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        maxLines: 1,
        decoration: InputDecoration(
            hintText: "Enter Your Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
