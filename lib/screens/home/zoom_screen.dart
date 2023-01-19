import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'drawer_screen.dart';
import 'home_screen.dart';

class ZoomDrawerWidget extends StatefulWidget {
  const ZoomDrawerWidget({super.key});

  @override
  State<ZoomDrawerWidget> createState() => _ZoomDrawerWidgetState();
}

class _ZoomDrawerWidgetState extends State<ZoomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
        menuScreen: DrawerScreen(), mainScreen: HomeScreen());
  }
}
