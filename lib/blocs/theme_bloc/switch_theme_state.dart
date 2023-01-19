part of 'switch_theme_bloc.dart';

class SwitchThemeState extends Equatable {
  final ThemeData themeData;
  //  final bool switchValue;
  const SwitchThemeState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}
