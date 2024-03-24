import 'package:diabetic/src/control/notifier_listener.dart';
import 'package:diabetic/src/views/screens/custom_widgets/progress_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<NotifyListener>().isLoading;

    isLoading
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ProgressModal(message: "loading...");
            })
        : null;

    return child;
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: const Text(
            "Oops",
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/error.png",
            width: 64,
            height: 64,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Oops, something went wrong. Please try again or go back to your previous page',
            style: Theme.of(context).textTheme.headlineMedium,
            softWrap: true,
          )
        ],
      ),
    );
  }
}
