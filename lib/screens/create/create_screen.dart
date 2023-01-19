// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_todo_test/models/TagModel.dart';
import 'package:my_todo_test/static/static_data.dart';

import '../../blocs/exports_bloc.dart';
import '../../widget/date_picker_widget.dart';
import '../../widget/horizontal_custom_date.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});
  static const id = "new-task-screen";

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  List<TagModel> pickItems = [];
  // DateTime currentDateTime = DateTime.now();
  // List<DateTime> currentMonthList = List.empty();
  // late ScrollController scrollController;
  // DateTime? _dateTime;

  @override
  void initState() {
    super.initState();
    // currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    // currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    // currentMonthList = currentMonthList.toSet().toList();
    // scrollController =
    //     ScrollController(initialScrollOffset: 60.0 * currentDateTime.day);
  }

  @override
  Widget build(BuildContext context) {
    // void initState() {
    //   super.initState();
    //   currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    //   currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    //   currentMonthList = currentMonthList.toSet().toList();
    //   scrollController =
    //       ScrollController(initialScrollOffset: 60.0 * currentDateTime.day);
    // }

    // var cubit = CurrentDateCubit.get(context);
    CurrentDateCubit cubit = context.read<CurrentDateCubit>();
    // late ScrollController scrollController = cubit.scrollController;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: pickItems.length > 5
                ? screenHeight * 1.24
                : screenHeight * 1.22,
            width: screenWidth,
            child: BlocBuilder<CurrentDateCubit, CurrentDateState>(
              builder: (context, stateDate) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Center(
                        child: Text(
                          'Add Task',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const DatePickerWidget(),
                    const SizedBox(height: 15),
                    const SizedBox(height: 5),
                    BlocBuilder<DarkModeCubit, bool>(
                      builder: (context, state) {
                        return HorizontalCustomDate(
                          screenWidth: screenWidth,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // DEVIDER
                    Container(
                      width: screenWidth,
                      height: 20,
                      child: Stack(
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            width: screenWidth * 0.75,
                            height: 1,
                            color: Colors.amber,
                          ),
                          Positioned(
                            left: screenWidth * 0.25,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.amberAccent,
                                      blurRadius: 1.0,
                                      spreadRadius: 0.5,
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FORM TITLE TASK
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: TextStyle(color: Constants.colorWhite),
                        decoration: InputDecoration(
                          labelText: 'Task title',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Constants.colorWhite,
                          ),
                          contentPadding: EdgeInsets.only(bottom: 0, top: 50),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 5,
                            style: const TextStyle(color: Constants.colorWhite),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Tag Select',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 100,
                      width: screenWidth,
                      // color: Colors.amber,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...List.generate(
                            tagList.length,
                            (index) => Tags(
                                tag: tagList[index],
                                onSelected: (bool value) {
                                  if (value) {
                                    pickItems.add(tagList[index]);
                                  } else {
                                    pickItems.remove(tagList[index]);
                                  }
                                  // pass function
                                  setState(() {});
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 80,
                      width: screenWidth,
                      child: Wrap(
                        runSpacing: 4.0,
                        spacing: 10.0,
                        children: [
                          ...List.generate(
                            pickItems.length,
                            (index) => PickItem(title: pickItems[index].title),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    pickItems.length >= 5
                        ? const SizedBox(height: 30)
                        : const SizedBox(),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        width: screenWidth * 0.6,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Constants.colorOrange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text('Create Task'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PickItem extends StatelessWidget {
  const PickItem({
    Key? key,
    // required this.pickItems,
    required this.title,
  }) : super(key: key);

  // final List<TagModel> pickItems;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Chip(
        label: Text(title),
      ),
    );
  }
}

class Tags extends StatefulWidget {
  const Tags({
    Key? key,
    required this.tag,
    required this.onSelected,
  }) : super(key: key);
  final TagModel tag;
  final ValueChanged<bool> onSelected;

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isSelected = !_isSelected;
        // callback
        widget.onSelected(_isSelected);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.colorOrange,
                border: _isSelected
                    ? Border.all(
                        width: 3,
                        color: Colors.amberAccent.withOpacity(0.6),
                      )
                    : null,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.amberAccent,
                    blurRadius: 1.0,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Icon(
                widget.tag.iconData,
                size: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.tag.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ItemTag extends StatefulWidget {
//   const ItemTag({
//     super.key,
//     required this.tag,
//     required this.onSelected,
//   });

//   final TagModel tag;
//   final ValueChanged<bool> onSelected;

//   @override
//   State<ItemTag> createState() => _ItemTagState();
// }

// class _ItemTagState extends State<ItemTag> {
//   bool _isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _isSelected = !_isSelected;
//         // callback
//         widget.onSelected(_isSelected);
//       },
//       child: Container(
//         margin: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   width: 2,
//                   color: Colors.orange,
//                 ),
//               ),
//               child: Icon(
//                 widget.tag.iconData,
//                 size: 15,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               widget.tag.title,
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class DatePickerWidget extends StatefulWidget {
//   const DatePickerWidget({
//     Key? key,
//     required this.currentDateTime,
//   }) : super(key: key);

//   final DateTime currentDateTime;

//   @override
//   State<DatePickerWidget> createState() => _DatePickerWidgetState();
// }

// class _DatePickerWidgetState extends State<DatePickerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const SizedBox(),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(
//               maximumSize: Size.infinite,
//               backgroundColor: Constants.colorBg.withOpacity(0.8),
//             ),
//             onPressed: () {
//               showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2030),
//               ).then(
//                 (date) {
//                   // setState(() {
//                   //   if (date != null) {
//                   //     cubit.setDateNow(date);
//                   //     cubit.setMonthList(date);
//                   //   } else {
//                   //     cubit.setDateNow(DateTime.now());
//                   //     cubit.setMonthList(DateTime.now());
//                   //   }
//                   // });
//                 },
//               );
//             },
//             icon: const Icon(
//               Icons.date_range,
//               color: Colors.white,
//             ),
//             label: Text(
//               DateFormat.yMd().format(
//                 widget.currentDateTime,
//               ),
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class HorizontalCustomDate extends StatefulWidget {
//   const HorizontalCustomDate({
//     Key? key,
//     required this.screenWidth,
//     required this.scrollController,
//     required this.currentMonthList,
//     required this.currentDateTime,
//   }) : super(key: key);

//   final double screenWidth;
//   final ScrollController scrollController;
//   final List<DateTime> currentMonthList;
//   final DateTime currentDateTime;

//   @override
//   State<HorizontalCustomDate> createState() => _HorizontalCustomDateState();
// }

// class _HorizontalCustomDateState extends State<HorizontalCustomDate> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: widget.screenWidth,
//       height: 90,
//       child: ListView.builder(
//         controller: widget.scrollController,
//         itemCount: widget.currentMonthList.length,
//         scrollDirection: Axis.horizontal,
//         physics: const ClampingScrollPhysics(),
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // setState(() {
//               //   cubit.setDateNow(currentMonthList[index]);
//               //   // currentDateTime = currentMonthList[index];
//               // });
//             },
//             child: Container(
//               margin:
//                   const EdgeInsets.only(left: 5, right: 5),
//               width: 46,
//               height: 100,
//               decoration: state
//                   ? BoxDecoration(
//                       borderRadius:
//                           widget.currentMonthList[index].day !=
//                                   widget.currentDateTime.day
//                               ? null
//                               : BorderRadius.circular(50),
//                       color: widget.currentMonthList[index].day !=
//                               widget.currentDateTime.day
//                           ? null
//                           : Constants.colorOrange,
//                     )
//                   : BoxDecoration(
//                       color: widget.currentMonthList[index].day !=
//                               widget.currentDateTime.day
//                           ? Constants.colorWhite
//                           : Constants.colorOrange,
//                       borderRadius:
//                           widget.currentMonthList[index].day !=
//                                   widget.currentDateTime.day
//                               ? null
//                               : BorderRadius.circular(50),
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 0,
//                       ),
//                       boxShadow: [
//                         widget.currentMonthList[index].day !=
//                                 widget.currentDateTime.day
//                             ? const BoxShadow()
//                             : BoxShadow(
//                                 color: Colors.grey
//                                     .withOpacity(0.4),
//                                 // offset: const Offset(0.0, 0.0),
//                                 blurRadius: 2.0,
//                                 spreadRadius: 1.0,
//                               ),
//                       ],
//                     ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     widget.currentMonthList[index].day.toString(),
//                     style: TextStyle(
//                       color: widget.currentMonthList[index].day !=
//                               widget.currentDateTime.day
//                           ? null
//                           : Constants.colorWhite,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                       date_util.DateUtils.weekdays[
//                           widget.currentMonthList[index].weekday -
//                               1],
//                       style: widget.currentMonthList[index].day !=
//                               widget.currentDateTime.day
//                           ? const TextStyle(
//                               fontWeight: FontWeight.w600)
//                           : const TextStyle(
//                               color: Constants.colorWhite,
//                               fontWeight: FontWeight.w600)),
//                   const SizedBox(height: 8),
//                   Container(
//                     height: 6,
//                     width: 6,
//                     decoration: BoxDecoration(
//                       color: widget.currentMonthList[index].day !=
//                               widget.currentDateTime.day
//                           ? null
//                           : Constants.colorWhite,
//                       borderRadius: BorderRadius.circular(50),
//                       boxShadow: [
//                         widget.currentMonthList[index].day !=
//                                 widget.currentDateTime.day
//                             ? state
//                                 ? const BoxShadow(
//                                     color: Constants.colorBg)
//                                 : const BoxShadow(
//                                     color:
//                                         Constants.colorWhite)
//                             : BoxShadow(
//                                 color: Colors.white
//                                     .withOpacity(0.5),
//                                 offset:
//                                     const Offset(0.0, 0.0),
//                                 blurRadius: 4.0,
//                                 spreadRadius: 2.0,
//                               ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
