import 'package:flipper/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      designSize:
      const Size(360, 640);

      minTextAdapt:
      true;

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp, // only allow portrait
      ]);
      {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: const HomePage(),
        );
      }
    });
  }
}
