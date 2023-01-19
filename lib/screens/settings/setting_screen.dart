import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_todo_test/blocs/exports_bloc.dart';
import 'package:my_todo_test/service/app_theme.dart';

import '../../static/static_data.dart';
import '../home/drawer_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  static const id = "setting-screen";

  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      menuScreen: DrawerScreen(),
      mainScreen: Settings(),
      borderRadius: 30,
      showShadow: true,
      menuBackgroundColor: Constants.colorOrange,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      angle: 0.0,
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BlocBuilder<DarkModeCubit, bool>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(Icons.menu,
                  color: state ? Constants.colorWhite : Constants.colorOrange),
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
            );
          },
        ),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Theme Settings',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: screenHeight * 0.25,
              width: screenWidth,
              child: BlocBuilder<DarkModeCubit, bool>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: AppTheme.values.length,
                    itemBuilder: (context, index) {
                      final singleTheme = AppTheme.values[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        width: screenWidth / 2.4,
                        height: screenHeight * 0.24,
                        decoration: BoxDecoration(
                          // color: Constants.colorSecondary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: screenWidth,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/${singleTheme.name == 'lightTheme' ? 'light.png' : 'dark.png'}'),
                                    ),
                                  ),
                                ),
                                // Text('Image'),
                                const Spacer(),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          singleTheme.name == 'lightTheme'
                                              ? Colors.grey
                                              : Constants.colorBg,
                                    ),
                                    onPressed: () {
                                      if (index == 0) {
                                        BlocProvider.of<DarkModeCubit>(context)
                                            .toggleTheme(value: false);
                                      } else {
                                        BlocProvider.of<DarkModeCubit>(context)
                                            .toggleTheme(value: true);
                                      }
                                    },
                                    child: Text(
                                      singleTheme.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Constants.colorWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
