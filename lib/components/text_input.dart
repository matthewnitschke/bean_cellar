import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final String? label;

  final TextField field;

  const StyledTextField(
    this.field, {
    this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              label!,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        field,
      ],
    );
  }
}
