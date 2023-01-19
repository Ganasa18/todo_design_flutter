// ignore_for_file: non_constant_identifier_names

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_test/service/app_theme.dart';

part 'switch_theme_event.dart';
part 'switch_theme_state.dart';

class SwitchThemeBloc extends Bloc<SwitchThemeEvent, SwitchThemeState> {
  SwitchThemeBloc()
      : super(SwitchThemeState(themeData: appThemeData[AppTheme.lightTheme]!)) {
    on<SwitchThemeEvent>(_themeChanged);

    // on<SwitchOnEvent>(_themeChanged);
  }

  void _themeChanged(SwitchThemeEvent event, Emitter<SwitchThemeState> emit) {
    if (event is SwitchThemeChanged) {
      emit.call(SwitchThemeState(themeData: appThemeData[event.theme]!));
    }
  }
}
