import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_test/blocs/exports_bloc.dart';
import '../../static/static_data.dart';
import 'dart:math' as math;
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../widget/search_filter.dart';
import '../../widget/user_name_home.dart';
import '../export_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      menuScreen: DrawerScreen(),
      mainScreen: Home(),
      borderRadius: 30,
      showShadow: true,
      menuBackgroundColor: Constants.colorOrange,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      angle: 0.0,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NewTaskScreen.id);
        },
        backgroundColor: Constants.colorOrange,
        child: const Icon(
          Icons.add,
          color: Constants.colorWhite,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BlocBuilder<DarkModeCubit, bool>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: state ? Constants.colorWhite : Constants.colorOrange,
              ),
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
            );
          },
        ),
      ),
      // backgroundColor: Constants.colorBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WidgetUserNameHome(),
                  BlocBuilder<DarkModeCubit, bool>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: state
                                  ? Constants.colorSecondary.withOpacity(0.6)
                                  : Constants.colorSecondary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Positioned(
                            left: 8,
                            top: 8,
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                color: Constants.colorOrange,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                      color: Constants.colorWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const Text(
                '10 task pending',
                style: TextStyle(
                  color: Constants.colorOrange,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 30),
              WidgetSearchFilter(screenWidth: screenWidth),
              const SizedBox(height: 30),
              Container(
                width: screenWidth,
                margin: const EdgeInsets.only(left: 2),
                child: const Text(
                  'Tag List',
                  style: TextStyle(
                    // color: Constants.colorWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ListCategories(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              const SizedBox(height: 30),
              Container(
                width: screenWidth,
                margin: const EdgeInsets.only(left: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ongoing Task',
                      style: TextStyle(
                        // color: Constants.colorWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                      ),
                    ),
                    Text(
                      'view all',
                      style: TextStyle(
                        color: Constants.colorOrange,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              WidgetOngoingTodo(
                  screenWidth: screenWidth, screenHeight: screenHeight),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetOngoingTodo extends StatelessWidget {
  const WidgetOngoingTodo({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          margin: const EdgeInsets.only(bottom: 15),
          width: screenWidth,
          height: screenHeight * 0.22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Constants.colorSecondary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Title Text ${index + 1}",
                      style: const TextStyle(
                          color: Constants.colorWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          letterSpacing: 0.6),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          '5 Tag',
                          style: TextStyle(
                            color: Constants.colorWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                width: screenWidth * 0.5,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur sit maet,Lorem Lorem ips, dolor sit amet const al',
                  style: TextStyle(
                    color: Constants.colorWhite,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.alarm, color: Constants.colorOrange),
                  const SizedBox(width: 8),
                  Text(
                    'Date : ${DateFormat.MMMEd().format(DateTime.now())}',
                    style: const TextStyle(
                        color: Constants.colorWhite,
                        fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.24,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                width: screenWidth / 2.4,
                height: screenHeight * 0.24,
                decoration: BoxDecoration(
                  color: Constants.colorSecondary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.05,
                      spreadRadius: 0.05,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mobile Apps',
                        style: TextStyle(
                          color: Constants.colorWhite,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '10 Task',
                        style: TextStyle(
                          color: Constants.colorWhite.withOpacity(0.6),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                width: screenWidth / 2.4,
                height: screenHeight * 0.24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Constants.colorSecondary.withOpacity(0.05),
                      Constants.colorWhite.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                bottom: -50,
                right: 15,
                child: SizedBox(
                  width: screenWidth / 2.1,
                  height: screenHeight * 0.24,
                  child: const Image(
                    image: AssetImage(Constants.bgImageHome),
                  ),
                ),
              ),
              Positioned(
                bottom: -38,
                left: 30,
                child: SizedBox(
                  width: screenWidth / 3.8,
                  height: screenHeight * 0.24,
                  child: Image(
                    image: AssetImage('assets/images/person_${index + 1}.png'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
