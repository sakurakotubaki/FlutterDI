import 'package:flutter/material.dart';

class FormonChanged extends StatelessWidget {
  const FormonChanged({
    super.key, required this.labelTextName, required this.onChanged,
  });

  final String labelTextName;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelTextName,
        ),
        onChanged: onChanged(),
      ),
    );
  }
}