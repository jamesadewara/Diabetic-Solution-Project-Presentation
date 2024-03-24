import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WrapBody extends StatelessWidget {
  final List<Widget> children;
  const WrapBody({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).between(MOBILE, TABLET)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children.map((e) {
              return Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(child: e)));
            }).toList(),
          );
  }
}
