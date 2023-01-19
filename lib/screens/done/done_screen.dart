import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../static/static_data.dart';
import '../export_screen.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  static const id = "done-screen";

  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      menuScreen: DrawerScreen(),
      mainScreen: Done(),
      borderRadius: 30,
      showShadow: true,
      menuBackgroundColor: Constants.colorOrange,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      angle: 0.0,
    );
  }
}

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
      ),
      backgroundColor: Constants.colorBg,
      body: const Center(
        child: Text('Done Screen'),
      ),
    );
  }
}
