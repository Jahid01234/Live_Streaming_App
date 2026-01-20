import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_streaming_app/core/const/app_size.dart';
import 'package:live_streaming_app/core/routes/routes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
      title: 'Live Streaming App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}

