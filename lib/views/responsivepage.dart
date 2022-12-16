import 'package:flutter/material.dart';

class ResponsivePage extends StatefulWidget {
  final Widget mobilePage;
  final Widget tabletPage;
  final Widget desktopPage;

  const ResponsivePage(
      {super.key,
      required this.mobilePage,
      required this.tabletPage,
      required this.desktopPage});

  @override
  State<ResponsivePage> createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.maxWidth < 500) {
          return widget.mobilePage;
        } else if (sizingInformation.maxWidth < 1000) {
          return widget.tabletPage;
        } else {
          return widget.desktopPage;
        }
      },
    );
  }
}
