import 'package:flutter/material.dart';
import '../../utils/date_utils.dart' as date_util;
import '../blocs/exports_bloc.dart';
import '../static/static_data.dart';

class HorizontalCustomDate extends StatefulWidget {
  const HorizontalCustomDate({
    Key? key,
    required this.screenWidth,
    // required this.currentMonthList,
    // required this.currentDateTime,
  }) : super(key: key);

  final double screenWidth;
  // final ScrollController scrollController;
  // final List<DateTime> currentMonthList;
  // final DateTime currentDateTime;

  @override
  State<HorizontalCustomDate> createState() => _HorizontalCustomDateState();
}

class _HorizontalCustomDateState extends State<HorizontalCustomDate> {
  @override
  Widget build(BuildContext context) {
    // var cubit = CurrentDateCubit.get(context);
    CurrentDateState stateWatch = context.watch<CurrentDateCubit>().state;
    CurrentDateCubit cubit = context.read<CurrentDateCubit>();
    List<DateTime> currentMonthList = cubit.currentMonthList;
    DateTime currentDateTime = cubit.currentDateTime;
    double jumpToDouble;
    late ScrollController scrollController =
        context.watch<CurrentDateCubit>().scrollController;

    return BlocBuilder<CurrentDateCubit, CurrentDateState>(
      builder: (context, stateDate) {
        final dateUpdate = stateDate is SetDateScroll
            ? (stateDate).dateNowScroll
            : currentDateTime;
        // cubit.setScrollTodateUpdate(dateUpdate);
        // if (stateDate is SetDateScroll) {
        // }

        void scrollUpdate() {
          if (dateUpdate.day <= 7) {
            jumpToDouble = 10.0;
          } else if (dateUpdate.day <= 14) {
            jumpToDouble = 30.0;
          } else if (dateUpdate.day <= 21) {
            jumpToDouble = 40.0;
          } else if (dateUpdate.day <= 28) {
            jumpToDouble = 50.0;
          } else {
            jumpToDouble = 60.0;
          }
          // scrollController.jumpTo(1.0 * dateUpdate.day);
          scrollController.animateTo(jumpToDouble * dateUpdate.day,
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceIn);
        }

        if (stateDate is SetDateScroll) {
          WidgetsBinding.instance.addPostFrameCallback((_) => scrollUpdate());
        }

        // print('$stateDate new state');
        // if (scrollController.hasClients) if (stateDate is SetDateScroll) {
        //   scrollController.jumpTo(60.0 * dateUpdate.day);
        // }

        return SizedBox(
          width: widget.screenWidth,
          height: 90,
          child: ListView.builder(
            controller: scrollController,
            itemCount: currentMonthList.length,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    cubit.setDateNow(currentMonthList[index]);
                  });
                },
                child: BlocBuilder<DarkModeCubit, bool>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      width: 46,
                      height: 100,
                      decoration: state
                          ? BoxDecoration(
                              borderRadius: currentMonthList[index].day !=
                                      currentDateTime.day
                                  ? null
                                  : BorderRadius.circular(50),
                              color: currentMonthList[index].day !=
                                      currentDateTime.day
                                  ? null
                                  : Constants.colorOrange,
                            )
                          : BoxDecoration(
                              color: currentMonthList[index].day !=
                                      currentDateTime.day
                                  ? Constants.colorWhite
                                  : Constants.colorOrange,
                              borderRadius: currentMonthList[index].day !=
                                      currentDateTime.day
                                  ? null
                                  : BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.white,
                                width: 0,
                              ),
                              boxShadow: [
                                currentMonthList[index].day !=
                                        currentDateTime.day
                                    ? const BoxShadow()
                                    : BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        // offset: const Offset(0.0, 0.0),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                      ),
                              ],
                            ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentMonthList[index].day.toString(),
                            style: TextStyle(
                              color: currentMonthList[index].day !=
                                      currentDateTime.day
                                  ? null
                                  : Constants.colorWhite,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                              date_util.DateUtils.weekdays[
                                  currentMonthList[index].weekday - 1],
                              style: currentMonthList[index].day !=
                                      currentDateTime.day
                                  ? const TextStyle(fontWeight: FontWeight.w600)
                                  : const TextStyle(
                                      color: Constants.colorWhite,
                                      fontWeight: FontWeight.w600)),
                          const SizedBox(height: 8),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color: currentMonthList[index].day !=
                                      currentDateTime.day
                                  ? null
                                  : Constants.colorWhite,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                currentMonthList[index].day !=
                                        currentDateTime.day
                                    ? state
                                        ? const BoxShadow(
                                            color: Constants.colorBg)
                                        : const BoxShadow(
                                            color: Constants.colorWhite)
                                    : BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 4.0,
                                        spreadRadius: 2.0,
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
