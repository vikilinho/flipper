import 'package:flipper/views/desktopPage.dart';
import 'package:flipper/views/mobilePage.dart';
import 'package:flipper/views/tabletPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/responsivepage.dart';

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
          // home: const ResponsivePage(
          //   mobilePage: MobilePage(), desktopPage: DesktopPage(), tabletPage: TabletPage(),
          home: TabletPage(),
        );
      }
    });
  }
}
