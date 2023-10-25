import 'package:dron_delivery_app/internal/app.dart';
import 'package:dron_delivery_app/internal/app_components.dart';
import 'package:dron_delivery_app/internal/app_dependency.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppComponents().init();

  runApp(
    AppDependency(
      app: App(),
    ),
  );
}
