import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final double? value;

  final double strokeAlign;
  const CustomCircularProgressIndicator({
    super.key,
    required this.strokeAlign,
    required this.value,
  });

  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            value: widget.value,
            strokeAlign: widget.strokeAlign,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "${((widget.value != null ? widget.value! * 100 : 0 * 100).round()).toString()}%",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: widget.strokeAlign * 2),
            softWrap: true,
          ),
        )
      ],
    );
  }
}
