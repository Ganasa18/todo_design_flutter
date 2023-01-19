part of 'switch_theme_bloc.dart';

abstract class SwitchThemeEvent extends Equatable {
  const SwitchThemeEvent();
}

class SwitchThemeChanged extends SwitchThemeEvent {
  final AppTheme theme;

  const SwitchThemeChanged({required this.theme});

  @override
  List<Object> get props => [theme];
}
