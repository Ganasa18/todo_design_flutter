import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../blocs/exports_bloc.dart';
import '../static/static_data.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key,
    // required this.currentDateTime,
  }) : super(key: key);

  // final DateTime currentDateTime;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    CurrentDateCubit cubit = context.read<CurrentDateCubit>();
    // List<DateTime> currentMonthList = cubit.currentMonthList;
    DateTime currentDateTime = cubit.currentDateTime;

    return BlocBuilder<CurrentDateCubit, CurrentDateState>(
      builder: (context, state) {
        final dateUpdate =
            state is SetDateState ? (state).dateNow : currentDateTime;
        // final dateScrollUpdate =
        //     state is SetDateScroll ? (state).dateNowScroll : currentDateTime;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat.MMMM().format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat.d().format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Text(
                      '10 task today',
                      style: TextStyle(
                        color: Color.fromARGB(255, 127, 134, 146),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size.infinite,
                  backgroundColor: Constants.colorBg.withOpacity(0.8),
                ),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: dateUpdate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030),
                  ).then(
                    (date) {
                      setState(() {
                        if (date != null) {
                          cubit.setDateNow(date);
                          cubit.setMonthList(date);
                          cubit.setScrollTodate(date);
                        } else {
                          cubit.setDateNow(DateTime.now());
                          cubit.setMonthList(DateTime.now());
                          cubit.setScrollTodate(DateTime.now());
                        }
                      });
                    },
                  );
                },
                icon: const Icon(
                  Icons.date_range,
                  color: Colors.white,
                ),
                label: Text(
                  DateFormat.yMd().format(
                    dateUpdate,
                  ),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
