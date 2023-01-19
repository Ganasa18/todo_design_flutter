part of 'current_date_cubit.dart';

abstract class CurrentDateState {}

class CurrentDateInitial extends CurrentDateState {}

class SetDateState extends CurrentDateState {
  final DateTime _dateNow;
  SetDateState(this._dateNow);
  List<Object> get props => [_dateNow];

  // total count
  DateTime get dateNow => _dateNow;
}

class SetDateScroll extends CurrentDateState {
  final DateTime _dateScroll;
  SetDateScroll(this._dateScroll);
  List<Object> get props => [_dateScroll];

  // total count
  DateTime get dateNowScroll => _dateScroll;
}
