import 'package:diabetic/src/views/screens/custom_widgets/circular_progress.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final double value;

  const ProgressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        height: 160,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.background,
              Theme.of(context).scaffoldBackgroundColor
            ]),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(widget.subtitle),
                        ]),
                  ),
                  Expanded(
                      child: CustomCircularProgressIndicator(
                    value: widget.value,
                    strokeAlign: 12.0,
                  ))
                ])));
  }
}
