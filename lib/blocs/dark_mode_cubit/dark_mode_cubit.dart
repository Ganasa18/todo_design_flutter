import 'package:equatable/equatable.dart';
import '../exports_bloc.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends HydratedCubit<bool> {
  DarkModeCubit() : super(true);

  void toggleTheme({required bool value}) {
    emit(value);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json["isDark"];
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {
      "isDark": state,
    };
  }
}
