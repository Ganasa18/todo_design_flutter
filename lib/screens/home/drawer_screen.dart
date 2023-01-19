import 'package:flutter/material.dart';
import 'package:my_todo_test/screens/export_screen.dart';
import 'package:my_todo_test/static/static_data.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.colorOrange,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.2),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.id);
              },
              child: const ListTile(
                leading: Icon(
                  Icons.home,
                  color: Constants.colorWhite,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Constants.colorWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(DoneScreen.id);
              },
              child: const ListTile(
                leading: Icon(
                  Icons.done,
                  color: Constants.colorWhite,
                ),
                title: Text(
                  'Done',
                  style: TextStyle(
                    color: Constants.colorWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).pushReplacementNamed(LandingScreen.id);
              },
              child: const ListTile(
                leading: Icon(
                  Icons.archive,
                  color: Constants.colorWhite,
                ),
                title: Text(
                  'Archive',
                  style: TextStyle(
                    color: Constants.colorWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(SettingScreen.id);
              },
              child: const ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Constants.colorWhite,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: Constants.colorWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
