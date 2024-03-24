import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:diabetic/src/control/notifier_listener.dart';
import 'package:diabetic/src/control/routers/props.dart';
import 'package:diabetic/src/control/routers/route_generator.dart';
import 'package:diabetic/src/control/validators.dart';
import 'package:diabetic/src/views/apis/api_props.dart';
import 'package:diabetic/src/views/screens/custom_widgets/wrap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FormScreen extends StatefulWidget {
  final GoRouterState state;
  const FormScreen({
    super.key,
    required this.state,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _bmiController = TextEditingController();
  final _dpfController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _insulinController = TextEditingController();
  final _skinThicknessController = TextEditingController();
  final _bloodPressureController = TextEditingController();
  final _pregnanciesController = TextEditingController();

  final ServiceApi serviceApi = ServiceApi();

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      if (_formKey.currentState!.validate()) {
        Map<String, String> payload = {
          "Pregnancies": _pregnanciesController.text,
          "Glucose": _glucoseController.text,
          "BloodPressure": _bloodPressureController.text,
          "SkinThickness": _skinThicknessController.text,
          "Insulin": _insulinController.text,
          "BMI": _bmiController.text,
          "DiabetesPedigreeFunction": _dpfController.text,
          "Age": _ageController.text
        };
        Future<ApiRequest> result = serviceApi.predictResult(payload);
        result.then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: value.error ? Colors.red : Colors.green,
              content: ListTile(
                titleTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
                title: Text(value.error ? "Error" : "Success"),
                subtitleTextStyle: const TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.white),
                subtitle: const Text("loading..."),
              )));

          if (value.error == false) {
            GoRouter.of(context).pushNamed(AppRoutes.result, pathParameters: {
              "name": _nameController.text,
              "accuracy": value.data.accuracy,
              "precision": value.data.precision,
              "result": value.data.result,
              "id": noSpacesUrl(_nameController.text) ?? "",
            });
          }
        });
      }
    }

    // NotifyListener listener = context.watch<NotifyListener>();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const AutoSizeText(
            "DIABETES PREDICTOR",
            maxLines: 1,
          ),
          titleTextStyle: Theme.of(context).textTheme.displaySmall,
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
                        ? 12
                        : 24,
                    right: ResponsiveBreakpoints.of(context)
                            .between(MOBILE, TABLET)
                        ? 12
                        : 24,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                WrapBody(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Name",
                                          softWrap: true,
                                        ),
                                        const SizedBox(height: 4),
                                        TextFormField(
                                            controller: _nameController,
                                            keyboardType: TextInputType.text,
                                            obscureText: false,
                                            onFieldSubmitted: (value) {
                                              handleSubmit();
                                            },
                                            validator: (value) {
                                              return validateIsEmpty(value!,
                                                  context: context);
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "Whats your name")),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Age",
                                          softWrap: true,
                                        ),
                                        const SizedBox(height: 4),
                                        TextFormField(
                                            controller: _ageController,
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            onFieldSubmitted: (value) {
                                              handleSubmit();
                                            },
                                            validator: (value) {
                                              return validateIsEmpty(value!,
                                                  context: context);
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "How old are you?")),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                WrapBody(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "BMI (Body Mass Index)",
                                          softWrap: true,
                                        ),
                                        const SizedBox(height: 4),
                                        TextFormField(
                                            controller: _bmiController,
                                            keyboardType: TextInputType.number,
                                            onFieldSubmitted: (value) {
                                              handleSubmit();
                                            },
                                            validator: (value) {
                                              return validateIsEmpty(value!,
                                                  context: context);
                                            },
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "What is your current BMI?")),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Diabetes Pedigree Function",
                                          softWrap: true,
                                        ),
                                        const SizedBox(height: 4),
                                        TextFormField(
                                            controller: _dpfController,
                                            keyboardType: TextInputType.number,
                                            onFieldSubmitted: (value) {
                                              handleSubmit();
                                            },
                                            validator: (value) {
                                              return validateIsEmpty(value!,
                                                  context: context);
                                            },
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Diabetes Pedigree Function score?")),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Glucose",
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                        controller: _glucoseController,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value) {
                                          handleSubmit();
                                        },
                                        validator: (value) {
                                          return validateIsEmpty(value!,
                                              context: context);
                                        },
                                        decoration: const InputDecoration(
                                            hintText:
                                                "What is your current glucose level?")),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Pregnancies",
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                        controller: _pregnanciesController,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value) {
                                          handleSubmit();
                                        },
                                        validator: (value) {
                                          return validateIsEmpty(value!,
                                              context: context);
                                        },
                                        decoration: const InputDecoration(
                                            hintText:
                                                "how many times have you gotten pregnant?")),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Insulin",
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                        controller: _insulinController,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value) {
                                          handleSubmit();
                                        },
                                        validator: (value) {
                                          return validateIsEmpty(value!,
                                              context: context);
                                        },
                                        decoration: const InputDecoration(
                                            hintText:
                                                "Are you currently using insulin? If yes, what is your insulin dosage?")),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Skin Thickness",
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                        controller: _skinThicknessController,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value) {
                                          handleSubmit();
                                        },
                                        validator: (value) {
                                          return validateIsEmpty(value!,
                                              context: context);
                                        },
                                        decoration: const InputDecoration(
                                            hintText:
                                                "Have you noticed any changes in your skin thickness related to diabetes?")),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Blood Pressure",
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                        controller: _bloodPressureController,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value) {
                                          handleSubmit();
                                        },
                                        validator: (value) {
                                          return validateIsEmpty(value!,
                                              context: context);
                                        },
                                        decoration: const InputDecoration(
                                            hintText:
                                                "What is your current blood pressure reading?")),
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
                                        // listener.setLoading(true);
                                        handleSubmit();
                                        // Timer(const Duration(seconds: 2), () {
                                        //   listener.setLoading(false);
                                        // });
                                      },
                                      child: const Text(
                                        "Submit",
                                        softWrap: true,
                                      )),
                                ),
                                const SizedBox(
                                  height: 64,
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              )),
        )));
  }
}
