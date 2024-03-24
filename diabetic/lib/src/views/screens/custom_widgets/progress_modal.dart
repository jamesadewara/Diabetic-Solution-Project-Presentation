import 'package:flutter/material.dart';

class ProgressModal extends StatefulWidget {
  final String message;
  const ProgressModal({super.key, required this.message});

  @override
  State<ProgressModal> createState() => _ProgressModalState();
}

class _ProgressModalState extends State<ProgressModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Text(widget.message),
        content: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
