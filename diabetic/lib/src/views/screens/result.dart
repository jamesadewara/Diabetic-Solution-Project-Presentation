import 'package:auto_size_text/auto_size_text.dart';
import 'package:diabetic/src/control/routers/props.dart';
import 'package:diabetic/src/control/routers/route_generator.dart';
import 'package:diabetic/src/views/screens/custom_widgets/progress_card.dart';
import 'package:diabetic/src/views/screens/custom_widgets/wrap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResultScreen extends StatefulWidget {
  final GoRouterState state;
  final RouteParams params;

  const ResultScreen({
    super.key,
    required this.state,
    required this.params,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print(widget.params.name);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Result"),
      ),
      body: SafeArea(
          child: Scrollbar(
              controller: _scrollController,
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 0;
              },
              child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: ResponsiveBreakpoints.of(context)
                                      .between(MOBILE, TABLET)
                                  ? 8
                                  : 72,
                              right: ResponsiveBreakpoints.of(context)
                                      .between(MOBILE, TABLET)
                                  ? 8
                                  : 72),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 16),
                                WrapBody(children: [
                                  ProgressCard(
                                    title: "Precision",
                                    subtitle: widget.params.precision,
                                    value:
                                        double.parse(widget.params.precision),
                                  ),
                                  ProgressCard(
                                    title: "Accuracy",
                                    subtitle: widget.params.accuracy,
                                    value: double.parse(widget.params.accuracy),
                                  ),
                                ]),
                                const SizedBox(height: 64),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "Hello ${widget.params.name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 32),
                                    AutoSizeText(
                                      "Based on the information provided, it appears that you are currently ${double.parse(widget.params.result) == 1 ? "" : "not"} diagnosed with diabetes.",
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 64,
                                ),
                                Center(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Theme.of(context).primaryColor),
                                      ),
                                      onPressed: () async {
                                        GoRouter.of(context)
                                            .pushNamed(AppRoutes.form);
                                      },
                                      child: const Text(
                                        "Restart",
                                        softWrap: true,
                                      )),
                                ),
                                const SizedBox(
                                  height: 64,
                                ),
                              ])))))),
    );
  }
}
