// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_todo_test/screens/export_screen.dart';

import '../../blocs/exports_bloc.dart';
import '../../static/static_data.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const id = "landing-screen";

  @override
  Widget build(BuildContext context) {
    print('Build');
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // SwitchThemeBloc myTheme = context.read<SwitchThemeBloc>();

    var borderRadius2 = const BorderRadius.only(
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    );

    const textStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 25,
      letterSpacing: 1,
    );

    IconData iconLight = Icons.wb_sunny;
    IconData iconDark = Icons.nights_stay;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                BlocBuilder<DarkModeCubit, bool>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        const Text(
                          'Logo Apps',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(state ? iconDark : iconLight),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 35),
                const Text(
                  'Manage your',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 5),
                const Text('task & everything', style: textStyle),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Text(
                      'with',
                      style: textStyle,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'MyTask',
                      style: TextStyle(
                        color: Constants.colorOrange,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(Constants.landingImage),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 260,
                  child: const Text(
                    "Lorem ipsum dolor sit amet,labore et dolore magna aliqua.proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(
                      // color: Constants.colorWhite.withOpacity(0.8),
                      letterSpacing: 0.6,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: ButtonGetStarted(
                    borderRadius2: borderRadius2,
                    screenWidth: screenWidth,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({
    Key? key,
    required this.borderRadius2,
    required this.screenWidth,
  }) : super(key: key);

  final BorderRadius borderRadius2;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius2,
      color: Constants.colorOrange,
      child: InkWell(
        borderRadius: borderRadius2,
        onTap: () {
          Navigator.of(context).pushNamed(HomeScreen.id);
        },
        child: Container(
          width: screenWidth * 0.5,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: borderRadius2,
          ),
          child: const Center(
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 18,
                color: Constants.colorWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
