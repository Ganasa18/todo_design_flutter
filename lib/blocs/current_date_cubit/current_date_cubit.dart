import 'package:flutter/material.dart';

import '../exports_bloc.dart';
import '../../utils/date_utils.dart' as date_util;
part 'current_date_state.dart';

class CurrentDateCubit extends Cubit<CurrentDateState> {
  CurrentDateCubit() : super(CurrentDateInitial());

  static CurrentDateCubit get(context) => BlocProvider.of(context);

  DateTime currentDateTime = DateTime.now();
  List<DateTime> currentMonthList = List.empty();
  late ScrollController scrollController;

  setDateNow(DateTime date) {
    currentDateTime = date;

    emit(SetDateState(date));
  }

  setScrollTodate(DateTime date) {
    scrollController = ScrollController(initialScrollOffset: 60.0 * date.day);
  }

  setScrollTodateUpdate(DateTime date) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(60.0 * date.day);
    }
  }

  setMonthList(DateTime date) {
    currentMonthList = date_util.DateUtils.daysInMonth(date);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    emit(SetDateScroll(date));
  }

  // setDatePick(BuildContext context) {
  //   showDatePicker(
  //     context: context,
  //     initialDate: currentDateTime,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2030),
  //   ).then((value) {
  //     if (value != null) {
  //       currentDateTime = value;
  //     }
  //     emit(SetDateState());
  //   });
  // }
}
